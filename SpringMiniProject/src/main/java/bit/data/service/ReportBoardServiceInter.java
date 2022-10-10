package bit.data.service;

import bit.data.dto.ReportBoardDto;

import java.util.Map;

public interface ReportBoardServiceInter {
    public int checkReportBoard(int boardnum, int usernum);
    public void insertReportBoard(ReportBoardDto dto);
}
