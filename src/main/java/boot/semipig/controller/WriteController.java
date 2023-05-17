package boot.semipig.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import boot.semipig.dto.*;
import boot.semipig.mapper.ServiceMapper;
import boot.semipig.service.MyService;
import boot.semipig.service.OwnerpageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/write/")
public class WriteController {
    @Autowired
    private MyService myservice;
    @Autowired
    private ServiceMapper serviceMapper;
    @Autowired
    private OwnerpageService ownerpageservice;
    @GetMapping("/form")
    public String coupon(Model model) {
        List<couponDto> list2 = myservice.couponall();
        int totalCount=myservice.getTotalCount();
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("list2", list2);
        return "/main/booking/booking";
    }

    @PostMapping("/insert")
    @ResponseBody
    void insertt(@RequestBody String jsondata, HttpServletResponse response) {
        ObjectMapper mapper = new ObjectMapper();
        System.out.println(jsondata);
        try {
            ServiceDto[] dtos = mapper.readValue(jsondata, ServiceDto[].class);
            for (ServiceDto dto : dtos) {
                // 데이터베이스에 예약 정보를 조회합니다.
                List<ServiceDto> eventList = myservice.selectt();
                boolean isAvailable = true;
                for (ServiceDto event : eventList) {
                    if (event.getStart().equals(dto.getStart())) {
                        // 이미 예약된 시간인 경우
                        isAvailable = false;
                        break;
                    }
                }
                if (isAvailable) {
                    // 예약 가능한 경우, 데이터베이스에 새로운 예약 정보를 추가합니다.
                    myservice.insertt(dto);
                } else {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST);
                }
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
    public String review(Model model)
    {
        int totalCount=myservice.getTotalCount();
        model.addAttribute("totalCount", totalCount);
        return "/main/booking/review";
    }
    @GetMapping("/reviewajax")
    public @ResponseBody Map<String, Object> review2(@RequestParam(defaultValue = "1") int currentPage) {
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
        List<ReviewDto> list = myservice.reviewlist(startNum, perPage);

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
    public @ResponseBody Map<String, Object> qna2(@RequestParam(defaultValue = "1") int currentPage) {
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
        List<qna3Dto> list = myservice.qnalist(startNum, perPage);

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
    public String qna(Model model)
    {
        int totalCount=myservice.getTotalCount();
        model.addAttribute("totalCount", totalCount);
        return "/main/booking/qna";
    }
    @GetMapping("/infoupdate")
    public String infoupdate(Model model,  HttpSession session)
    {
        int user_idx = (int) session.getAttribute("user_idx");
        // DTO 객체를 생성하여 세션에서 가져온 정보를 저장
        DetailDto dto =ownerpageservice.updateOwner(user_idx);
        dto.setUser_idx(user_idx);
        model.addAttribute("user_idx", user_idx);
        model.addAttribute("dto", dto);
        int totalCount=myservice.getTotalCount();
        model.addAttribute("totalCount", totalCount);
        return "/main/booking/infoupdate";
    }
}

