package boot.semipig.controller;

import java.io.Console;
import java.io.IOException;
import java.util.*;
import javax.servlet.http.HttpSession;

import boot.semipig.dto.*;
import boot.semipig.mapper.ServiceMapper;
import boot.semipig.service.*;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/mypage/")
public class WriteController {
    @Autowired
    private MyService myservice;
    @Autowired
    private ServiceMapper serviceMapper;
    @Autowired
    private OwnerpageService ownerpageService;
    @Autowired

    private QnaService qnaService;
    @Autowired
    private LoginService loginService;
    @Autowired
    private ReviewService reviewService;
    @Autowired
    public NcpObjectStorageService storageService;
    public String bucketName = "pig701-bucket";
    List<String> photoNames=new ArrayList<>();


    @GetMapping("/form")
    public String coupon(Model model, HttpSession session) {
        int user_idx = (int) session.getAttribute("loginidx");
        serviceMapper.getmypage(user_idx);
        LoginDto dtos=loginService.getUserInfo(user_idx);
        List<couponDto> list2 = myservice.couponall();
        int totalCount = myservice.getTotalCount();
        OwnerpageDto odto = ownerpageService.getData(3);
        model.addAttribute("dto",odto);
        model.addAttribute("logindto", dtos);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("list2", list2);
        return "/main/booking/booking";
    }

    @PostMapping("/insert")
    @ResponseBody
    public void insertt(@RequestBody String jsondata, HttpSession session) {
        System.out.println("jsondata=" + jsondata);
        int idx = (int) session.getAttribute("loginidx");
        String username = (String) session.getAttribute("username");
        ObjectMapper mapper = new ObjectMapper();
        try {
            ServiceDto[] dtos = mapper.readValue(jsondata, ServiceDto[].class);
            for (ServiceDto dto : dtos) {
                dto.setUser_idx(idx);
                dto.setUser_name(username);
                myservice.insertt(dto);
            }
        } catch (IOException e) {
            // 예외 처리
        }
    }

    @GetMapping("/deletecoupon")
    public String deletecoupon(int num) {
        myservice.deletecoupon(num);
        return "redirect:form";
    }
    @GetMapping("/review")
    public String review(Model model, HttpSession session) {
        int user_idx = (int) session.getAttribute("loginidx");
        serviceMapper.getmypage(user_idx);
        LoginDto dtos=loginService.getUserInfo(user_idx);
        model.addAttribute("logindto", dtos);
        int totalCount = myservice.getTotalCount();
        model.addAttribute("totalCount", totalCount);
        return "/main/booking/review";
    }
    @GetMapping("/deleteqna")
    public String deleteqna(int qna_idx)
    {
        qnaService.deleteQna(qna_idx);
        return "redirect:qna";
    }
    @GetMapping("/deletereview")//리뷰 삭제
    @ResponseBody String delete(int review_idx)
    {
        reviewService.deleteReview(review_idx);
        return "redirect:review";
    }
    @GetMapping("/reviewajax")
    public @ResponseBody Map<String, Object> review2(@RequestParam(defaultValue = "1") int currentPage, HttpSession session) {
        int food_idx = (int) session.getAttribute("loginidx");
        Map<String, Object> response = new HashMap<>();
        int totalCount = myservice.getTotalCount();
        int totalPage; //총 페이지수
        int perPage = 10; //한 페이지당 보여질 글의 갯수
        int perBlock = 5; //한 블럭당 보여질 페이지의 갯수
        int startNum; //각 페이지에서 보여질 글의 시작번호
        int startPage; //각 블럭에서 보여질 시작 페이지 번호
        int endPage; //각 블럭에서 보여질 끝 페이지번호
        int no; //글 출력시 출력할 시작번호
        //총 페이지 수
        totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1); // 9/3=3+0, 11/3=3+1
        //시작페이지
        startPage = (currentPage - 1) / perBlock * perBlock + 1; //(2-1)/3*3+1=1,(5-1)/3*3+1=4
        //끝페이지
        endPage = startPage + perBlock - 1;
        //이때 문제점...endPage가 totalpage보다 크면 안된다
        if (endPage > totalPage)
            endPage = totalPage;
        //각 페이지의 시작번호 (1페이지:0, 2페이지:3, 3페이지 :6 ...)
        startNum = (currentPage - 1) * perPage;
        //각 글마다 출력할 글번호(예:10개일경우 1페이지: 10, 2페이지 : 20,
        no = totalCount - startNum;
        List<ReviewDto> list = myservice.reviewlist(startNum, perPage, food_idx);
        response.put("totalCount", totalCount);
        response.put("list", list);
        response.put("startPage", startPage);
        response.put("endPage", endPage);
        response.put("totalPage", totalPage);
        response.put("currentPage", currentPage);
        response.put("no", no);

