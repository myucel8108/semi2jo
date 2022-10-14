package bit.data.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bit.data.dao.ReadyPayDaoInter;
import bit.data.dto.ReadyPayDto;

@Service
public class ReadyPayService  implements ReadyPayServiceInter {
	
	 @Autowired
	  ReadyPayDaoInter ReadyPayDao; 
	 
	 @Override
	    public ReadyPayDto selectByLecdeNum(int lecdenum) {
	        
		return ReadyPayDao.selectByLecdeNum(lecdenum);
		
	    }
	 
	 @Override
	 public List<ReadyPayDto> MainGetAllLecture() {
		 
		 
			return ReadyPayDao.MainGetAllLecture();
	 }
	 @Override
	 public List<ReadyPayDto> selectByCategori(String lectypea) {
		 
		 
			return ReadyPayDao.selectByCategori(lectypea);
	 }

	 

}
