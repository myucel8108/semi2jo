package bit.data.dao;

import bit.data.dto.ReportBoardDto;

import java.util.Map;

public interface ReportBoardDaoInter {

    public int checkReportBoard(Map<String, Object>map);
    public void insertReportBoard(ReportBoardDto dto);

    //관리자 - 신고 횟수 되돌리기
    public void revertReport(int boardnum);
}
