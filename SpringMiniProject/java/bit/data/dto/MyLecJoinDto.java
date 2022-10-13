package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class MyLecJoinDto {
    private int mylecnum;
    private int usernum;
    private int lecdenum;
    private String payok;
    private Timestamp paytime;
    public int price;
    public String lectypea;
    private String lectypeb;
    private String lecname;
    private String teaname;
    private int roomnum;
    private String lectime;
    private String lecday;
    public int lecmonth;
    private int lecyear;

}
