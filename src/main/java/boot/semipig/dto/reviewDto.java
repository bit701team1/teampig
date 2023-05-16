package boot.semipig.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

@Data
@Alias("reviewDto")
public class reviewDto {
    private String reviewtext;
    private Timestamp write_day;
    private int score;
}
