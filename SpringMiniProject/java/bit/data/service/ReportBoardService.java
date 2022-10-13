package bit.data.service;

import bit.data.dao.ReportBoardDaoInter;
import bit.data.dto.ReportBoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ReportBoardService implements ReportBoardServiceInter{

    @Autowired
    ReportBoardDaoInter reportBoardDao;

    @Override
    public int checkReportBoard(int boardnum, int usernum) {
        Map<String, Object>map = new HashMap<>();
        map.put("boardnum", boardnum);
        map.put("usernum", usernum);
        return reportBoardDao.checkReportBoard(map);
    }

    @Override
    public void insertReportBoard(ReportBoardDto dto) {
        reportBoardDao.insertReportBoard(dto);
    }

    //신고횟수 되돌리기 - 관리자

    @Override
    public void revertReport(int boardnum) {
        System.out.println("revert service");
        reportBoardDao.revertReport(boardnum);
    }
}
