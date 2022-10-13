package bit.data.service;

import bit.data.dto.*;

import java.util.List;
import java.util.Map;

public interface UserServiceInter {

    public int getUserTotalCount();
    public List<UserDto> getUserList(String searchword, int startnum, int perpage);
    public UserDto getUserDetailbyManager(int usernum);
    public UserDto getDataByNum(int usernum);
    public UserDto getDataById(String email);
    public List<UserLecJoinDto> getUserLecJoin(int usernum);
    public void updateUserPhoto(int usernum, String photo);
    public  void deleteUserPhoto(int usernum);
    public void updateUser(UserDto dto);
    public void deleteUser(int usernum);
    public void updateBoardNickname(String nickname,int usernum);
    public void updateReBoardNickname(String nickname,int usernum);


    //아래로 마이커뮤니티
    public List<BoardDto> getMyBoardList(int usernum);
    public List<ReboardDto> getMyReboardList(int usernum);
    public List<LikeBoardDto> getMyLikeboardList(int usernum);

}
