package bit.data.dao;

import bit.data.dto.UserDto;

import java.util.Map;

public interface UserDaoInter {
    public void insertUser(UserDto dto);
    public int checkLoginIdPass(Map<String, String> map);
    public UserDto getDataById(String id);
}
