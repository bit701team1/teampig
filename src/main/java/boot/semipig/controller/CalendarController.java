package boot.semipig.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import boot.semipig.dto.LoginDto;
import boot.semipig.dto.OwnerpageDto;
import boot.semipig.mapper.ServiceMapper;
import boot.semipig.service.LoginService;
import boot.semipig.service.OwnerpageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import boot.semipig.dto.ServiceDto;
import boot.semipig.service.MyService;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/calendar")
public class CalendarController {
    @Autowired
    private MyService myservice;
    @Autowired
    private OwnerpageService ownerpageService;
    @Autowired
    private LoginService loginService;
    @Autowired
    private ServiceMapper serviceMapper;
    @GetMapping("/calendar")
    public String calendar2(Model model, HttpSession session) {
        int user_idx = (int) session.getAttribute("loginidx");
        int food_idx = (int) session.getAttribute("loginidx");
        serviceMapper.getmypage(user_idx);
        LoginDto dtos=loginService.getUserInfo(user_idx);
        model.addAttribute("logindto", dtos);
        int totalCount = myservice.getTotalCount(food_idx);
        model.addAttribute("totalCount", totalCount);
        return "/main/booking/calendar";
    }
    @GetMapping("/calendarajax")
    public @ResponseBody Map<String, Object> calendar(@RequestParam(defaultValue = "1") int currentPage, HttpSession session) {
        int user_idx = (int) session.getAttribute("loginidx");
        int food_idx = (int) session.getAttribute("loginidx");
        Map<String, Object> response = new HashMap<>();
        LocalDateTime currentDateTime = LocalDateTime.now();
        int totalCount = myservice.getTotalCount(food_idx);
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
        List<ServiceDto> list = myservice.getAll(startNum, perPage,user_idx, currentDateTime);

        response.put("totalCount", totalCount);
        response.put("list", list);
        response.put("startPage", startPage);
        response.put("endPage", endPage);
        response.put("totalPage", totalPage);
        response.put("currentPage", currentPage);
        response.put("no", no);

        return response;
    }


    @GetMapping("/list")
    @ResponseBody
    public List<ServiceDto> list(HttpSession session) {
        int user_idx = (int) session.getAttribute("loginidx");
        List<ServiceDto> eventList = myservice.selectt(user_idx);
        return eventList;
    }
    @GetMapping("/delete")
    public String deletee(int num) {
        myservice.deletee(num);
        return "redirect:calendar";
    }
    @PostMapping("/update")
    @ResponseBody
    public void update(@RequestBody String jsondata) {
        ObjectMapper mapper = new ObjectMapper();
        System.out.println(jsondata);
        try {
            ServiceDto dto = mapper.readValue(jsondata, ServiceDto.class);
            myservice.updatee(dto);
        } catch (IOException e) {
            // 예외 처리
        }
    }
}
