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

}
