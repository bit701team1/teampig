package boot.semipig.service;

import boot.semipig.dto.JoinDto;
import boot.semipig.dto.OwnerpageDto;
import boot.semipig.mapper.JoinMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinService implements JoinServiceInter{
    @Autowired
    private JoinMapper joinMapper;
    @Override
    public void insertUser(JoinDto dto) {
        joinMapper.insertUser(dto);
    }

    @Override
    public int isIdAvailable(JoinDto dto) {
        int idAvailable=joinMapper.isIdAvailable(dto);
        if(idAvailable == 1)
        {
            return 1;
        }else{
            return 0;
        }
    }

    @Override
    public int existFoodList(OwnerpageDto dto) {
        int existFoodList=joinMapper.existFoodList(dto);
        if(existFoodList == 1)
        {
            return 1;
        }else{
            return 0;
        }
    }

    @Override
    public int selectUserType(int user_idx) {
        int selectUserType= joinMapper.selectUserType(user_idx);

        return selectUserType;
    }


}
