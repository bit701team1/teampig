package boot.semipig.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

//search페이지에서 이용하는 정보와 거의 유사하지만,
// 같은 파일을 두명이서 작업하면 오류가 발생할 것 같아 따로 작업할 수 있도록 DTo, service, mapper, mapper xml 파일까지 새로 팜
@Alias("DetailDto")
@Data
public class DetailDto {
    private int user_idx;
    private int food_idx;
    private String SIGUN_NM;
    private String RESTRT_NM;
    private String TASTFDPLC_TELNO;
    private String REPRSNT_FOOD_NM;
    private int REFINE_ZIPNO;
    private String food_type;
    private String food_price;
    private String REFINE_ROADNM_ADDR;
    private String REFINE_LOTNO_ADDR;
    private String REFINE_WGS84_LAT;
    private String REFINE_WGS84_LOGT;
    private String GPT_content;
    private String opentime;
    private String closetime;
    private String holiday;
    private String point;
    private String average;
}
