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
    //  main은 getmapping이 없어서 따로 이렇게 해줘야함
    @ResponseBody
    ResponseEntity<String> insertcoupon(@RequestBody String jsondata2, HttpSession session) {
        int user_idx = (int) session.getAttribute("loginidx");
        ObjectMapper mapper = new ObjectMapper();
        System.out.println(jsondata2);
        try {
            couponDto[] dtos = mapper.readValue(jsondata2, couponDto[].class);
            for (couponDto dto : dtos) {
                // 데이터베이스에 예약 정보를 조회합니다.
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                LocalDateTime dtoTime = LocalDateTime.parse(dto.getTime(), formatter);
                LocalDateTime now = LocalDateTime.now();

                List<couponDto> existingCoupons = myservice.couponall(user_idx);
                for (couponDto existingCoupon : existingCoupons) {
                    LocalDateTime existingCouponTime = LocalDateTime.parse(existingCoupon.getTime(), formatter);
                    if (existingCouponTime.isAfter(now)) {  // 현재 시간보다 미래의 쿠폰이 있다면
                        return new ResponseEntity<>("이미 쿠폰을 가지고 있습니다.", HttpStatus.CONFLICT);
                    }
                    else if(existingCouponTime.isBefore(now)) {
                        dto.setUser_idx(user_idx);
                        myservice.couponinsert(dto);
                    }
                }
                dto.setUser_idx(user_idx);
                myservice.couponinsert(dto);
            }
        } catch (Exception e) {
            return new ResponseEntity<>("이미 쿠폰을 가지고 있습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<>("쿠폰 등록 완료!.", HttpStatus.OK);
    }

}


