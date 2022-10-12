package bit.data.dao;

import bit.data.dto.*;

import java.util.List;
import java.util.Map;

public interface UserDaoInter {
    public int getUserTotalCount();
    public List<UserDto> getUserList(Map<String, Object> map);
    public UserDto getUserDetailbyManager(int usernum);
    public UserDto getDataByNum(int usernum);
    public UserDto getDataById(String email);
    public List<UserLecJoinDto> getUserLecJoin(int usernum);
    public void updateUserPhoto(Map<String, Object> map);
    public void deleteUserPhoto(int usernum);
    public void updateUser(UserDto dto);
    public void deleteUser(int usernum);




    //아래로 마이커뮤니티
    public List<BoardDto> getMyBoardList(int usernum);
    public List<ReboardDto> getMyReboardList(int usernum);
    public List<LikeBoardDto> getMyLikeboardList(int usernum);




}
