package boot.semipig.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;
import java.util.List;
@Data
@Alias("ReviewDto")
public class ReviewDto {
    private int Review_idx;
    private int user_idx;
    private int food_idx;
    private int score;
    private String Reviewtext;
    private List<ReviewPhotoDto> photoList;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
    private Timestamp write_day;

    //사용자 출력할떄..
    private String user_photo;
    private String user_id;
    private String user_name;

    //mypage 출력용
    private String RESTRT_NM;
    private String food_type;

}

