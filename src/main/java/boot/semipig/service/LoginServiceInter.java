package boot.semipig.service;

import boot.semipig.dto.LoginDto;

public interface LoginServiceInter {
    public int isEqualId(String id);
    public int isEqualIdPass(String id, String pass);
    public LoginDto getUserInfo(int user_idx);
    public int getUserIdx(String id);
    public int getUserIdxByEmail(String email);
    public int doublecheck(String email);

}
