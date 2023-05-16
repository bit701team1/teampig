package boot.semipig.controller;

import boot.semipig.dto.*;
import boot.semipig.service.DetailService;
import boot.semipig.service.SearchService;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpMediaTypeException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

@Controller
public class DetailController {
    //네이버 버켓 사용
    @Autowired
    private NcpObjectStorageService storageService;
    private String bucketName="pig701-bucket";


    @Autowired
    DetailService detailService;


    @PostMapping("/godetail")
    public String godetail(Model model,
                         int food_idx,
                         String food_type,
                         String restrt_list,
                         int user_idx){
        //history 저장 과정
        //history 갯수 확인
        int historycount = detailService.getHistoryCount(user_idx);
        //System.out.println(historycount);

        //history 저장 갯수 설정
        if(historycount>=5){
            detailService.autoHistoryDelete(user_idx);
        }
        
        //db에 history 저장
        detailService.insertFoodHistory(user_idx, food_type, restrt_list);

        //선호 음식 타입 구하기
        String favoriteFood = detailService.getFavoriteFood(user_idx);

        //선호 음식 기반 추천 가게 3개 출력
        //전체 리스트에서 선호 타입으로 랜덤하게 3개 출력함
        List<Integer> recommandFood = detailService.getRecommandFood(favoriteFood);

        System.out.println("History saved");

        return "redirect:/detail";
    }

    @GetMapping("/detail")
    public String detail(Model model, Integer food_idx, HttpSession session){

        Integer user_idx= (Integer)session.getAttribute("user_idx");

        int count = detailService.getBookmarkCount(user_idx,food_idx);
        //System.out.println(count);
        model.addAttribute("count",count);

        return "detail/detail";
    }

    @GetMapping("/isbookmark")
    @ResponseBody
    public int isbookmark(Integer food_idx, HttpSession session){

        Integer user_idx= (Integer)session.getAttribute("user_idx");
        System.out.println("food_idx="+food_idx);
        System.out.println("user_idx="+user_idx);
        int count = detailService.getBookmarkCount(user_idx,food_idx);
        System.out.println("count="+count);

        return count;
    }

    @GetMapping("/insertBookmark")
    @ResponseBody
    public void insertBookmark(int user_idx, int food_idx){
        System.out.println("user_idx = " + user_idx);
        System.out.println("food_idx = " + food_idx);

        detailService.insertBookmark(user_idx,food_idx);
    }

    @GetMapping("/deleteBookmark")
    @ResponseBody
    public void deleteBookmark(int user_idx, int food_idx){
        System.out.println("user_idx = " + user_idx);
        System.out.println("food_idx = " + food_idx);
        detailService.deleteBookmark(user_idx,food_idx);
    }

}