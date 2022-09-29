package bit.data.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeBoardDao implements LikeBoardDaoInter{

    @Autowired
    SqlSession session;
}
