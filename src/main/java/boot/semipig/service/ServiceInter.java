package boot.semipig.service;

import java.time.LocalDateTime;
import java.util.List;

import boot.semipig.dto.*;

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

    List<QnaDto> qnalist(int startNum, int perPag);
    public List<ReviewDto> reviewlist(int startNum, int perPage);
    int ReservationCount(String start);
}

