package boot.semipig.mapper;

import boot.semipig.dto.DetailDto;
import boot.semipig.dto.FoodPhotoDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface DetailMapper {
    public DetailDto selectFood(int food_idx);
    public void insertFoodHistory(Map<String, Object> map);

    public int getHistoryCount(int user_idx);

    public void autoHistoryDelete(int user_idx);


    public int getBookmarkCount(Integer user_idx, Integer food_idx);
    public void insertBookmark(int user_idx, int food_idx);
    public void deleteBookmark(int user_idx, int food_idx);
    public List<DetailDto> nearbyStore(String SIGUN_NM);
    public FoodPhotoDto nearbyStorephoto(int user_idx);
}
