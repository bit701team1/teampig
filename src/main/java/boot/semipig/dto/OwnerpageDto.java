package boot.semipig.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.util.List;

@Data
@Alias("OwnerpageDto")
public class OwnerpageDto {
    private int user_idx ;
    private int food_idx ;
    private  String RESTRT_NM;
    private String TASTFDPLC_TELNO;
    private String REFINE_WGS84_LAT;
    private String REFINE_WGS84_LOGT;
    private String REPRSNT_FOOD_NM;
    private String REFINE_ROADNM_ADDR;
    private String GPT_content;
    private String food_price;
    private String opentime;
    private String closetime;
    private String holiday;
    private String point;
    private String food_type;
    private List<FoodPhotoDto> photoList;
}
