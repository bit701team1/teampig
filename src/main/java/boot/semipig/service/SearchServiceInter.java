package boot.semipig.service;

import boot.semipig.dto.SearchDto;

import java.util.List;

public interface SearchServiceInter {
    public List<SearchDto> getAllFood();
    public List<SearchDto> getHighScoreFood();
    public List<SearchDto> getManyReview();
}