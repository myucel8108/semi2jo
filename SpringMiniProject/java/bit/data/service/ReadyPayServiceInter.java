package bit.data.service;
import java.util.List;

import bit.data.dto.ReadyPayDto;
public interface ReadyPayServiceInter {
	
	
	  public ReadyPayDto selectByLecdeNum(int lecdenum);
	  public List<ReadyPayDto> MainGetAllLecture();
	  public List<ReadyPayDto> selectByCategori(String lectypeb);
	  public List<ReadyPayDto> selectByCategori2(String lectypea);
}
