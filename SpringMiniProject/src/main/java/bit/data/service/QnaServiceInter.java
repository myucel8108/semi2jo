package bit.data.service;

import java.util.List;

import bit.data.dto.QnaDto;

public interface QnaServiceInter {
	public int getMaxNum();
	public int getTotalCount(String searchcolumn, String searchword);
	public List<QnaDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage);
	public void insertBoard(QnaDto dto);
	public void updateRestep(int regroup, int restep);
	public void updateReadCount(int qnanum);
	public QnaDto getData(int qnanum);
	public void updateBoard(QnaDto dto);
	public void deleteBoard(int qnanum);
	
}
