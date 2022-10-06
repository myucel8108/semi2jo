package bit.data.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class ReboardDto {
    private int reboardnum;
    private int boardnum;
    private String userid;
    private String nickname;
    private String photo;
    private String recontent;
    private int regroup;
    private int restep;
    private int relevel;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
    private Timestamp writeday;
}
