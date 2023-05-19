package boot.semipig.controller;

import boot.semipig.dto.LoginDto;
import boot.semipig.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class LoginController{
    @Autowired
    LoginService loginService;


   /* @GetMapping("/login")//로그인 페이지, 나중에 합친 후에 메인페이지로 맵핑 변경할 것.
    public String login(){

        return "main/login";
    }*/

    @PostMapping("/loginaction")//회원정보 확인 뒤 db에 있는 회원정보일 경우 session에 회원정보를 뿌려줌.
    @ResponseBody public int loginactino
            (Model model,String username, String id, String password, @RequestParam(required=false) String saveid, HttpSession session){

        //System.out.println((String)request.getHeader("Referer"));
        int count=loginService.isEqualIdPass(id, password);
        System.out.println(id+","+count);
        if(count==0)
        {
            System.out.println("로그인 실패");
            return 0;
        }else{
            session.setMaxInactiveInterval(60*60);//60분동안 세션 유지
            System.out.println("로그인 성공"+id);
            //로그인 성공시 세션에 저장하기
            session.setAttribute("loginok", "yes");
            session.setAttribute("loginid", id);
            int user_idx=loginService.getUserIdx(id);

            String user_name = loginService.getUserInfo(user_idx).getUser_name();
            session.setAttribute("username",user_name);
            session.setAttribute("loginidx", user_idx);
            session.setAttribute("saveid", saveid==null?"no":"yes");
            return 1;
        }

    }
    @GetMapping("/logout")
    public String logout(HttpSession session, HttpServletRequest request)
    {
        String referer = request.getHeader("Referer");
        session.removeAttribute("loginok");

        session.removeAttribute("loginid");
        session.removeAttribute("loginidx");
        session.removeAttribute("username");

        return "redirect:"+referer;
    }

    /* @GetMapping("/joinformtest")
     public String logintest(Model model, String email, String name)
     {
         model.addAttribute("email", email);
         model.addAttribute("name", name);
         return "main/joinformtest";
     }*/
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

        // 이전 페이지 URL 가져오기
        String previousUrl = (String) session.getAttribute("previousUrl");
        session.removeAttribute("previousUrl");

        if (previousUrl != null) {
            return "redirect:" + previousUrl;
        } else {
            // 이전 페이지 URL이 없는 경우에 대한 처리 (예: 기본 페이지로 리다이렉트)
            return "redirect:/";
        }

    }


    @GetMapping("/auth/naver/callback")
    public String naverCallback()
    {
        return "main/navercallback";
    }

}