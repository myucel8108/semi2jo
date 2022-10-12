package bit.data.dao;

import bit.data.dto.ReportBoardDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class ReportBoardDao implements ReportBoardDaoInter{

    @Autowired
    SqlSession session;

    String ns = "bit.data.dao.ReportBoardDao.";

    @Override
    public int checkReportBoard(Map<String, Object> map) {
        return session.selectOne(ns+"checkReportBoard", map);
    }

    @Override
    public void insertReportBoard(ReportBoardDto dto) {
        session.insert(ns+"insertReportBoard", dto);
    }

    //관리자 - 신고 횟수 되돌리기

    @Override
    public void revertReport(int boardnum) {
        session.delete(ns+"revertReport",boardnum);
    }
}
