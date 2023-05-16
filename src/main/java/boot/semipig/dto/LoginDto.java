package boot.semipig.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("LoginDto")
public class LoginDto {
    private int user_idx;
    private String id;
    private String password;
    private String user_name;
    private String hp;
    private String user_photo;
}
