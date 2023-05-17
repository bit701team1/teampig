package boot.semipig.controller;

import boot.semipig.dto.SearchDto;
import boot.semipig.service.SearchService;
import ch.qos.logback.core.CoreConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.Console;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SearchController {

    @Autowired
    private SearchService searchService;

    //임시 로그인
    @PostMapping("/temp_login")
    public String doLogin(String id,
                          int loginidx,
                          HttpSession session) {
        // 아이디와 비밀번호를 검증한 후, 세션에 아이디를 저장한다.
        session.setAttribute("id", id);
        session.setAttribute("loginidx", loginidx);
        // 로그인 후에는 다른 페이지로 리다이렉트한다.
        return "redirect:/search";
    }

    @GetMapping("temp_logout")
    public String logout(HttpSession session) {
        /*int user_idx = (int)session.getAttribute("user_idx");
        System.out.println(user_idx);*/

        session.removeAttribute("id");
        session.removeAttribute("user_idx");
        return "redirect:/search";
    }


    @GetMapping("/search")
    public String search(Model model,HttpSession session){
        session.setAttribute("currentPage", 1);
        return "/search/search";
    }

    @GetMapping("/totallist")
    @ResponseBody
    public Map<String, Object> totallist(String list_type, String inputsearch,
                                     @RequestParam(defaultValue = "1") int currentPage,
                                         HttpSession session){

        List<SearchDto> list = new ArrayList<>();

            int totalCount = 0;

            int totalPage; //총 페이지 수
            int perPage=10;//한 페이지당 보여질 글의 갯수
            int perBlock=5;//한 블럭당 보여질 페이지 갯수

            int startNum;//각 페이지에서 보여질 글의 시작번호
            int startPage;//각 블럭에서 보여질 시작 페이지번호
            int endPage;//각 블럭에서 보여질 끝 페이지번호

            //각 페이지의 시작번호(1페이지:0, 2페이지:3, 3페이지: 6 ...)
            startNum=(currentPage-1)*perPage;

           // System.out.println("startNum="+startNum);
           // System.out.println("inputsearch="+inputsearch);

            if( inputsearch == null || inputsearch == "") {
                if((list_type).equals("type_1")){
                    //평점순
                    totalCount=searchService.getHighScoreFoodCount(startNum, perPage);
                } else if((list_type).equals("type_2")){
                    //리뷰
                    totalCount=searchService.getManyReviewCount(startNum, perPage);
                } else if((list_type).equals("type_3")){
                    //즐찾순 만들어야함
                    totalCount=searchService.getBookmarkListCount(startNum, perPage);
                } else if((list_type).equals("1만원대")){
                    //가격1
                    totalCount = searchService.getPriceFoodCount(list_type,startNum, perPage);
                } else if((list_type).equals("2만원대")){
                    //가격2
                    totalCount = searchService.getPriceFoodCount(list_type,startNum, perPage);
                } else if((list_type).equals("3만원대")){
                    //가격3
                    totalCount = searchService.getPriceFoodCount(list_type,startNum, perPage);
                } else if((list_type).equals("4만원이상")){
                    //가격3 over
                    totalCount = searchService.getPriceFoodCount(list_type,startNum, perPage);
                } else {
                    totalCount=searchService.getSearchFoodCount(inputsearch,startNum, perPage);
                }
            } else {
                totalCount=searchService.getSearchFoodCount(inputsearch,startNum, perPage);
            }

        //System.out.println("totalCount="+totalCount);

        //총 페이지 수
            //나머지가 있으면 1 추가(자바에서는 int에 저장시 소수점이 절삭되서 이런과정이 필요함)
            totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

            //시작페이지
            startPage=(currentPage-1)/perBlock*perBlock+1; //(2-1)/3*3+1=1, (5-1)/3*3+1=4
            //끝페이지
            endPage=startPage+perBlock-1;
            //이때 문제점은 totalPage가 endPage보다 작으면 안됨
            if(endPage>totalPage)
                endPage=totalPage;

            //각 글마다 출력할 글번호(10개면 1페이지:10, 2페이지: 7 ....)

            //System.out.println("startNum = "+startNum);


            if( inputsearch == null || inputsearch == "") {
                if((list_type).equals("type_1")){
                    list=searchService.getHighScoreFood(startNum, perPage);
                    for (SearchDto searchDto : list) {
                        int foodIdx = searchDto.getFood_idx();
                        int bookmarkCount = searchService.getOneBookmarkCount(foodIdx);
                        searchDto.setBookmarkcount(bookmarkCount);
                    }
                } else if((list_type).equals("type_2")){
                    list=searchService.getManyReview(startNum, perPage);
                    for (SearchDto searchDto : list) {
                        int foodIdx = searchDto.getFood_idx();
                        int bookmarkCount = searchService.getOneBookmarkCount(foodIdx);
                        searchDto.setBookmarkcount(bookmarkCount);
                    }
                } else if((list_type).equals("type_3")){
                    list=searchService.getBookmarkList(startNum, perPage);

                    for (SearchDto searchDto : list) {
                        int foodIdx = searchDto.getFood_idx();
                        int bookmarkCount = searchService.getOneBookmarkCount(foodIdx);
                        searchDto.setBookmarkcount(bookmarkCount);
                    }
                } else if((list_type).equals("1만원대")){
                    list = searchService.getPriceFood(list_type,startNum, perPage);
                    for (SearchDto searchDto : list) {
                        int foodIdx = searchDto.getFood_idx();
                        int bookmarkCount = searchService.getOneBookmarkCount(foodIdx);
                        searchDto.setBookmarkcount(bookmarkCount);
                    }
                } else if((list_type).equals("2만원대")){
                    list = searchService.getPriceFood(list_type,startNum, perPage);
                    for (SearchDto searchDto : list) {
                        int foodIdx = searchDto.getFood_idx();
                        int bookmarkCount = searchService.getOneBookmarkCount(foodIdx);
                        searchDto.setBookmarkcount(bookmarkCount);
                    }
                } else if((list_type).equals("3만원대")){
                    list = searchService.getPriceFood(list_type,startNum, perPage);
                    for (SearchDto searchDto : list) {
                        int foodIdx = searchDto.getFood_idx();
                        int bookmarkCount = searchService.getOneBookmarkCount(foodIdx);
                        searchDto.setBookmarkcount(bookmarkCount);
                    }
                } else if((list_type).equals("4만원이상")){
                    list = searchService.getPriceFood(list_type,startNum, perPage);
                    for (SearchDto searchDto : list) {
                        int foodIdx = searchDto.getFood_idx();
                        int bookmarkCount = searchService.getOneBookmarkCount(foodIdx);
                        searchDto.setBookmarkcount(bookmarkCount);
                    }
                } else {
                    list=searchService.getSearchFood(inputsearch,startNum, perPage);
                    for (SearchDto searchDto : list) {
                        int foodIdx = searchDto.getFood_idx();
                        int bookmarkCount = searchService.getOneBookmarkCount(foodIdx);
                        searchDto.setBookmarkcount(bookmarkCount);
                    }
                }
            } else {
                list=searchService.getSearchFood(inputsearch,startNum, perPage);
                for (SearchDto searchDto : list) {
                    int foodIdx = searchDto.getFood_idx();
                    int bookmarkCount = searchService.getOneBookmarkCount(foodIdx);
                    searchDto.setBookmarkcount(bookmarkCount);
                }
            }

            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("startPage", startPage);
            resultMap.put("endPage", endPage);
            resultMap.put("totalPage", totalPage);
            resultMap.put("currentPage", currentPage);
            resultMap.put("list", list);
            resultMap.put("list_type", list_type);
            resultMap.put("inputsearch",inputsearch);

           //System.out.println("totalPage = "+totalPage);
        //System.out.println("====================================");

        return resultMap;
    }
}

