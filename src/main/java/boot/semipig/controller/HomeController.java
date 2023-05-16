package boot.semipig.controller;

import boot.semipig.dto.couponDto;
import boot.semipig.service.MyService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private MyService myservice;
    @GetMapping({"/","/home1"})
    public String home1(Model model) {
        List<couponDto> list2 = myservice.couponall();
        int totalCount = myservice.getTotalCount();
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("list2", list2);
        return "/main";
    }
    @RequestMapping(value = "/insertcoupon", method = {RequestMethod.GET, RequestMethod.POST}) //  main은 getmapping이 없어서 따로 이렇게 해줘야함
    @ResponseBody
    void insertcoupon (@RequestBody String jsondata2){
        ObjectMapper mapper = new ObjectMapper();
        System.out.println(jsondata2);
        try {
            couponDto[] dtos = mapper.readValue(jsondata2, couponDto[].class);
            for (couponDto dto : dtos) {
                // 데이터베이스에 예약 정보를 조회합니다.
                myservice.couponinsert(dto);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    public String total(Model model){
        int totalCount=myservice.getTotalCount();
        model.addAttribute("totalCount", totalCount);
        return "/header";
    }
    @GetMapping("/home2")
    public String home()
    {
        return "/main2";
    }
}
