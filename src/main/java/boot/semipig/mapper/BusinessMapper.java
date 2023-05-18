package boot.semipig.mapper;

import boot.semipig.dto.JoinDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BusinessMapper {
    public void insertUser(JoinDto dto);
}
