package boot.semipig.controller;

import boot.semipig.dto.JoinDto;

import boot.semipig.dto.OwnerpageDto;
import boot.semipig.service.JoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import boot.semipig.service.BusinessService;

import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class BusinessController {

    @Autowired
    JoinService joinService;

    @Autowired
    BusinessService businessService;

    @GetMapping("/business")
    public String business(HttpSession session, HttpServletRequest request)
    {
        String previousUrl = request.getHeader("Referer");
        session.setAttribute("previousUrl", previousUrl);

        return "/business/business";
    }
    @PostMapping("/insert")
    public String insertUser(JoinDto dto){
        joinService.insertUser(dto);
        return "redirect:/business";
    }
    @GetMapping("/isIdAvailable")
    @ResponseBody
    public int isIdAvailable(JoinDto dto) {
        return joinService.isIdAvailable(dto);
    }
    @GetMapping("/existFoodList")
    @ResponseBody
    public int existFoodList(HttpSession session) {
        int user_idx = (int) session.getAttribute("loginidx");
        OwnerpageDto dto = new OwnerpageDto();
        dto.setUser_idx(user_idx);
        return joinService.existFoodList(dto);
    }
    @GetMapping("/selectUserType")
    @ResponseBody
    public int selectUserType(HttpSession session) {
        int user_type = (int) session.getAttribute("user_type");
        return user_type;
    }

}
