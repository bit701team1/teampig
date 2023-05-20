package boot.semipig.service;

import boot.semipig.dto.SearchDto;

import java.util.List;

public interface RealmainServiceInter {
    public String getFavoriteFood(int user_idx);
    public String getSecondFood(int user_idx);
    public List<Integer> getRecommandFood(String favoriteFood);
    public SearchDto getRecommandList(int food_idx);


    public SearchDto getHighScoreFood();
    public SearchDto getManyReview();
    public SearchDto getBookmarkList();
    public SearchDto getRandomOne();
}
