package boot.semipig.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;
import org.apache.jasper.tagplugins.jstl.core.If;

import java.io.Writer;
import java.sql.Timestamp;
import java.util.List;

@Data
@Alias("QnaDto")
public class QnaDto {

    private int qna_idx;
    private String writer;
    private String qna_pass;
    private String qna_subject;
    private String qna_content;

    private List<QnaAnswerDto> qna_answer;


    private int qna_readcount;
    private int qna_ref;
    private int qna_step;
    private int qna_depth;
    private int user_idx;
    private int user_type;
    private boolean qna_ispass;
    private Timestamp qna_writeday;
}

