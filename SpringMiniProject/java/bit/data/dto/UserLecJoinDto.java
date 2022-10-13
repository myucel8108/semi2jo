package bit.data.dto;

import lombok.Data;

@Data
public class UserLecJoinDto {
    private int usernum;
    private int mylecnum;
    private String teaname;
    private String lecname;
    private String lectypea;
    private String lectypeb;
    private int roomnum;
    private String lectime;
    private String lecday;
    private int lecmonth;
    private int lecyear;
}
