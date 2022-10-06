package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class UserDto {
    private int usernum;
    private String usertype;
    private String email;
    private String userpass;
    private String username;
    private String nickname;
    private String userphoto;
    private String addr;
    private String hp;
    private Timestamp lastlogin;
    private Timestamp birth;

}
