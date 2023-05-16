package boot.semipig.service;

import boot.semipig.dto.DetailDto;
import boot.semipig.mapper.DetailMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DetailService implements DetailServiceInter{
    @Autowired
    DetailMapper detailMapper;
    @Override
    public DetailDto selectFood(int food_idx) {

        return detailMapper.selectFood(food_idx);
    }
    @Override
    public void insertFoodHistory(int user_idx, String food_type, String restrt_list) {
        Map<String, Object> map = new HashMap<>();
        map.put("user_idx", Integer.valueOf(user_idx));
        map.put("food_type", food_type);
        map.put("restrt_list", restrt_list);
        detailMapper.insertFoodHistory(map);
    }

    @Override
    public int getHistoryCount(int user_idx) {
        return detailMapper.getHistoryCount(user_idx);
    }

    @Override
    public void autoHistoryDelete(int user_idx){
        detailMapper.autoHistoryDelete(user_idx);
    }

    @Override
    public int getBookmarkCount(Integer user_idx, Integer food_idx) {
        return detailMapper.getBookmarkCount(user_idx,food_idx);
    }

    @Override
    public void insertBookmark(int user_idx, int food_idx) {
        detailMapper.insertBookmark(user_idx,food_idx);
    }

    @Override
    public void deleteBookmark(int user_idx, int food_idx) {
        detailMapper.deleteBookmark(user_idx,food_idx);
    }

    @Override
    public List<DetailDto> nearbyStore(String SIGUN_NM) {
        List<DetailDto> list=detailMapper.nearbyStore(SIGUN_NM);
        return list;
    }

}
