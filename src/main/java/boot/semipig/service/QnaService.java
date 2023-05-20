package boot.semipig.service;

import boot.semipig.dto.QnaAnswerDto;
import boot.semipig.dto.QnaDto;
import boot.semipig.mapper.QnaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class QnaService implements QnaServiceInter  {

    @Autowired
    private QnaMapper qnaMapper;
    @Override
    public int getMaxNum() {
        return qnaMapper.getMaxNum();
    }
    @Override
    public int getTotalCount() {
        return qnaMapper.getTotalCount();
    }
    @Override
    public int getAnswerCount(int qna_idx){
        return qnaMapper.getAnswerCount(qna_idx);
    }

    @Override
    public void insertQnaBoard(QnaDto dto) {
        //새글인지 답글인지 판단
        int qna_ref=dto.getQna_ref();//그룹번호 답글일때만 넘어옴

        if(dto.getQna_idx()==0)
        {
            qna_ref=qnaMapper.getMaxNum()+1; //새그룹번호를 겹치지 않는 값으로 만들기 위해서
        }
        dto.setQna_ref(qna_ref);

        //그리고나서 보드맵퍼가 가지고 있는 insertbaord에다가 dto를 보내면 된다.
        qnaMapper.insertQnaBoard(dto);
    }
    @Override
    public void insertQnaAnswer(QnaAnswerDto dto) {
        qnaMapper.insertQnaAnswer(dto);
    }
    @Override
    public List<QnaAnswerDto> getQnaAnswer(int qna_idx) {
        return qnaMapper.getQnaAnswer(qna_idx);
    }


    @Override
    public List<QnaDto> getQnaPagingList(int start, int perpage) {
        Map<String, Object> map=new HashMap<>();
        map.put("start",start);
        map.put("perpage",perpage);
        return qnaMapper.getQnaPagingList(map);
    }
    @Override
    public List<QnaDto> getNoticePagingList(int start, int perpage) {
        Map<String, Object> map=new HashMap<>();
        map.put("start",start);
        map.put("perpage",perpage);
        return qnaMapper.getNoticePagingList(map);
    }

    @Override
    public QnaDto getData(int qna_idx) {
        return qnaMapper.getData(qna_idx);
    }
    @Override
    public void deleteQna(int qna_idx)
    {
        qnaMapper.deleteQna(qna_idx);
    }
    @Override
    public void deleteAnswer(int qna_idx, int answer_idx)
    {
        qnaMapper.deleteAnswer(qna_idx,answer_idx);
    }



}