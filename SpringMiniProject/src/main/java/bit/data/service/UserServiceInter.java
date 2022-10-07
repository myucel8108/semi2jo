package bit.data.service;

import bit.data.dto.UserDto;

import java.util.List;
import java.util.Map;

public interface UserServiceInter {

    public int getUserTotalCount(String searchword);
    public List<UserDto> getUserList(String searchword, int startnum, int perpage);
    public UserDto getUserDetailbyManager(int usernum);
    public UserDto getDataByNum(int usernum);
    public UserDto getDataById(String email);
    public void updateUserPhoto(int usernum, String photo);
    public  void deleteUserPhoto(int usernum);
    public void updateUser(UserDto dto);
    public void deleteUser(int usernum);

}
