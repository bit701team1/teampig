package boot.semipig.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("SearchDto")
public class SearchDto {

    private int user_idx;
    private int food_idx;
    private String SIGUN_NM;
    private String RESTRT_NM;
    private String TASTFDPLC_TELNO;
    private String REPRSNT_FOOD_NM;
    private int REFINE_ZIPNO;
    private String food_type;
    private String REFINE_ROADNM_ADDR;
    private String REFINE_LOTNO_ADDR;
    private String REFINE_WGS84_LAT;
    private String REFINE_WGS84_LOGT;
    private String GPT_content;
    private int bookmarkcount;
    private String food_price;
    private double average;
    private String photoname;
}
