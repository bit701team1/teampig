package boot.semipig.service;

import boot.semipig.dto.SearchDto;
import boot.semipig.mapper.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SearchService implements SearchServiceInter {

    @Autowired
    SearchMapper searchMapper;

/*    @Override
    public List<SearchDto> getAllFood() {
        return searchMapper.getAllFood();
    }*/

    @Override
    public List<SearchDto> getHighScoreFood(int startNum, int perPage) {
        return searchMapper.getHighScoreFood(startNum,perPage);
    }

    @Override
    public List<SearchDto> getManyReview(int startNum, int perPage) {
        return searchMapper.getManyReview(startNum,perPage);
    }

    @Override
    public List<SearchDto> getSearchFood(String search, Integer startNum, Integer perPage) {
        if (startNum == null) startNum = 0;
        if (perPage == null) perPage = 0;

        Map<String, Object> map = new HashMap<>();
        map.put("startNum", Integer.valueOf(startNum));
        map.put("perPage", Integer.valueOf(perPage));
        map.put("search", search);
        return searchMapper.getSearchFood(map);
    }

    @Override
    public List<SearchDto> getPriceFood(String list_type,Integer startNum, Integer perPage) {
        if (startNum == null) startNum = 0;
        if (perPage == null) perPage = 0;

        Map<String, Object> map = new HashMap<>();
        map.put("startNum", Integer.valueOf(startNum));
        map.put("perPage", Integer.valueOf(perPage));
        map.put("food_price", list_type);

        return searchMapper.getPriceFood(map);
    }

    @Override
    public List<SearchDto> getBookmarkList(int startNum, int perPage) {
        return searchMapper.getBookmarkList(startNum,perPage);
    }

    //Count
    public int getTotalCount(){
        return searchMapper.getTotalCount();
    }

    @Override
    public int getHighScoreFoodCount(int startNum, int perPage) {
        return searchMapper.getHighScoreFoodCount(startNum,perPage);
    }

    @Override
    public int getManyReviewCount(int startNum, int perPage) {
        return searchMapper.getManyReviewCount(startNum,perPage);
    }

    @Override
    public int getSearchFoodCount(String search, Integer startNum, Integer perPage) {
        if (startNum == null) startNum = 0;
        if (perPage == null) perPage = 0;

        Map<String, Object> map = new HashMap<>();
        map.put("startNum", Integer.valueOf(startNum));
        map.put("perPage", Integer.valueOf(perPage));
        map.put("search", search);

        return searchMapper.getSearchFoodCount(map);
    }

    @Override
    public int getPriceFoodCount(String food_price, Integer startNum, Integer perPage) {
        if (startNum == null) startNum = 0;
        if (perPage == null) perPage = 0;

        Map<String, Object> map = new HashMap<>();
        map.put("startNum", Integer.valueOf(startNum));
        map.put("perPage", Integer.valueOf(perPage));
        map.put("food_price", food_price);
        return searchMapper.getPriceFoodCount(map);
    }

    @Override
    public int getBookmarkListCount(int startNum, int perPage) {
        return searchMapper.getBookmarkListCount(startNum,perPage);
    }
}
