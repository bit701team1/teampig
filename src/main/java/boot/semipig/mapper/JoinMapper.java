package boot.semipig.mapper;

import boot.semipig.dto.JoinDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JoinMapper {
    public void insertUser(JoinDto dto);
    public int isIdAvailable(JoinDto dto);
}
