package bit.data.dao;

import bit.data.dto.UserDto;

import java.util.List;
import java.util.Map;

public interface UserDaoInter {
    public int getTotalUserCount(Map<String, String> map);
    public List<UserDto> getUserList(Map<String, Object> map);
    public UserDto getDataByNum(int usernum);
    public UserDto getDataById(String userid);
    public void updateUserPhoto(Map<String, Object> map);
    public void updateUser(UserDto dto);
    public void deleteUser(int usernum);




}
