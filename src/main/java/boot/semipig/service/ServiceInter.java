package boot.semipig.service;

import java.time.LocalDateTime;
import java.util.List;

import boot.semipig.dto.ServiceDto;
import boot.semipig.dto.couponDto;
import boot.semipig.dto.qna3Dto;
import boot.semipig.dto.ReviewDto;

public interface ServiceInter {
    public void insertt(ServiceDto dto);
    public List<ServiceDto> selectt();
    public void deletee(int num);

    List<ServiceDto> getAll(int startNum, int perPage, LocalDateTime currentDateTime);

    public void updatee(ServiceDto dto);
    public List<couponDto> couponall();
    public void couponinsert(couponDto dto);
    public void deletecoupon(int num);

    public int getTotalCount();

    List<qna3Dto> qnalist(int startNum, int perPag);
    public List<ReviewDto> reviewlist(int startNum, int perPage);
    int ReservationCount(String start);
}

