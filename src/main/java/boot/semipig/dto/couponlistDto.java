package boot.semipig.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("couponlistDto")
public class couponlistDto {
    private int num;
    private String number;
    private String time;
    private int user_idx;
    private String user_id;
    private String storename;
}
