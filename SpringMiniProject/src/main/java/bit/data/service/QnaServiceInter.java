package bit.data.service;

import bit.data.dto.QnaDto;

import java.util.List;

public interface QnaServiceInter {

	public void insertQna(QnaDto dto);
	public List<QnaDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage);
	public int getTotalCount(String searchcolumn, String searchword);
	public QnaDto selectByNum(int qnanum);
	public void updateQna(QnaDto dto);

	public void deleteQna(int qnanum);


}
