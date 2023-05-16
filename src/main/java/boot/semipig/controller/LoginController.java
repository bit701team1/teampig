package boot.semipig.controller;

import boot.semipig.dto.LoginDto;
import boot.semipig.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController{
    @Autowired
    LoginService loginService;


    @GetMapping("/login")//로그인 페이지, 나중에 합친 후에 메인페이지로 맵핑 변경할 것.
    public String login(){

        return "main/login";
    }

    @PostMapping("/loginaction")//회원정보 확인 뒤 db에 있는 회원정보일 경우 session에 회원정보를 뿌려줌.
    @ResponseBody public int loginactino(Model model, String id, String password, @RequestParam(required=false) String saveid, HttpSession session){

        int count=loginService.isEqualIdPass(id, password);
        System.out.println(id+","+count);
        if(count==0)
        {
            System.out.println("로그인 실패");
            return 0;
        }else{
            session.setMaxInactiveInterval(60*5);//5분동안 세션 유지
            System.out.println("로그인 성공"+id);
            //로그인 성공시 세션에 저장하기
            session.setAttribute("loginok", "yes");
            session.setAttribute("loginid", id);
            int user_idx=loginService.getUserIdx(id);
            session.setAttribute("loginidx", user_idx);
            session.setAttribute("saveid", saveid==null?"no":"yes");

            return 1;
        }

    }
    @GetMapping("/logout")
    public String logout(HttpSession session)
    {
        session.removeAttribute("loginok");
        return "redirect:login";
    }

    @GetMapping("/joinformtest")
    public String logintest(Model model, String email, String name)
    {
        model.addAttribute("email", email);
        model.addAttribute("name", name);
        return "main/joinformtest";
    }
    @PostMapping("/emailcheck")
    @ResponseBody public int emailCheck(String email){
        return loginService.doublecheck(email);

    }
    @GetMapping("/snsloginaction")
    public String snslogin(String email, HttpSession session)
    {
        System.out.println("test");
        //이메일확인되면 로그인되고, 세션에 넣어주기
        session.setMaxInactiveInterval(60*5);//5분동안 세션 유지
        //회원정보 불러오기
        int user_idx=loginService.getUserIdxByEmail(email);
        LoginDto dto=loginService.getUserInfo(user_idx);
        System.out.println(user_idx);

        System.out.println(dto.getId());
        //로그인 성공시 세션에 저장하기
        session.setAttribute("loginok", "yes");
        session.setAttribute("loginid", dto.getId());
        session.setAttribute("loginidx", user_idx);

        return "redirect:login";

    }
    @GetMapping("/auth/naver/callback")
    public String naverCallback()
    {
        return "main/navercallback";
    }
    @GetMapping("/naverloginaction")
    public String naverlogin(String email, HttpSession session)
    {
        System.out.println("test");
        //이메일확인되면 로그인되고, 세션에 넣어주기
        session.setMaxInactiveInterval(60*5);//5분동안 세션 유지
        //회원정보 불러오기
        int user_idx=loginService.getUserIdxByEmail(email);
        LoginDto dto=loginService.getUserInfo(user_idx);
        System.out.println(user_idx);

        System.out.println(dto.getId());
        //로그인 성공시 세션에 저장하기
        session.setAttribute("loginok", "yes");
        session.setAttribute("loginid", dto.getId());
        session.setAttribute("loginidx", user_idx);

        return "redirect:login";

    }
}
