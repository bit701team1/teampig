package boot.semipig.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BusinessController {
    @GetMapping("/business")
    public String business()
    {
        return "/business/business";
    }
}
