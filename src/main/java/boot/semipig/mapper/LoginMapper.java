package boot.semipig.mapper;

import boot.semipig.dto.LoginDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface LoginMapper {

    //아이디 있는지 확인하는 메서드
    public int isEqualId(String id);
    public int isEqualIdPass(Map<String, String> map);
    public LoginDto getUserInfo(int user_idx);
    public int getUserIdx(String id);
    public int getUserIdxByEmail(String email);
    public int doublecheck(String email);
}
