package boot.semipig.controller;

import boot.semipig.dto.QnaAnswerDto;
import boot.semipig.dto.QnaDto;
import boot.semipig.service.QnaService;
import naver.cloud.NcpObjectStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.security.auth.Subject;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/qna")
public class QnaController {

    @Autowired
    private QnaService qnaService;


    //질문게시판 리스트 출력
    @GetMapping("/list")
    public String list(@RequestParam(defaultValue = "1") int currentPage, Model model) //null값이면 초기페이지를 1page로
    {
        //게시판의 총 글갯수 얻기
        int totalCount = qnaService.getTotalCount();
        int totalPage;//총페이지 수
        int perPage = 5;//한페이지당 보여질 글의 갯수
        int perBlock = 5;//한 블럭당 보여질 페이지의 갯수
        int startNum;//각 페이지에서 보여질 글의 시작번호 mysql에서는 endNum 따로 구할필요는 없음
        int startPage;//각 블럭에서 보여질 시작페이지 번호
        int endPage;//각 블럭에서 보여질 끝 페이지 번호
        int no;//글 출력 시 출력할 페이지 번호

        //총 페이지 수
        totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
        //시작페이지
        startPage = (currentPage - 1) / perBlock * perBlock + 1;
        //끝페이지
        endPage = startPage + perBlock - 1;
        //이 때 문제점...endPage가 totalPage보다 크면 안된다.
        if (endPage > totalPage)
            endPage = totalPage;
        //각 페이지의 시작번호(1페이지 :mysql은 0,2페이지는 :3,3페이지:6...)
        startNum = (currentPage - 1) * perPage;
        //각 글마다 출력할 글번호 (예:10개일 경우 1페이지:10,2페이지:7...)
        //no=totalCount-(currentPage-1)*perPage;
        no = totalCount - startNum;

        //각 페이지에 필요한 게시글 db에서 가져오기\
        List<QnaDto> list = qnaService.getQnaPagingList(startNum, perPage);
        List<QnaDto> adminlist = qnaService.getNoticePagingList(startNum, perPage);


        List<Map<String, Object>> fulllist = new ArrayList<>();
        for(QnaDto dto : list){

            Map<String, Object>  map= new HashMap<>();
            int qna_idx = dto.getQna_idx();

            map.put("getAnswerCount",qnaService.getAnswerCount(dto.getQna_idx()));
            map.put("qna_idx",dto.getQna_idx());
            map.put("qna_subject",dto.getQna_subject());
            map.put("qna_content",dto.getQna_content());
            map.put("qna_pass",dto.getQna_pass());
            map.put("qna_readcount",dto.getQna_readcount());
            map.put("qna_ref",dto.getQna_ref());
            map.put("qna_step",dto.getQna_step());
            map.put("qna_depth",dto.getQna_depth());
            map.put("qna_writeday",dto.getQna_writeday());
            map.put("writer",dto.getWriter());
            map.put("qna_ispass",dto.isQna_ispass());
            map.put("user_type",dto.getUser_type());
            map.put("user_idx",dto.getUser_idx());
            fulllist.add(map);
        }

        //출력 시 필요한 변수들을 model에 몽땅 저장
        model.addAttribute("adminlist",adminlist);
        model.addAttribute("list",fulllist);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("no", no);

        return "/main/qna/qnalist";
    }

    //글쓰기 폼
    @GetMapping("/writeform")
    public String form(
            // 0이라는 것은 새글이라는 것.
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(defaultValue = "0") int qna_idx,
            @RequestParam(defaultValue = "0") int qna_ref,
            @RequestParam(defaultValue = "0") int qna_step,
            @RequestParam(defaultValue = "0") int qna_depth,
            Model model
    ) {
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("qna_idx", qna_idx);
        model.addAttribute("qna_ref", qna_ref);
        model.addAttribute("qna_step", qna_step);
        model.addAttribute("qna_depth", qna_depth);

        return "/main/qna/qnawriteform";
    }

    //공지글 또는 질문 인서트
    @PostMapping("/insert")
    public String insert(QnaDto dto, @RequestParam("qna_ispass") boolean qna_ispass)
    {
        dto.setQna_ispass(qna_ispass);
        qnaService.insertQnaBoard(dto);
        return "redirect:list";
    }

    //답변 인서트
    @PostMapping("/insertanswer")
    public String insertQnaAnswer(QnaAnswerDto dto){
        qnaService.insertQnaAnswer(dto);

        return "redirect:/qna/list";
    }

    //답변리스트 출력
    @GetMapping("/answerlist/{qna_idx}")
    @ResponseBody
    public List<QnaAnswerDto> answerlist(@PathVariable int qna_idx) {
        List<QnaAnswerDto> answers = qnaService.getQnaAnswer(qna_idx);
        System.out.println(answers);  // 답변 리스트를 콘솔에 출력합니다.
        return answers;
    }

    //공지글, 일반 질문 삭제
    @GetMapping("/delete")
    public String delete(int qna_idx)
    {
        QnaDto dto = qnaService.getData(qna_idx);
        qnaService.deleteQna(qna_idx);
        return "redirect:list";
    }

    @PostMapping("/ansdelete")
    @ResponseBody
    public void deleteAnswer(int qna_idx,int answer_idx)
    {
        QnaDto dto= qnaService.getData(qna_idx);
        qnaService.deleteAnswer(qna_idx,answer_idx);
        System.out.println(qna_idx);
        System.out.println(answer_idx);
    }

    //세션 로그인
    @PostMapping("temp_login")
    public String doLogin(String id,
                          int user_idx, int user_type,
                          HttpSession session) {
        // 아이디와 비밀번호를 검증한 후, 세션에 아이디를 저장한다.
        session.setAttribute("id", id);
        session.setAttribute("user_idx", user_idx);
        session.setAttribute("user_type", user_type);
        // 로그인 후에는 다른 페이지로 리다이렉트한다.
        return "redirect:list";
    }
    @GetMapping("temp_logout")
    public String logout(HttpSession session) {

        session.removeAttribute("id");
        session.removeAttribute("user_idx");
        session.removeAttribute("user_type");
        return "redirect:list";
    }




}
