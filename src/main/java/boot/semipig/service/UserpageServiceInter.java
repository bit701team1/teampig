package boot.semipig.service;

import boot.semipig.dto.ReviewDto;
import boot.semipig.dto.SearchDto;

import java.util.List;

public interface UserpageServiceInter {
    public List<Integer> getFoodidx(int user_idx);
    public List<SearchDto> getFoodlist(int food_idx);
    public List<ReviewDto> getReviewlist(int user_idx);
    public  String getNameByIdx(int user_idx);
}
