package boot.semipig.mapper;
import java.util.List;
import java.util.Map;

import boot.semipig.dto.*;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ServiceMapper {

    public void insertt(ServiceDto dto);
    public List<ServiceDto> selectt();
    public void deletee(int num);
    public List<ServiceDto> getAll(Map<String, Object> map);
    public void updatee(ServiceDto dto);
    public List<couponDto> couponall();
    public void couponinsert(couponDto dto);
    public void deletecoupon(int num);
    public int getTotalCount();
    public List<QnaDto> qnalist(Map<String, Object> map);
    public List<ReviewDto> reviewlist(Map<String, Object> map);

    int ReservationCount(String start);
    public DetailDto getmypage(int user_idx);
}