package boot.semipig.controller;

import boot.semipig.dto.SearchDto;
import boot.semipig.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class SearchController {

    @Autowired
    private SearchService searchService;

    @GetMapping("/list")
    public String search()
    {
        return "/search/list";
    }

    @GetMapping("/flist")
    @ResponseBody public List<SearchDto> foodList(Model model){

        List<SearchDto> list=searchService.getAllFood();

        return list;
    }
    @GetMapping("/scorelist")
    @ResponseBody public List<SearchDto> scoreList(Model model){
        List<SearchDto> list=searchService.getHighScoreFood();

        return list;
    }
    @GetMapping("/manyreviewlist")
    @ResponseBody public List<SearchDto> manyReviewList(Model model){
        List<SearchDto> list=searchService.getManyReview();
        return list;
    }


}