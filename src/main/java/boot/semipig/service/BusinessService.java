package boot.semipig.service;

import boot.semipig.dto.JoinDto;
import boot.semipig.mapper.BusinessMapper;
import boot.semipig.mapper.JoinMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BusinessService implements BusinessServiceInter {
    @Autowired
    private BusinessMapper businessMapper;
    @Override
    public void insertUser(JoinDto dto) {
        businessMapper.insertUser(dto);
    }
}
