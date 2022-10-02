package bit.data.service;

import bit.data.dto.UserDto;
import org.springframework.stereotype.Service;

public interface LoginServiceInter {

    public void insertUser(UserDto dto);



    public int checkLoginIdPass(String loginid, String loginpass);
    public UserDto getDataById(String id);

    public int checkId(String userid);
}
