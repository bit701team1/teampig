package boot.semipig.mapper;

import boot.semipig.dto.ReviewDto;
import boot.semipig.dto.ReviewPhotoDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewMapper {

    public void insertReview(ReviewDto dto);
    public void insertPhoto(ReviewPhotoDto dto);
    public List<ReviewDto> getAllReview(int food_idx);
    public List<ReviewPhotoDto> getPhotos(int review_idx);
    public int getUserNum(int review_idx); //review idx를 받아와서 user idx를 가져온다음에 review를 쓴 user의 정보를 가져오기
    public void deleteReview(int review_idx);
    public List<String> getAllPhoto(int review_idx);
    public ReviewDto selectReview(int review_idx);

    public void updateReview(ReviewDto dto);
    public void updatePhoto(ReviewPhotoDto pdto);
    public void deletePhoto(int review_idx);
}
