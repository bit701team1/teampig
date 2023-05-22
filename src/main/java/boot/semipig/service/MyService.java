package boot.semipig.service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import boot.semipig.mapper.ServiceMapper;
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
    public List<ServiceDto> selectt(int user_idx) {
        // TODO Auto-generated method stub
        return serviceMapper.selectt(user_idx);
    }
    @Override
    public List<couponlistDto> couponlist2(String user_id){
        return serviceMapper.couponlist2(user_id);
    }
    @Override
    public void deletee(int num) {
        // TODO Auto-generated method stub
        serviceMapper.deletee(num);}
    @Override
    public List<ServiceDto> getAll(int startNum, int perPage, int user_idx,LocalDateTime currentDateTime) {
        Map<String, Object> map = new HashMap<>();
        map.put("startNum", startNum);
        map.put("perPage", perPage);
        map.put("user_idx",user_idx);
         map.put("currentDateTime", currentDateTime);
        return serviceMapper.getAll(map);
    }
    @Override
    public couponDto getCouponByUserIdx(int user_idx) {
        return serviceMapper.getCouponByUserIdx(user_idx);
    }
    @Override
    public int getFoodIdx(int user_idx) {
        return serviceMapper.getFoodIdx(user_idx);
    }
    @Override
    public List<couponlistDto> couponlist(int user_idx){
        return  serviceMapper.couponlist(user_idx);
    }
    @Override
    public void deleteqna(int qna_idx) {
        // TODO Auto-generated method stub
        serviceMapper.deleteqna(qna_idx);}
    @Override
    public void updatee(ServiceDto dto) {
        serviceMapper.updatee(dto);
    }
    @Override
    public void couponmax(couponDto dto){
        serviceMapper.couponmax(dto);
    }
    @Override
    public void couponid(couponlistDto dto){
        serviceMapper.couponid(dto);
    }
    @Override
    public void couponinsert(couponDto dto){
        serviceMapper.couponinsert(dto);
    }
    @Override
    public List<couponDto> couponall(int user_idx)
    {
        return serviceMapper.couponall(user_idx);
    }
    @Override
    public void deletecoupon(int num) {
        // TODO Auto-generated method stub
        serviceMapper.deletecoupon(num);
    }
    @Override
    public List<QnaDto> qnalist(int startNum, int perPage, int user_idx){
        Map<String, Object> map = new HashMap<>();
        map.put("startNum", startNum);
        map.put("perPage", perPage);
        map.put("user_idx",user_idx);
        return serviceMapper.qnalist(map);
    }
    @Override
    public List<ReviewDto> reviewlist(int startNum, int perPage, int food_idx){
        Map<String, Object> map = new HashMap<>();
        map.put("food_idx",food_idx);
        map.put("startNum", startNum);
        map.put("perPage", perPage);
        map.put("food_idx",food_idx);
        return serviceMapper.reviewlist(map);
    }

    public int getTotalCount(int food_idx) {
        return serviceMapper.getTotalCount(food_idx);
    }
    public int reviewcount(int food_idx)
    {
        return serviceMapper.reviewcount(food_idx);
    }
    public int ReservationCount(String start) {
        return serviceMapper.ReservationCount(start);
    }
}
