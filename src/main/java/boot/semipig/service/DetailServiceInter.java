package boot.semipig.service;

import boot.semipig.dto.DetailDto;
import boot.semipig.dto.FoodPhotoDto;
import boot.semipig.dto.ReviewPhotoDto;

import java.util.List;

public interface DetailServiceInter {
    public DetailDto selectFood(int food_idx);
    public void insertFoodHistory(int user_idx, String food_type, String food_list);
    public int getHistoryCount(int user_idx);
    public void autoHistoryDelete(int user_idx);

    public int getBookmarkCount(Integer user_idx, Integer food_idx);

    public void insertBookmark(int user_idx, int food_idx);
    public void deleteBookmark(int user_idx, int food_idx);
    public List<DetailDto> nearbyStore(String SIGUN_NM);
    public ReviewPhotoDto nearbyStorephoto(int food_idx);
}
