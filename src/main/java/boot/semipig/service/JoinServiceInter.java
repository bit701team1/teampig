package boot.semipig.service;

import boot.semipig.dto.JoinDto;
import boot.semipig.dto.OwnerpageDto;

public interface JoinServiceInter {
    public void insertUser(JoinDto dto);
    public int isIdAvailable(JoinDto dto);
    public int existFoodList(OwnerpageDto dto);
}