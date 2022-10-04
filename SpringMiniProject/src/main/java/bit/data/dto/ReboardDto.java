package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ReboardDto {
    private int reboardnum;
    private int boardnum;
    private String userid;
    private String nickname;
    private String recontent;
    private int regroup;
    private int restep;
    private int relevel;
    private Timestamp writeday;
}
