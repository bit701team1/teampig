package boot.semipig.service;

import boot.semipig.dto.JoinDto;

public interface JoinServiceInter {
    public void insertUser(JoinDto dto);
    public int isIdAvailable(JoinDto dto);
}