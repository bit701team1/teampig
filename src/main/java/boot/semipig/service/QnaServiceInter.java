package boot.semipig.service;

import boot.semipig.dto.QnaAnswerDto;
import boot.semipig.dto.QnaDto;

import java.util.List;

public interface QnaServiceInter {

    public int getMaxNum();
    public int getTotalCount();
    public int getAnswerCount(int qna_idx);

    public void insertQnaBoard(QnaDto dto);
    public void insertQnaAnswer(QnaAnswerDto dto);
    public List<QnaAnswerDto> getQnaAnswer(int qna_idx);
    public List<QnaDto> getQnaPagingList(int start, int perpage);

    public List<QnaDto> getNoticePagingList(int start, int perpage);

    public QnaDto getData(int qna_idx); //상세보기
    public void deleteQna(int qna_idx); //질문 삭제
    public void deleteAnswer(int qna_idx,int answer_idx);//답글삭제


}