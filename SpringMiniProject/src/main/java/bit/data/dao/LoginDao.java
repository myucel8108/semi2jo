package bit.data.dao;

import bit.data.dto.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;
@Repository
public class LoginDao implements LoginDaoInter{

    @Autowired
    SqlSession session;
    String ns = "bit.data.dao.UserDao.";

    @Override
    public void insertUser(UserDto dto) {
        session.insert(ns+"insertUser",dto);
    }

    @Override
    public String checkLoginIdPass(Map<String, String> map) {
        return session.selectOne(ns+"checkLoginIdPass",map);
    }

    @Override
    public UserDto getDataByNum(int usernum) {
        return session.selectOne(ns+"getDataByNum", usernum);
    }

    @Override
    public int checkId(String userid) {
        return session.selectOne(ns+"checkId",userid);
    }

    @Override
    public String checkLoginId(String userid) {
        return session.selectOne(ns+"checkLoginId",userid);
    }
}
