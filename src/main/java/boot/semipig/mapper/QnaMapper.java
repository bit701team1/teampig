package boot.semipig.mapper;

import boot.semipig.dto.QnaAnswerDto;
import boot.semipig.dto.QnaDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface QnaMapper {
    public int getMaxNum(); //답글관련
    public void updateStep(Map<String, Integer> map); //ref, step이 들어있다.
    
    //qna 카운트랑, qna_idx를 받은 answer카운트
    public int getTotalCount();
    public int getAnswerCount(int qna_idx);
    //답변리스트 출력시 필요
    public List<QnaAnswerDto> getQnaAnswer(int qna_idx);

    // 글쓰기 인서트, 관리자의 답변 인서트
    public void insertQnaBoard(QnaDto dto);
    public void insertQnaAnswer(QnaAnswerDto dto);


    //페이징리스트(유저qnalist, 공지list 출력)`
    public List<QnaDto> getQnaPagingList(Map<String,Object> map); //map에는 start,perpage
    public List<QnaDto> getNoticePagingList(Map<String,Object> Map);

    public QnaDto getData(int qna_idx); //상세보기
    public void deleteQna(int qna_idx); //질문 글 삭제
    public void deleteAnswer(int qna_idx,int answer_idx); //답글 삭제


}