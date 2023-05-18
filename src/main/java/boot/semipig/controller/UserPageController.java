package boot.semipig.controller;

import boot.semipig.dto.DetailDto;
import boot.semipig.dto.LoginDto;
import boot.semipig.dto.ReviewDto;
import boot.semipig.dto.SearchDto;
import boot.semipig.mapper.ServiceMapper;
import boot.semipig.service.LoginService;
import boot.semipig.service.MyService;
import boot.semipig.service.UserpageService;
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
        // DTO 객체를 생성하여 세션에서 가져온 정보를 저장

        serviceMapper.getmypage(user_idx);
        DetailDto dto =serviceMapper.getmypage(user_idx);
        LoginDto dtos=loginService.getUserInfo(user_idx);
        dto.setUser_idx(user_idx);
        int totalCount = myservice.getTotalCount();
        model.addAttribute("user_idx", user_idx);
        model.addAttribute("logindto", dtos);
        model.addAttribute("dto", dto);

        model.addAttribute("totalCount", totalCount);
        return "/userpage/myuserpage";
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
