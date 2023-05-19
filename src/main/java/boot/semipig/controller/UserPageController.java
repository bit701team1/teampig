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
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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
    public List<ReviewDto> reviewlist(int user_idx){
        System.out.println(user_idx);
        List<ReviewDto> list = userpageService.getReviewlist(user_idx);
        //System.out.println(list);
        return list;
    }

}
