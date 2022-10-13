package bit.data.dao;

import bit.data.dto.UserDto;

import java.util.Map;

public interface LoginDaoInter {
    //회원가입
    public void insertUser(UserDto dto);
    public String checkLoginIdPass(Map<String, String> map);
    public UserDto getDataByNum(int usernum);
    public int checkId(String userid);

    public String checkLoginId(String email);
}

