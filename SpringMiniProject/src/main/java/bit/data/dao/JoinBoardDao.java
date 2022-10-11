package bit.data.dao;

import bit.data.dto.JoinBoardDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class JoinBoardDao implements ManagerDaoInter{

    @Autowired
    SqlSession session;

    String ns = "bit.data.dao.JoinBoardDao.";

    public List<JoinBoardDto> getReportBoardList(){
        return session.selectList(ns+"getReportBoardList");
    }
}
