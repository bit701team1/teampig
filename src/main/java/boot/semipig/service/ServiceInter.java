package boot.semipig.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import boot.semipig.dto.ServiceDto;
import boot.semipig.dto.couponDto;
import boot.semipig.dto.qnaDto;
import boot.semipig.dto.reviewDto;

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

    List<qnaDto> qnalist(int startNum, int perPag);
    public List<reviewDto> reviewlist(int startNum, int perPage);
    int ReservationCount(String start);
}

