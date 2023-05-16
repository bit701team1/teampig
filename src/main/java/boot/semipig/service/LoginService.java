package boot.semipig.service;

import boot.semipig.dto.LoginDto;
import boot.semipig.mapper.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class LoginService implements LoginServiceInter
{
    @Autowired
    LoginMapper loginMapper;

    @Override
    public int isEqualId(String id) {
        return loginMapper.isEqualId(id);
    }

    @Override
    public int isEqualIdPass(String id, String password) {
        if(isEqualId(id)==1){
            Map<String, String> map=new HashMap<String, String>();
            map.put("id", id);
            map.put("password", password);
            return loginMapper.isEqualIdPass(map);
        } else{
            return 0;
        }
    }

    @Override
    public LoginDto getUserInfo(int user_idx) {
        return loginMapper.getUserInfo(user_idx);
    }

    @Override
    public int getUserIdx(String id) {
        return loginMapper.getUserIdx(id);
    }

    @Override
    public int getUserIdxByEmail(String email) {
        return loginMapper.getUserIdxByEmail(email);
    }

    @Override
    public int doublecheck(String email) {
        return loginMapper.doublecheck(email);
    }
}
