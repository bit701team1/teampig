package boot.semipig.mapper;

import boot.semipig.dto.SearchDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SearchMapper {
    public List<SearchDto> getAllFood();
    public List<SearchDto> getHighScoreFood();
    public List<SearchDto> getManyReview();
}