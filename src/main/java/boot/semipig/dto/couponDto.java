package boot.semipig.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Data
@Alias("couponDto")
public class couponDto {
    private int num;
    private String number;
    private int max;
    private String time;
    private int user_idx;
}
