package boot.semipig.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EnterController {

    @GetMapping("/enter")
    public String enter(){
        return "/enter/enter";
    }
}
