package boot.semipig.service;

import java.time.LocalDateTime;
import java.util.List;

import boot.semipig.dto.*;

public interface ServiceInter {
    public void insertt(ServiceDto dto);
    public List<ServiceDto> selectt(int user_idx);
    public void deletee(int num);
    couponDto getCouponByUserIdx(int user_idx);
    List<ServiceDto> getAll(int startNum, int perPage,int user_idx ,LocalDateTime currentDateTime);
    public int reviewcount (int food_idx);
    List<couponlistDto> couponlist(int user_idx);
    public int getFoodIdx(int user_idx);

    public void updatee(ServiceDto dto);
    public void couponmax (couponDto dto);
    public void couponid(couponlistDto dto);
    public List<couponDto> couponall(int user_idx);
    public void couponinsert(couponDto dto);
    public void deletecoupon(int num);
    public int getTotalCount(int food_idx);

    List<QnaDto> qnalist(int startNum, int perPage, int user_idx);
    public List<ReviewDto> reviewlist(int startNum, int perPage, int user_idx);
    int ReservationCount(String start);

    public void deleteqna(int qna_idx);
}

