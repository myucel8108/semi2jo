package bit.data.dto;

import lombok.Data;

@Data
public class LikeBoardDto {

    private int likeboardnum;
    private String userid;
    private int boardnum;
    private int likestate;
}
