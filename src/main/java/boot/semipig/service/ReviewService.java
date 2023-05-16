package boot.semipig.service;

import boot.semipig.dto.ReviewDto;
import boot.semipig.dto.ReviewPhotoDto;
import boot.semipig.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService implements ReviewServiceInter{

    @Autowired
    ReviewMapper reviewMapper;
    @Override
    public void insertReview(ReviewDto dto) {
        reviewMapper.insertReview(dto);
    }

    @Override
    public void insertPhoto(ReviewPhotoDto dto) {
        reviewMapper.insertPhoto(dto);
    }

    @Override
    public List<ReviewDto> getAllReview(int food_idx) {
        return reviewMapper.getAllReview(food_idx);
    }

    @Override
    public List<ReviewPhotoDto> getPhotos(int review_idx) {
        return reviewMapper.getPhotos(review_idx);
    }

    @Override
    public int getUserNum(int review_idx) {
         //review idx를 받아와서 user idx를 가져온다음에 review를 쓴 user의 정보를 가져오기

        return reviewMapper.getUserNum(review_idx);
    }

    @Override
    public void deleteReview(int review_idx) {
        reviewMapper.deleteReview(review_idx);
    }

    @Override
    public List<String> getAllPhoto(int review_idx) {
        return reviewMapper.getAllPhoto(review_idx);
    }

    @Override
    public ReviewDto selectReview(int review_idx) {
        return reviewMapper.selectReview(review_idx);
    }

    @Override
    public void updateReview(ReviewDto dto) {
        reviewMapper.updateReview(dto);
    }

    @Override
    public void updatePhoto(ReviewPhotoDto pdto) {
        reviewMapper.updatePhoto(pdto);
    }


}
