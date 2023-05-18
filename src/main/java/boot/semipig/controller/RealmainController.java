package boot.semipig.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RealmainController {
    @GetMapping("/realmain")
    public String realmain()
    {
        return "realmain/realmain";
    }
}
