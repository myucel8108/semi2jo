package bit.data.dao;

import bit.data.dto.JoinBoardDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class JoinBoardDao implements ManagerDaoInter{

    @Autowired
    SqlSession session;

    String ns = "bit.data.dao.JoinBoardDao.";

    public List<JoinBoardDto> getReportBoardList(Map<String, Integer> map){
        return session.selectList(ns+"getReportBoardList", map);
    }

    public List<JoinBoardDto> getReportListCount(){
        return session.selectList(ns+"getReportListCount");
    }
}
