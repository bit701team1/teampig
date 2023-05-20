package boot.semipig.mapper;

import boot.semipig.dto.SearchDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RealmainMapper {
    public String getFavoriteFood(int user_idx);
    public String getSecondFood(int user_idx);
    public List<Integer> getRecommandFood(String favoriteFood);
    public SearchDto getRecommandList(int food_idx);

    //하단부
    public SearchDto getHighScoreFood();
    public SearchDto getManyReview();
    public SearchDto getBookmarkList();
    public SearchDto getRandomOne();
}
