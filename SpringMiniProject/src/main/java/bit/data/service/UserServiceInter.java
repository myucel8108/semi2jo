package bit.data.service;

import bit.data.dto.UserDto;

public interface UserServiceInter {
    public void insertUser(UserDto dto);



    public int checkLoginIdPass(String loginid, String loginpass);
    public UserDto getDataById(String id);
}
