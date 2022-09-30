package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class UserDto {
    private int usernum;
    private String userid;
    private String userpass;
    private String username;
    private String nickname;
    private String photo;
    private String email;
    private String addr;
    private String hp;
    private Timestamp lastlogin;
    private Timestamp birth;

}
