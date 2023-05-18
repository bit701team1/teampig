package boot.semipig.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Data
@Alias("qnaDto3")
public class qna3Dto {
    private int qna_idx;
    private String qna_subject;
    private String qna_content;
    private Timestamp qna_writeday;
}
