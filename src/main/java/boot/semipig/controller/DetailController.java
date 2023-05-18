package boot.semipig.controller;

import boot.semipig.dto.*;
import boot.semipig.service.DetailService;
import boot.semipig.service.LoginService;
import boot.semipig.service.ReviewService;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


@Controller
public class DetailController {
    //네이버 버켓 사용
    @Autowired
    private NcpObjectStorageService storageService;
    private String bucketName="pig701-bucket";


    @Autowired
    LoginService loginService;//사용자 정보
    @Autowired
    DetailService detailService;//가게 정보
    //가게 홍보글
    @Autowired
    ReviewService reviewService;//리뷰 띄우기


    @GetMapping("/detail")//디테일 페이지에서 가게 정보 띄우기
    public String detail(Model model, Integer food_idx, HttpSession session)
    {
        System.out.println("Controller food_idx="+food_idx);

        DetailDto dto=detailService.selectFood(food_idx);
        model.addAttribute("dto", dto);

        //추가
        Integer user_idx= (Integer)session.getAttribute("loginidx");
        System.out.println(user_idx);

        int count = detailService.getBookmarkCount(user_idx, food_idx);
        //System.out.println(count);
        model.addAttribute("count",count);

        return "/detail/detail";
    }

    @PostMapping("/insertreview")//리뷰 업로드
    public String reviewInsert(ReviewDto dto, List<MultipartFile> upload)
    {
        System.out.println("test!!!!");
        //사진 외의 다른 리뷰데이터들부터 먼저 db에 저장. 별도로 dto와 메서드를 만들어놓았기 때문에 가능
        reviewService.insertReview(dto);
        System.out.println("score: "+dto.getScore());
        System.out.println("review_idx:"+dto.getReview_idx());

        System.out.println(upload);
        if(upload!=null&&!upload.get(0).getOriginalFilename().equals(""))//null값인 경우 사진은 업로드하지 않음.
        {

            for(MultipartFile mfile:upload)
            {
                //스토리지에 업로드하기
                String photoname=storageService.uploadFile(bucketName, "review", mfile);
                //업로드한 파일명을 db에 저장
                ReviewPhotoDto pdto=new ReviewPhotoDto();
                pdto.setReview_idx(dto.getReview_idx());
                pdto.setPhotoname(photoname);
                reviewService.insertPhoto(pdto);
            }
        }
        return "redirect:detail?food_idx="+dto.getFood_idx();
    }

    @GetMapping("/showreview")//디테일 페이지에서 리뷰를 ajax를 통해 보여줌
    @ResponseBody public List<ReviewDto> showReview(int food_idx){
        List<ReviewDto> list=reviewService.getAllReview(food_idx);
        for(ReviewDto dto:list)
        {
            int pidx=dto.getReview_idx();
            List<ReviewPhotoDto> plist=reviewService.getPhotos(pidx);
            dto.setPhotoList(plist);

            int lidx=reviewService.getUserNum(dto.getReview_idx());
            LoginDto ldto=loginService.getUserInfo(lidx);
            System.out.println(ldto.getUser_name());
            System.out.println(ldto.getId());
            dto.setUser_id(ldto.getId());
            dto.setUser_name(ldto.getUser_name());
            dto.setUser_photo(ldto.getUser_photo());

        }

        return list;
    }

