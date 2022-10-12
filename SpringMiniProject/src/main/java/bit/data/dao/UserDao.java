package bit.data.dao;

import bit.data.dto.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class UserDao implements UserDaoInter{

    @Autowired
    SqlSession session;
    String ns = "bit.data.dao.UserDao.";


    @Override
    public int getUserTotalCount() {
        return session.selectOne(ns + "getUserTotalCount");
    }

    @Override
    public List<UserDto> getUserList(Map<String, Object> map) {
        return session.selectList(ns + "getUserList", map);
    }

    @Override
    public UserDto getUserDetailbyManager(int usernum) {
        return session.selectOne(ns + "getUserDetailbyManager", usernum);
    }

    @Override
    public UserDto getDataByNum(int usernum) {
        return session.selectOne(ns+"getDataByNum", usernum);
    }

    @Override
    public UserDto getDataById(String email) {
        return session.selectOne(ns+"getDataById", email);
    }

    @Override
    public List<UserLecJoinDto> getUserLecJoin(int usernum) {
//        List<UserLecJoinDto> list = session.selectList(ns + "getUserLecJoin", usernum);
//        System.out.println(list);
        return session.selectList(ns + "getUserLecJoin", usernum);
    }

    @Override
    public void updateUserPhoto(Map<String, Object> map) {
        session.selectList(ns+"updateUserPhoto",map);
    }

    @Override
    public void deleteUserPhoto(int usernum) {
        session.selectOne(ns + "deleteUserPhoto", usernum);
    }

    @Override
    public void updateUser(UserDto dto) {
        session.selectOne(ns+"updateUser",dto);
    }

    @Override
    public void deleteUser(int usernum) {
        session.selectOne(ns+"deleteUser",usernum);
    }



    //아래로 마이커뮤니티
    @Override
    public List<BoardDto> getMyBoardList(int usernum) {
        return session.selectList(ns+"getMyBoardList", usernum);
    }
    @Override
    public List<ReboardDto> getMyReboardList(int usernum) {
        return session.selectList(ns+"getMyReboardList", usernum);
    }
    @Override
    public List<LikeBoardDto> getMyLikeboardList(int usernum) {
        return session.selectList(ns+"getMyLikeboardList", usernum);
    }
}
