package boot.semipig.service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import boot.semipig.Mapper.ServiceMapper;
import boot.semipig.dto.*;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Service;

@Service
public class MyService implements ServiceInter {
    @Autowired
    private ServiceMapper serviceMapper;
    @Override
    public void insertt(ServiceDto dto) {
        // TODO Auto-generated method stub
        serviceMapper.insertt(dto);
    }
    @Override
    public List<ServiceDto> selectt() {
        // TODO Auto-generated method stub
        return serviceMapper.selectt();
    }
    @Override
    public void deletee(int num) {
        // TODO Auto-generated method stub
        serviceMapper.deletee(num);}
    @Override
    public List<ServiceDto> getAll(int startNum, int perPage, LocalDateTime currentDateTime) {
        Map<String, Object> map = new HashMap<>();
        map.put("startNum", startNum);
        map.put("perPage", perPage);
         map.put("currentDateTime", currentDateTime);
        return serviceMapper.getAll(map);
    }
    @Override
    public void updatee(ServiceDto dto) {
        serviceMapper.updatee(dto);
    }
    @Override
    public List<couponDto> couponall()
    {
        return serviceMapper.couponall();
    }
    public void couponinsert(couponDto dto) {
        // TODO Auto-generated method stub
        serviceMapper.couponinsert(dto);
    }
    @Override
    public void deletecoupon(int num) {
        // TODO Auto-generated method stub
        serviceMapper.deletecoupon(num);
    }
    @Override
    public List<qna3Dto> qnalist(int startNum, int perPage){
        Map<String, Object> map = new HashMap<>();
        map.put("startNum", startNum);
        map.put("perPage", perPage);
        return serviceMapper.qnalist(map);
    }
    @Override
    public List<ReviewDto> reviewlist(int startNum, int perPage){
        Map<String, Object> map = new HashMap<>();
        map.put("startNum", startNum);
        map.put("perPage", perPage);
        return serviceMapper.reviewlist(map);
    }
    public DetailDto foodlist(int food_idx)
    {
        return serviceMapper.foodlist(food_idx);
    }

    public int getTotalCount() {
        return serviceMapper.getTotalCount();
    }
    public int ReservationCount(String start) {
        return serviceMapper.ReservationCount(start);
    }
}
