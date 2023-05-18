package boot.semipig.service;

import boot.semipig.dto.SearchDto;

import java.util.List;
import java.util.Map;

public interface SearchServiceInter {
    public int getTotalCount();
    public List<SearchDto> getHighScoreFood(int startNum, int perPage);
    public List<SearchDto> getManyReview(int startNum, int perPage);
    public  List<SearchDto> getSearchFood(String search,Integer  startNum,Integer  perPage);
    public List<SearchDto> getPriceFood(String food_price,Integer startNum, Integer perPage);
    public List<SearchDto> getBookmarkList(int startNum, int perPage);
    public int getOneBookmarkCount(int food_idx);

    //Count
    public int getHighScoreFoodCount(int startNum, int perPage);
    public int getManyReviewCount(int startNum, int perPage);
    public  int getSearchFoodCount(String search,Integer  startNum,Integer  perPage);
    public int getPriceFoodCount(String food_price,Integer startNum, Integer perPage);
    public int getBookmarkListCount(int startNum, int perPage);

}
