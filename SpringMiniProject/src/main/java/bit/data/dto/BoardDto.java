package bit.data.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardDto {

    private int boardnum;
    private String boardtype;
    private int usernum;
    private String nickname;
    private String subject;
    private String content;
    private String photo;
    private int readcount;
    private int likes;
    private int report;
    private String reportcheck;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
    private Timestamp writeday;
    private int reboardcount;

}
