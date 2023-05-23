package boot.semipig.mapper;
import java.util.List;
import java.util.Map;

import boot.semipig.dto.*;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ServiceMapper {

    public void insertt(ServiceDto dto);
    public List<ServiceDto> selectt(int user_idx);
    public void deletee(int num);
    public List<ServiceDto> getAll(Map<String, Object> map);
    public void updatee(ServiceDto dto);
    couponDto getCouponByUserIdx(int user_idx);
    List<couponlistDto> couponlist(int user_idx);
    public List<couponlistDto> couponlist2(String user_id);
    public void couponmax (couponDto dto);
    public void couponid(couponlistDto dto);
    public void couponinsert(couponDto dto);
    public int getFoodIdx(int user_idx);
    public List<couponDto> couponall(int user_idx);
    public void deletecoupon(int num);
    public int getTotalCount(int food_idx);
    public int reviewcount (int food_idx);
    int Couponcount(String user_id);
    public List<QnaDto> qnalist(Map<String, Object> map);

    public List<ReviewDto> reviewlist(Map<String, Object> map);

    int ReservationCount(String start);
    public DetailDto getmypage(int user_idx);
    public void deleteqna(int qna_idx);

}