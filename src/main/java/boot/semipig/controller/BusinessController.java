package boot.semipig.controller;

import boot.semipig.dto.JoinDto;
import boot.semipig.service.BusinessService;
import boot.semipig.service.JoinService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
public class BusinessController {

    @Autowired
    JoinService joinService;

    @Autowired
    BusinessService businessService;

    @GetMapping("/business")
    public String business()
    {
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
}
