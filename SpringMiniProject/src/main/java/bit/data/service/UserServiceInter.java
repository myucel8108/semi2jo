package bit.data.service;

import bit.data.dto.UserDto;

import java.util.List;
import java.util.Map;

public interface UserServiceInter {

    public int getUserTotalCount();
    public List<UserDto> getAllUsers();
    public UserDto getDataByNum(int usernum);
    public UserDto getDataById(String userid);

    public void updateUserPhoto(int usernum, String photo);
    public void updateUser(UserDto dto);
    public void deleteUser(int usernum);

}
