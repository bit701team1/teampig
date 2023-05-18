package boot.semipig.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class BusinessController {
    @GetMapping("/business")
    public String business(HttpSession session, HttpServletRequest request)
    {
        String previousUrl = request.getHeader("Referer");
        session.setAttribute("previousUrl", previousUrl);

        return "/business/business";
    }
}
