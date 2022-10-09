package bit.data.dao;

import bit.data.dto.ReportBoardDto;

import java.util.Map;

public interface ReportBoardDaoInter {

    public int checkReportBoard(Map<String, Object>map);
    public void insertReportBoard(ReportBoardDto dto);
}
