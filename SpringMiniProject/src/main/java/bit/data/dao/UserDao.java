package bit.data.dao;

import bit.data.dto.UserDto;
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
    public int getTotalUserCount(Map<String, String> map) {
        return session.selectOne(ns + "getTotalUserCount", map);
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
}
