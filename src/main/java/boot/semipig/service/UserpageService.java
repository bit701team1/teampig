package boot.semipig.service;

import boot.semipig.dto.ReviewDto;
import boot.semipig.dto.SearchDto;
import boot.semipig.mapper.UserpageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserpageService implements UserpageServiceInter {

    @Autowired
    UserpageMapper userpageMapper;

    @Override
    public List<Integer> getFoodidx(int user_idx) {
        return userpageMapper.getFoodidx(user_idx);
    }

    @Override
    public List<SearchDto> getFoodlist(int food_idx) {
        return userpageMapper.getFoodlist(food_idx);
    }

    @Override
    public List<ReviewDto> getReviewlist(int user_idx,int startNum, int perPage) {
        return userpageMapper.getReviewlist(user_idx,startNum,perPage);
    }

    @Override
    public String getNameByIdx(int user_idx) {
        return userpageMapper.getNameByIdx(user_idx);
    }
    @Override
    public int getReviewCount(int user_idx) {
        return userpageMapper.getReviewCount(user_idx);
    }
}
