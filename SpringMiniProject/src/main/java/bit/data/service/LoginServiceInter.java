package bit.data.service;

import bit.data.dto.UserDto;
import org.springframework.stereotype.Service;

public interface LoginServiceInter {
    //회원가입
    public void insertUser(UserDto dto);



    public String checkLoginIdPass(String email, String loginpass);
    public UserDto getDataByNum(int usernum);

    public int checkId(String userid);

    //api 로 로그인시 email 로 판단
    public String checkLoginId(String userid);
}
