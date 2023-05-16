package boot.semipig.controller;

import boot.semipig.dto.ReviewDto;
import boot.semipig.dto.SearchDto;
import boot.semipig.service.UserpageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.Console;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserPageController {

    @Autowired
    UserpageService userpageService;
    @GetMapping("/userpage")
    public String userpage(){

        return "/userpage/userpage";
    }

    @GetMapping("bookmarklist")
    @ResponseBody
    public List<SearchDto>  bookmarklist(int user_idx){
        /*//@RequestParam(required = false) Integer user_idx
        int user_idx = (int)session.getAttribute("user_idx");*/

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
        List<ReviewDto> list = userpageService.getReviewlist(user_idx);
        System.out.println(list);
        return list;
    }

}
