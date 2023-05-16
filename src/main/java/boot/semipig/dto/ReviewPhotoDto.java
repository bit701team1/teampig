package boot.semipig.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("ReviewPhotoDto")
public class ReviewPhotoDto {
    private int photo_idx;
    private int review_idx;
    private String photoname;
}
