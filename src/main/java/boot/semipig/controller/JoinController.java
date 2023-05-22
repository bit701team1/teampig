package boot.semipig.controller;

import boot.semipig.dto.JoinDto;
import boot.semipig.service.JoinService;
import boot.semipig.service.OwnerpageService;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/join")
public class JoinController {
    @Autowired
    JoinService joinService;
    @Autowired
    OwnerpageService ownerpageService;

    @Autowired
    public NcpObjectStorageService storageService;

    public String bucketName="pig701-bucket";

    @GetMapping("/join")
    public String join()
    {

        return "/join/join";
    }

    @PostMapping("/insert")
    public String insertUser(JoinDto dto, MultipartFile upload, HttpSession session, HttpServletRequest request)
    {
        String filename="";
        //업로드를 한 경우에만 버킷에 이미지를 저장한다.(빈문자열이 아니면!)
        if(!upload.getOriginalFilename().equals("")){
            filename=storageService.uploadFile(bucketName, "join", upload);
        }

        //dto에 파일명 저장
        dto.setUser_photo(filename);

        joinService.insertUser(dto);

        String previousUrl = (String) session.getAttribute("previousUrl");
        session.removeAttribute("previousUrl");
        if (previousUrl != null && previousUrl != "http://localhost:9000/enter"&& previousUrl!="http://localhost:9000/enter?n_email=gsh4908@hanmir.com&n_name=%EA%B9%80%EC%84%B1%ED%95%99") {
            return "redirect:" + previousUrl;
        } else {
            // 이전 페이지 URL이 없는 경우에 대한 처리 (예: 기본 페이지로 리다이렉트)
            return "redirect:/business";
        }
    }
}
