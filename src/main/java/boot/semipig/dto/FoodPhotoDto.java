package boot.semipig.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;


@Data
@Alias("FoodPhotoDto")
public class FoodPhotoDto {
    private int food_idx;
    private int photo_idx;
    private String photoname;
}
