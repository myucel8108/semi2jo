package bit.data.dto;

import lombok.Data;

@Data
public class UserLecJoinDto {
    public int usernum;
    public int mylecnum;
    public String teaname;
    public String lecname;
    public String lectypea;
    public String lectypeb;
    public int roomnum;
    public String lectime;
    public String lecday;
    public int lecmonth;
    public int lecyear;
}
