package boot.semipig.controller;

import boot.semipig.dto.SearchDto;
import boot.semipig.mapper.RealmainMapper;
import boot.semipig.mapper.SearchMapper;
import boot.semipig.mapper.ServiceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RealmainController {

    @Autowired
    private RealmainMapper realmainMapper;

    @GetMapping("/realmain")
    public String realmain(HttpSession session, HttpServletRequest request)
    {
        String previousUrl = request.getHeader("Referer");
        session.setAttribute("previousUrl", previousUrl);

        return "realmain/realmain";
    }

    @GetMapping("/historyrecommand")
    @ResponseBody
    public Map<String, Object> historyrecommand(HttpSession session){
        //user idx받아옴
        int user_idx = (int)session.getAttribute("loginidx");

        //1순위, 2순위 food_type을 구함
        String favoritfood = realmainMapper.getFavoriteFood(user_idx);
        String secondfood = realmainMapper.getSecondFood(user_idx);

        //1순위, 2순위 food_type에 대한 랜덤 추천 3개를 food_idx를 받아옴
        List<Integer> recommandFoods = realmainMapper.getRecommandFood(favoritfood);
        List<Integer> secondFoods = realmainMapper.getRecommandFood(secondfood);

        /*System.out.println(recommandFoods);
        System.out.println(secondFoods);*/

        List<SearchDto> recommandlist = new ArrayList<>();
        List<SearchDto> secondlist = new ArrayList<>();

        for (Integer foodId : recommandFoods) {
            SearchDto searchDto = realmainMapper.getRecommandList(foodId);
            recommandlist.add(searchDto);
        }

        for (Integer foodId : secondFoods) {
            SearchDto searchDto = realmainMapper.getRecommandList(foodId);
            secondlist.add(searchDto);
        }

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("recommandlist", recommandlist);
        resultMap.put("secondlist", secondlist);

        return resultMap;
    }


    @GetMapping("/hotplace")
    @ResponseBody
    public List<SearchDto> gethotplace(HttpSession session){
        int user_idx = (int)session.getAttribute("loginidx");

        List<SearchDto> list = new ArrayList<>();

        SearchDto scorelist = realmainMapper.getHighScoreFood();
        SearchDto reviewlist = realmainMapper.getManyReview();
        SearchDto bookmarklist = realmainMapper.getBookmarkList();
        SearchDto randomlist = realmainMapper.getRandomOne();

        list.add(scorelist);
        list.add(reviewlist);
        list.add(bookmarklist);
        list.add(randomlist);


        return list;
    }

    @GetMapping("/setsearchsession")
    @ResponseBody
    public String setsearchsession(HttpSession session,String input){
        session.setAttribute("inputsearch",input);

        return "확인";
    }


}
