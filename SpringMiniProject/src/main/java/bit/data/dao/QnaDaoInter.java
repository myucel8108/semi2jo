package bit.data.dao;

import java.util.List;
import java.util.Map;

import bit.data.dto.QnaDto;

public interface QnaDaoInter {
	public int getMaxNum();
	public int getTotalCount(Map<String, String> map);
	public List<QnaDto> getPagingList(Map<String, Object> map);
	public void insertBoard(QnaDto dto);
	public void updateRestep(Map<String, Integer> map);
	public QnaDto getData(int qnanum);
	public void updateBoard(QnaDto dto);
	public void deleteBoard(int qnanum);

	
}
