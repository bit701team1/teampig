package boot.semipig.controller;

import boot.semipig.dto.DetailDto;
import boot.semipig.dto.LoginDto;
import boot.semipig.dto.ReviewDto;
import boot.semipig.dto.SearchDto;
import boot.semipig.mapper.ServiceMapper;
import boot.semipig.service.LoginService;
import boot.semipig.service.MyService;
import boot.semipig.service.UserpageService;
import boot.semipig.service.UserpageServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller

public class UserPageController {

    @Autowired
    UserpageService userpageService;
    @Autowired
    private ServiceMapper serviceMapper;
    @Autowired
    private LoginService loginService;
    @Autowired
    private MyService myservice;
    @GetMapping("/userpage")
    public String userpage(HttpSession session, Model model){
        int user_idx = (int) session.getAttribute("loginidx");

        String user_name = userpageService.getNameByIdx(user_idx);
        model.addAttribute("user_name",user_name);

        return "/myuserpage/userpage/myuserpage";
    }

    @GetMapping("/myuserpage/myreview")
    public String myreview(){
        return "/myuserpage/userpage/myreview";
    }
    @GetMapping("/userpage/wishlist")
    public  String wishlist(){
        return "/myuserpage/userpage/wishlist";
    }


    @GetMapping("/bookmarklist")
    @ResponseBody
    public List<SearchDto>  bookmarklist(int user_idx){
        //List에 담아서 idx list로 만듬
        List<Integer> bookmark_food_idx = userpageService.getFoodidx(user_idx);

        List<SearchDto> result = new ArrayList<>();

         for(int idx:bookmark_food_idx){
            List<SearchDto> list=userpageService.getFoodlist(idx);
            result.addAll(list);
        }

        return result;
    }

    @GetMapping("reviewlist")
    @ResponseBody
    public Map<String, Object> reviewlist(int user_idx, @RequestParam(defaultValue = "1") int currentPage, Model model){

        int totalCount = 0;

        int totalPage; //총 페이지 수
        int perPage=5;//한 페이지당 보여질 글의 갯수
        int perBlock=5;//한 블럭당 보여질 페이지 갯수

        int startNum;//각 페이지에서 보여질 글의 시작번호
        int startPage;//각 블럭에서 보여질 시작 페이지번호
        int endPage;//각 블럭에서 보여질 끝 페이지번호

        //각 페이지의 시작번호(1페이지:0, 2페이지:3, 3페이지: 6 ...)
        startNum=(currentPage-1)*perPage;
        totalCount = userpageService.getReviewCount(user_idx);
        totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

        //시작페이지
        startPage=(currentPage-1)/perBlock*perBlock+1; //(2-1)/3*3+1=1, (5-1)/3*3+1=4
        //끝페이지
        endPage=startPage+perBlock-1;
        //이때 문제점은 totalPage가 endPage보다 작으면 안됨
        if(endPage>totalPage)
            endPage=totalPage;

        List<ReviewDto> list = userpageService.getReviewlist(user_idx,startNum, perPage);

        Map<String, Object> resultMap = new HashMap<>();

        resultMap.put("startPage", startPage);
        resultMap.put("endPage", endPage);
        resultMap.put("totalPage", totalPage);
        resultMap.put("currentPage", currentPage);
        resultMap.put("list", list);

        return resultMap;
    }

}