    @GetMapping("/delete")//리뷰 삭제
    @ResponseBody public void delete(int review_idx)
    {
        //방명록 삭제전 그 글에 연결된 모든 사진부터 스토리지에서 삭제하기
        List<String> list=reviewService.getAllPhoto(review_idx);
        for(String photoname:list)
        {
            storageService.deleteFile(bucketName, "review", photoname);
        }
        //db 에서 글삭제
        //on delete cacade 설정시 외부키로 연결된 데이타들은 자동으로 삭제된다
        reviewService.deleteReview(review_idx);
    }
   /* @GetMapping("/updateform")//리뷰 수정 페이지
    public String updateform(Model model, int food_idx, int review_idx)
    {
        DetailDto fdto=detailService.selectFood(food_idx);
        model.addAttribute("fdto", fdto);
        ReviewDto rdto=reviewService.selectReview(review_idx);
        List<ReviewPhotoDto> plist=reviewService.getPhotos(review_idx);
        rdto.setPhotoList(plist);
        model.addAttribute("rdto", rdto);
        return "/detail/updateform";
    }
*/
    @GetMapping("/selectonereview")
    @ResponseBody public ReviewDto selectOneReview(Model model, int review_idx){
        ReviewDto dto=reviewService.selectReview(review_idx);
        List<ReviewPhotoDto> photolist=reviewService.getPhotos(review_idx);
        dto.setPhotoList(photolist);
        return dto;
    }
    @PostMapping("/updatereview")//리뷰 수정한 것 업로드
    public String reviewUpdate(ReviewDto dto, List<MultipartFile> upload)
    {
        //어느 시점에 스토리지에 있는걸 삭제해야할지..
        System.out.println("모달 업데이트 테스트");
        reviewService.updateReview(dto);
        System.out.println("score: "+dto.getScore());
        System.out.println("review_idx:"+dto.getReview_idx());
        System.out.println("reviewtext:"+dto.getReviewtext());

        System.out.println(upload);
        if(upload!=null&&!upload.get(0).getOriginalFilename().equals(""))//null값인 경우 사진은 업로드하지 않음.
        {
            System.out.println("여기 나오나?");

            for(MultipartFile mfile:upload)
            {
                //스토리지에 업로드하기
                String photoname=storageService.uploadFile(bucketName, "review", mfile);
                //업로드한 파일명을 db에 저장
                ReviewPhotoDto pdto=new ReviewPhotoDto();
                pdto.setReview_idx(dto.getReview_idx());
                pdto.setPhotoname(photoname);
                reviewService.updatePhoto(pdto);
            }


        }else{
            //아무것도 사진 없다고 할떄 사진 삭제하기
            reviewService.deletePhoto(dto.getReview_idx());

        }
        //스토리지에 사진 지우기
        List<String> photoList=reviewService.getAllPhoto(dto.getReview_idx());
        for(String photoname:photoList)
        {
            storageService.deleteFile(bucketName, "review", photoname);
        }

        return "redirect:detail?food_idx="+dto.getFood_idx();
    }

    @GetMapping("/nearbystore")//지역 관련 값을 받아와서 그 지역의 인기 맛집 네개 출력(여기서는 전부 보내고 jsp 페이지에서 네개만 출력)
    @ResponseBody public List<DetailDto> nearbystore(String SIGUN_NM)
    {
        //System.out.println("test"+SIGUN_NM);
        List<DetailDto> nlist=detailService.nearbyStore(SIGUN_NM);
        //System.out.println("tt"+nlist);

        return nlist;
    }

    //추가
    @PostMapping("/godetail")
    public String godetail(Model model,
                           int food_idx,
                           String food_type,
                           String restrt_list,
                           int user_idx){
        //history 저장 과정
        //history 갯수 확인
        int historycount = detailService.getHistoryCount(user_idx);
        System.out.println(historycount);

        //history 저장 갯수 설정
        if(historycount>=5){
            detailService.autoHistoryDelete(user_idx);
        }

        //db에 history 저장
        detailService.insertFoodHistory(user_idx, food_type, restrt_list);

        //System.out.println("History saved");

        return "redirect:/detail?food_idx=" + food_idx;
    }
    @GetMapping("/isbookmark")
    @ResponseBody
    public int isbookmark(Integer food_idx, HttpSession session){

        Integer user_idx= (Integer)session.getAttribute("user_idx");
        //System.out.println("food_idx="+food_idx);
        //System.out.println("user_idx="+user_idx);
        int count = detailService.getBookmarkCount(user_idx,food_idx);
        //System.out.println("count="+count);

        return count;
    }

    @GetMapping("/insertBookmark")
    @ResponseBody
    public void insertBookmark(int user_idx, int food_idx){
        detailService.insertBookmark(user_idx,food_idx);
    }

    @GetMapping("/deleteBookmark")
    @ResponseBody
    public void deleteBookmark(int user_idx, int food_idx){
        detailService.deleteBookmark(user_idx,food_idx);
    }

    //주소값 위도 경도로 변환
   /* @GetMapping("/testform")
    public String testform()
    {
        return "detail/testform";
    }*/


}
