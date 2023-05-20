package boot.semipig.controller;

import boot.semipig.dto.DetailDto;
import boot.semipig.dto.LoginDto;
import boot.semipig.dto.couponDto;
import boot.semipig.dto.couponlistDto;
import boot.semipig.mapper.ServiceMapper;
import boot.semipig.service.LoginService;


import boot.semipig.service.MyService;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;


@Controller
public class HomeController {
    @Autowired
    private MyService myservice;
    @Autowired
    private ServiceMapper serviceMapper;
    @Autowired
    private LoginService loginService;

    @GetMapping("/home2")
    public String home1(Model model, HttpSession session) {
        int user_idx = (int) session.getAttribute("loginidx");
        int food_idx= myservice.getFoodIdx(user_idx);
        // DTO 객체를 생성하여 세션에서 가져온 정보를 저장
        serviceMapper.getmypage(user_idx);
        DetailDto dto =serviceMapper.getmypage(food_idx);
        LoginDto dtos=loginService.getUserInfo(user_idx);
        dto.setUser_idx(user_idx);
        int totalCount = myservice.getTotalCount(food_idx);
        int reviewcount = myservice.reviewcount(food_idx);
        System.out.println(user_idx);
        model.addAttribute("reviewcount",reviewcount);
        model.addAttribute("user_idx", user_idx);
        model.addAttribute("logindto", dtos);
        model.addAttribute("dto", dto);
        model.addAttribute("totalCount", totalCount);
        return "/main";
    }

    @RequestMapping(value = "/insertcoupon", method = {RequestMethod.GET, RequestMethod.POST})
    //  main은 getmapping이 없어서 따로 이렇게 해줘야함
    @ResponseBody
    void insertcoupon(@RequestBody String jsondata2, HttpSession session) {
        int user_idx = (int) session.getAttribute("loginidx");
        ObjectMapper mapper = new ObjectMapper();
        System.out.println(jsondata2);
        try {
            couponDto[] dtos = mapper.readValue(jsondata2, couponDto[].class);
            for (couponDto dto : dtos) {
                // 데이터베이스에 예약 정보를 조회합니다.
                dto.setUser_idx(user_idx);
                myservice.couponinsert(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