        return response;
    }

    @GetMapping("/qnaajax")
    public @ResponseBody Map<String, Object> qna2(@RequestParam(defaultValue = "1") int currentPage, HttpSession session) {
        int user_idx = (int) session.getAttribute("loginidx");
        Map<String, Object> response = new HashMap<>();
        int totalCount = myservice.getTotalCount();
        int totalPage; //총 페이지수
        int perPage = 10; //한 페이지당 보여질 글의 갯수
        int perBlock = 5; //한 블럭당 보여질 페이지의 갯수
        int startNum; //각 페이지에서 보여질 글의 시작번호
        int startPage; //각 블럭에서 보여질 시작 페이지 번호
        int endPage; //각 블럭에서 보여질 끝 페이지번호
        int no; //글 출력시 출력할 시작번호
        //총 페이지 수
        totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1); // 9/3=3+0, 11/3=3+1
        //시작페이지
        startPage = (currentPage - 1) / perBlock * perBlock + 1; //(2-1)/3*3+1=1,(5-1)/3*3+1=4
        //끝페이지
        endPage = startPage + perBlock - 1;
        //이때 문제점...endPage가 totalpage보다 크면 안된다
        if (endPage > totalPage)
            endPage = totalPage;
        //각 페이지의 시작번호 (1페이지:0, 2페이지:3, 3페이지 :6 ...)
        startNum = (currentPage - 1) * perPage;
        //각 글마다 출력할 글번호(예:10개일경우 1페이지: 10, 2페이지 : 20,
        no = totalCount - startNum;
        List<QnaDto> list = myservice.qnalist(startNum, perPage,user_idx);

        response.put("totalCount", totalCount);
        response.put("list", list);
        response.put("startPage", startPage);
        response.put("endPage", endPage);
        response.put("totalPage", totalPage);
        response.put("currentPage", currentPage);
        response.put("no", no);

        return response;
    }

    @GetMapping("/qna")
    public String qna(Model model, HttpSession session) {
        int user_idx = (int) session.getAttribute("loginidx");
        serviceMapper.getmypage(user_idx);
        LoginDto dtos=loginService.getUserInfo(user_idx);
        int totalCount = myservice.getTotalCount();
        model.addAttribute("logindto", dtos);
        model.addAttribute("totalCount", totalCount);
        return "/main/booking/qna";
    }

    @GetMapping("/infoupdate")
    public String infoupdate(Model model, HttpSession session) {

        int totalCount = myservice.getTotalCount();
        model.addAttribute("totalCount", totalCount);
        int user_idx = (int) session.getAttribute("loginidx");

        serviceMapper.getmypage(user_idx);
        LoginDto dtos=loginService.getUserInfo(user_idx);

        OwnerpageDto dto = ownerpageService.getData(user_idx);
        model.addAttribute("logindto", dtos);
        model.addAttribute("dto", dto);
        return "/main/booking/infoupdate";
    }


    @PostMapping("/U_updateprompt")
    public String U_updateprompt(OwnerpageDto dto) {
        ownerpageService.updatePrompt(dto);
        System.out.println("Npdateprompt: " + dto.getGPT_content());

        // Redirect to the writeform endpoint
        return "redirect:./home2";
    }

    @PostMapping("/W_updateprompt")
    public String W_updateprompt(OwnerpageDto dto) {
        ownerpageService.updatePrompt(dto);
        System.out.println("updateprompt: " + dto.getGPT_content());

        // Redirect to the writeform endpoint
        return "redirect:/home2";
    }
    @PostMapping("/update")
    public String update(OwnerpageDto dto, List<MultipartFile> upload) throws JSONException, IOException {
        //수정
        ownerpageService.updateOwner(dto);

        String openaiResult = ownerpageService.openai(dto.getUser_idx());
        dto.setGPT_content(openaiResult);
        ownerpageService.updatePrompt(dto);
        System.out.println("update:"+openaiResult);
        if (upload != null) {
            System.out.println("size:" + upload.size());
            System.out.println("upload.get(0).getOriginalFilename()=" + upload.get(0).getOriginalFilename());
            for (MultipartFile file : upload) {
                //스토리지에 업로드하기
                String photoname = storageService.uploadFile(bucketName, "foodphoto", file);
                //업로드한 파일명을 DB에 저장
                FoodPhotoDto fdto = new FoodPhotoDto();
                fdto.setUser_idx(dto.getUser_idx());
                fdto.setPhotoname(photoname);
                ownerpageService.insertPhoto(fdto);
            }
        }
        //수정 후 내용보기로 이동
        return "redirect:./infoupdate?user_idx="+dto.getUser_idx();
    }
    @GetMapping("/getphoto")
    @ResponseBody
    public List<OwnerpageDto> getphoto(@RequestParam Optional<Integer> user_idx) {
        if (user_idx.isPresent()) {
            List<OwnerpageDto> list = ownerpageService.getDataPhoto(user_idx.get());
            for (OwnerpageDto dto : list) {
                List<FoodPhotoDto> flist = ownerpageService.getPhotos(user_idx.get());
                dto.setPhotoList(flist);
                System.out.println("1flist:" + flist);
            }
            return list;
        } else {
            return new ArrayList<>(); // food_idx가 없을 경우 빈 리스트 반환
        }
    }
    @RequestMapping(value = "/openai", method = RequestMethod.GET, params = "user_idx")
    public String openai(@RequestParam("user_idx") int user_idx, Model model) throws JSONException, IOException {
        String openaiResult = ownerpageService.openai(user_idx);
        model.addAttribute("openaiResult", openaiResult);
        System.out.println("openai:"+ownerpageService.openai(user_idx));
        return "redirect:./infoupdate";
    }
    //기존 airesult
    @RequestMapping(value="/insertinfo", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Map<String, Object>> insertOwner(OwnerpageDto dto, List<MultipartFile> upload) throws JSONException, IOException{
        System.out.println("insertInfo");
        // 데이터부터 DB에 저장
        ownerpageService.insertOwner(dto);

        // 추가
        String openaiResult = ownerpageService.openai(dto.getUser_idx());
        dto.setGPT_content(openaiResult);
        ownerpageService.updatePrompt(dto);

        if (upload != null) {
            for (MultipartFile file : upload) {
                // 스토리지에 업로드하기
                String photoname = storageService.uploadFile(bucketName, "foodphoto", file);

                // 업로드한 파일명을 DB에 저장
                FoodPhotoDto fdto = new FoodPhotoDto();
                fdto.setUser_idx(dto.getUser_idx());
                fdto.setPhotoname(photoname);
                ownerpageService.insertPhoto(fdto);
            }
        }

//        System.out.println("user_idx "+ dto.getUser_idx());
//        System.out.println("openairesult "+ openaiResult);


        // Create a map to hold the response values
        Map<String, Object> response = new HashMap<>();
        response.put("user_idx", dto.getUser_idx());
        response.put("openaiResult", openaiResult);

        System.out.println("user_idx "+ response.get("user_idx"));
        System.out.println("openairesult "+ response.get("openaiResult"));
        // Return the response map as the response

        return ResponseEntity.ok(response);
    }

    @RequestMapping(value = "/airesult", method = RequestMethod.GET, params= "user_idx")
    public String airesult(Model model, @RequestParam int user_idx) throws IOException, JSONException {
        OwnerpageDto dto = ownerpageService.getData(user_idx);
        model.addAttribute("dto", dto);
//        String aiprompt = ownerpageService.openai(food_idx);
//        model.addAttribute("aiprompt", aiprompt);

        String openaiResult = ownerpageService.openai(user_idx);
//        System.out.println("airesult:"+ownerpageService.openai(food_idx));
//        return openaiResult;
        System.out.println("airesult: " + openaiResult);

//        // Pass the openaiResult to the updateprompt endpoint
        dto.setGPT_content(openaiResult);
        // Redirect to the updateprompt endpoint
        return "redirect:./infoupdate";
//        return openaiResult;
    }

    @GetMapping("/writeform")
    public String writeform(Model model, HttpSession session) {
        int totalCount = myservice.getTotalCount();
        model.addAttribute("totalCount", totalCount);
        int user_idx = (int) session.getAttribute("loginidx");
        System.out.println("user:"+user_idx);
        OwnerpageDto dto = ownerpageService.getData(user_idx);

        model.addAttribute("dto", dto);
        model.addAttribute("user_idx", user_idx);
        System.out.println("user:"+user_idx);
        return "/main/ownerpage/writeform";
    }

    @PostMapping("/insertphoto")
    @ResponseBody
    public void insertphoto(OwnerpageDto dto, List<MultipartFile> upload)
    {
        if (upload != null) {
            System.out.println("size:" + upload.size());
            System.out.println("upload.get(0).getOriginalFilename()=" + upload.get(0).getOriginalFilename());
            for (MultipartFile file : upload) {
                //스토리지에 업로드하기
                String photoname = storageService.uploadFile(bucketName, "foodphoto", file);
                //업로드한 파일명을 DB에 저장
                FoodPhotoDto fdto = new FoodPhotoDto();
                fdto.setFood_idx(dto.getFood_idx());
                fdto.setPhotoname(photoname);
                ownerpageService.insertPhoto(fdto);
            }
        }
        System.out.println("insert upload:"+upload);
    }

    @PostMapping("/upload")
    @ResponseBody public void upload(List<MultipartFile> upload)
    {
        System.out.println("size:"+upload.size());
        System.out.println("filename 0:"+upload.get(0).getOriginalFilename());

        photoNames.clear();
        for(MultipartFile file:upload) {
            //스토리지에 업로드
            String photoname = storageService.uploadFile(bucketName, "foodphoto", file);
            System.out.println("name:"+photoname);
            //업로드한 파일명을 DB에 저장
            photoNames.add(photoname);
        }
    }


    @DeleteMapping("/removephotos/{user_idx}")
    @ResponseBody
    public void deletePhoto(@PathVariable int user_idx) {
        System.out.println("user_idx"+user_idx);
        // Retrieve the photo filename from the database
        List<String> list=ownerpageService.getAllPhoto(user_idx);
//        System.out.println("list"+list.get(0));
        // Delete the photo from the storage
        for(String photoname:list)
        {
//            System.out.println("photo:"+photoname);
            storageService.deleteFile(bucketName,"foodphoto", photoname);
        }
        // Delete the photo from the database
        ownerpageService.removePhotos(user_idx);
//        return "redirect:./infoupdate";
    }

}

