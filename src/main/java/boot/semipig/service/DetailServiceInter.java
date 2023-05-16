package boot.semipig.service;

import java.util.List;

public interface DetailServiceInter {
    public void insertFoodHistory(int user_idx, String food_type, String food_list);
    public int getHistoryCount(int user_idx);
    public void autoHistoryDelete(int user_idx);

    public int getBookmarkCount(Integer user_idx, Integer food_idx);

    public void insertBookmark(int user_idx, int food_idx);
    public void deleteBookmark(int user_idx, int food_idx);

    public String getFavoriteFood(int user_idx);
    public List<Integer> getRecommandFood(String favoriteFood);
}
