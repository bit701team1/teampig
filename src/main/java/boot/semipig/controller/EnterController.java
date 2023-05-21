package boot.semipig.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class EnterController {


    @GetMapping("/enter")
    public String enter(HttpSession session, HttpServletRequest request){

        String previousUrl = request.getHeader("Referer");
        System.out.println(previousUrl);
        session.setAttribute("previousUrl", previousUrl);
        System.out.println(previousUrl);
        return "/enter/enter";
    }
}
