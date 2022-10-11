package bit.data.service;

import bit.data.dao.MyLectureDao;
import bit.data.dao.MyLectureDaoInter;
import bit.data.dto.MyLectureDto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyLectureService implements MyLectureServiceInter{

    @Autowired
    MyLectureDaoInter myLectureDao;
    
    
    @Override
    public void insertMyLecture(MyLectureDto mylecDto) {
      
    	myLectureDao.insertMyLecture(mylecDto);
    }
    
    @Override
    public void updatePayok(int usernum) {
      
    	myLectureDao.updatePayok(usernum);
    }
    @Override
    public List<MyLectureDto>   getReview(int lecdenum) {
    	
    	return myLectureDao.getReview(lecdenum);
		
    }

    @Override
    public void updateStarReview(int star, String review, int usernum, int lecdenum) {
        Map<String, Object> map= new HashMap<>();
        map.put("star",star);
        map.put("review",review);
        map.put("usernum",usernum);
        map.put("lecdenum",lecdenum);

        myLectureDao.updateStarReview(map);
    }
}
