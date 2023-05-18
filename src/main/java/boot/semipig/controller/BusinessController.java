package boot.semipig.controller;

import boot.semipig.dto.JoinDto;
import boot.semipig.service.JoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BusinessController {
    @GetMapping("/business")
    public String business()
    {
        return "/business/business";
    }
}
