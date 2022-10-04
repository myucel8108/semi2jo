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
    public int getUserTotalCount() {
        return session.selectOne(ns+"getUserTotalCount");
    }

    @Override
    public List<UserDto> getAllUsers() {
        return session.selectList(ns+"getAllUsers");
    }

    @Override
    public UserDto getDataByNum(int usernum) {
        return session.selectOne(ns+"getDataByNum", usernum);
    }

    @Override
    public UserDto getDataById(String userid) {
        return session.selectOne(ns+"getDataById", userid);
    }

    @Override
    public void updateUserPhoto(Map<String, Object> map) {
        session.selectList(ns+"updateUserPhoto",map);
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
