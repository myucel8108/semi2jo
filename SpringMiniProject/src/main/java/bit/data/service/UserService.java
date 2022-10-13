package bit.data.service;

import bit.data.dao.BoardDaoInter;
import bit.data.dao.LikeBoardDaoInter;
import bit.data.dao.ReboardDaoInter;
import bit.data.dao.UserDaoInter;
import bit.data.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService implements UserServiceInter{

    @Autowired
    UserDaoInter userDao;


    @Override
    public int getUserTotalCount() {
        return userDao.getUserTotalCount();
    }

    @Override
    public List<UserDto> getUserList(String searchword, int startnum, int perpage) {
        Map<String, Object> map = new HashMap<>();
        map.put("searchword", searchword);
        map.put("startnum", startnum);
        map.put("perpage", perpage);

        return userDao.getUserList(map);
    }

    @Override
    public UserDto getUserDetailbyManager(int usernum) {
        return userDao.getUserDetailbyManager(usernum);
    }

    @Override
    public UserDto getDataByNum(int usernum) {
        return userDao.getDataByNum(usernum);
    }

    @Override
    public UserDto getDataById(String email) {
        return userDao.getDataById(email);
    }

    @Override
    public List<UserLecJoinDto> getUserLecJoin(int usernum) {
        return userDao.getUserLecJoin(usernum);
    }

    @Override
    public void updateUserPhoto(int usernum, String userphoto) {
        Map<String, Object> map= new HashMap<>();
        map.put("usernum",usernum);
        map.put("userphoto",userphoto);
        userDao.updateUserPhoto(map);
    }

    @Override
    public void deleteUserPhoto(int usernum) {
        userDao.deleteUserPhoto(usernum);
    }

    @Override
    public void updateUser(UserDto dto) {
        userDao.updateUser(dto);
    }

    @Override
    public void deleteUser(int usernum) {
        userDao.deleteUser(usernum);
    }

    @Override
    public void updateBoardNickname(String nickname, int usernum) {
        Map<String, Object> map= new HashMap<>();
        map.put("nickname",nickname);
        map.put("usernum",usernum);
        userDao.updateBoardNickname(map);
    }

    @Override
    public void updateReBoardNickname(String nickname, int usernum) {
        System.out.println(nickname);
        Map<String, Object> map= new HashMap<>();
        map.put("nickname",nickname);
        map.put("usernum",usernum);
        userDao.updateReBoardNickname(map);
    }

    //아래로 마이커뮤니티

    @Override
    public List<BoardDto> getMyBoardList(int usernum) {
        return userDao.getMyBoardList(usernum);
    }

    @Override
    public List<ReboardDto> getMyReboardList(int usernum) {
        return userDao.getMyReboardList(usernum);
    }

    @Override
    public List<LikeBoardDto> getMyLikeboardList(int usernum) {
        return userDao.getMyLikeboardList(usernum);
    }
}
