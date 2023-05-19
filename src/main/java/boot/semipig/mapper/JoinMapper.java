package boot.semipig.mapper;

import boot.semipig.dto.JoinDto;
import boot.semipig.dto.OwnerpageDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JoinMapper {
    public void insertUser(JoinDto dto);
    public int isIdAvailable(JoinDto dto);
    int existFoodList(OwnerpageDto dto);
}
