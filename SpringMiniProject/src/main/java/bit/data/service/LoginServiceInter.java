package bit.data.service;

import bit.data.dto.UserDto;
import org.springframework.stereotype.Service;

public interface LoginServiceInter {

    public void insertUser(UserDto dto);



    public String checkLoginIdPass(String loginid, String loginpass);
    public UserDto getDataByNum(int usernum);

    public int checkId(String userid);

    public String checkLoginId(String userid);
}
