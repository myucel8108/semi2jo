package bit.data.service;

import bit.data.dto.ReportBoardDto;

import java.util.Map;

public interface ReportBoardServiceInter {
    public int checkReportBoard(int boardnum, int usernum);
    public void insertReportBoard(ReportBoardDto dto);

    //관리자 신고 횟수 초기화
    public void revertReport(int boardnum);
}
