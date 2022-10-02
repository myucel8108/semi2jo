package bit.data.dao;

import bit.data.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class UserDao implements UserDaoInter{

    @Autowired
    SqlSession session;
    String ns = "bit.data.dao.UserDao.";

    @Override
    public void insertUser(UserDto dto) {
        session.insert(ns+"insertUser",dto);
    }

    @Override
    public int checkLoginIdPass(Map<String, String> map) {
        return session.selectOne(ns+"checkLoginIdPass",map);
    }

    @Override
    public UserDto getDataById(String loginid) {
        return session.selectOne(ns+"getDataById", loginid);
    }
}
