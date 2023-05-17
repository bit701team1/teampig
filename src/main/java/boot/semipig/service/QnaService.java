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
    public void updateStep(int qna_ref, int qna_step) {
        Map<String, Integer> map=new HashMap<>();
        map.put("qna_ref",qna_ref);
        map.put("qna_step",qna_step);

        qnaMapper.updateStep(map);
    }
    @Override
    public void insertQnaBoard(QnaDto dto) {
        //새글인지 답글인지 판단
        int qna_ref=dto.getQna_ref();//그룹번호 답글일때만 넘어옴
        int qna_step=dto.getQna_step();
        int qna_depth=dto.getQna_depth();

        if(dto.getQna_idx()==0)
        {
            //새글인 경우
            qna_step=0;
            qna_depth=0;
            qna_ref=qnaMapper.getMaxNum()+1; //새그룹번호를 겹치지 않는 값으로 만들기 위해서
        }else {
            //답글인 경우
            //전달 받은 ref중에서 전달받은 step보다 큰 값이 있는 경우 모두 +1을 한다.
            this.updateStep(qna_ref,qna_step);
            //그리고나서 전달받은 step과 depth에 1을 증가한다.
            qna_step++;
            qna_depth++;
        }
        dto.setQna_ref(qna_ref);
        dto.setQna_step(qna_step);
        dto.setQna_depth(qna_depth);

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