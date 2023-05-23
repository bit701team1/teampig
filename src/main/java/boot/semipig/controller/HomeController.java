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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;


@Controller
public class HomeController {
    @Autowired
    private MyService myservice;
    @Autowired
    private ServiceMapper serviceMapper;
    @Autowired
    private LoginService loginService;

    @GetMapping("/storepage")
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
    @ResponseBody
    ResponseEntity<String> insertcoupon(@RequestBody String jsondata2, HttpSession session) {
        int user_idx = (int) session.getAttribute("loginidx");
        ObjectMapper mapper = new ObjectMapper();
        System.out.println(jsondata2);
        try {
            couponDto[] dtos = mapper.readValue(jsondata2, couponDto[].class);
            for (couponDto dto : dtos) {
                // 데이터베이스에 예약 정보를 조회합니다.
                dto.setUser_idx(user_idx);
                        // 현재 시간을 가져옵니다.
                LocalDateTime now = LocalDateTime.now();

                // 쿠폰의 유효기간을 LocalDateTime으로 변환합니다.
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                LocalDateTime couponExpiration =  LocalDateTime.parse(dto.getTime().replace(' ', 'T'),formatter);

                // 쿠폰의 유효기간이 지나지 않았는지 확인합니다.
                if (now.isBefore(couponExpiration) || now.isEqual(couponExpiration)) {
                    myservice.couponinsert(dto);
                } else {
                    return new ResponseEntity<>("쿠폰의 유효기간이 지났습니다.", HttpStatus.BAD_REQUEST);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("쿠폰 등록에 실패했습니다: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>("쿠폰 등록 완료!", HttpStatus.OK);
    }


}

