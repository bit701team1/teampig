package boot.semipig.mapper;

import org.apache.ibatis.annotations.Mapper;
import boot.semipig.dto.SearchDto;

import java.util.List;
import java.util.Map;

@Mapper
public interface SearchMapper {
    /*public List<SearchDto> getAllFood();*/
    public List<SearchDto> getHighScoreFood(int startNum, int perPage);
    public List<SearchDto> getManyReview(int startNum, int perPage);

    public  List<SearchDto> getSearchFood(Map<String, Object> map);
    public List<SearchDto> getPriceFood(Map<String, Object> map);

    public List<SearchDto> getBookmarkList(int startNum, int perPage);
    public int getOneBookmarkCount(int food_idx);

    //Count 메서드
    public int getTotalCount();

    public int getHighScoreFoodCount(int startNum, int perPage);
    public int getManyReviewCount(int startNum, int perPage);
    public  int getSearchFoodCount(Map<String, Object> map);
    public int getPriceFoodCount(Map<String, Object> map);
    public int getBookmarkListCount(int startNum, int perPage);
}
