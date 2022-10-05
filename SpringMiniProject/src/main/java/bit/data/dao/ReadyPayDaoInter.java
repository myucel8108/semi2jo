package bit.data.dao;

import java.util.List;


import bit.data.dto.ReadyPayDto;

public interface ReadyPayDaoInter {

	public ReadyPayDto selectByLecdeNum(int lecdenum);
	public List<ReadyPayDto> MainGetAllLecture();
}
