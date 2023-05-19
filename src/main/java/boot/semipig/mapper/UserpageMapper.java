package boot.semipig.mapper;

import boot.semipig.dto.ReviewDto;
import boot.semipig.dto.SearchDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserpageMapper {
    public List<Integer> getFoodidx(int user_idx);
    public List<SearchDto> getFoodlist(int food_idx);
    public List<ReviewDto> getReviewlist(int user_idx);
    public  String getNameByIdx(int user_idx);
}
