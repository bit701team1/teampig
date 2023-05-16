package boot.semipig.service;

import boot.semipig.dto.SearchDto;
import boot.semipig.mapper.SearchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchService implements SearchServiceInter
{

    @Autowired
    SearchMapper searchMapper;

    @Override
    public List<SearchDto> getAllFood() {
        return searchMapper.getAllFood();
    }

    @Override
    public List<SearchDto> getHighScoreFood() {
        return searchMapper.getHighScoreFood();
    }

    @Override
    public List<SearchDto> getManyReview() {
        return searchMapper.getManyReview();
    }
}