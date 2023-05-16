package boot.semipig.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("JoinDto")
public class JoinDto {
    private int user_idx;
    private String id;
    private String password;
    private String user_name;
    private String hp;
    private String user_photo;
    private String shopname;
    private int user_type;
    private String email;
}
