package boot.semipig.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("AnswerDto")
public class QnaAnswerDto {
    private int answer_idx;
    private int qna_idx;
    private String answer_content;

    private int answer_content_done;
}
