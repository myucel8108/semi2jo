package bit.data.service;

import bit.data.dto.QnaDto;
import bit.data.dto.UserDto;

import java.util.List;

public interface QnaServiceInter {

	public void insertQna(QnaDto dto);
	public List<QnaDto> getPagingList(int usernum, int startnum, int perpage);
	public int getTotalCount(int usernum);
	public QnaDto selectByNum(int qnanum);

	public void updateQna(QnaDto dto);

	public int getMaxNum();

	public void updateRestep(int regroup, int restep);
	public void deleteQna(int qnanum);
	public void deleteQnaRegroup(int regroup);


}
