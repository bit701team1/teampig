package boot.semipig.service;

import boot.semipig.dto.SearchDto;
import boot.semipig.mapper.RealmainMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RealmainService implements RealmainServiceInter{

    @Autowired
    RealmainMapper realmainMapper;

    public String getFavoriteFood(int user_idx) {
        return realmainMapper.getFavoriteFood(user_idx);
    }

    @Override
    public String getSecondFood(int user_idx) {
        return realmainMapper.getSecondFood(user_idx);
    }

    @Override
    public List<Integer> getRecommandFood(String favoriteFood) {
        return realmainMapper.getRecommandFood(favoriteFood);

    }
    @Override
    public SearchDto getRecommandList(int food_idx) {
        return realmainMapper.getRecommandList(food_idx);
    }

    //하단부
    @Override
    public SearchDto getManyReview() {
        return realmainMapper.getManyReview();
    }

    @Override
    public SearchDto getHighScoreFood() {
        return realmainMapper.getHighScoreFood();
    }

    @Override
    public SearchDto getBookmarkList() {
        return realmainMapper.getBookmarkList();
    }

    @Override
    public SearchDto getRandomOne() {
        return realmainMapper.getRandomOne();
    }
}