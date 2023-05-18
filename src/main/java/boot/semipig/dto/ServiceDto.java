package boot.semipig.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("ServiceDto")
public class ServiceDto {
    private String num;
    private int user_idx;
    private String user_id;
    private String store_id;
    private String start;
}