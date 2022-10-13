package bit.data.dto;

import lombok.Data;

@Data
public class JoinBoardDto {
    private int boardnum;
    private int reportcount;
    private int usernum;
    private String subject;
    private String boardtype;
    private String nickname;
}
