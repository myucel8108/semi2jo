package bit.data.service;

import bit.data.dao.MyLectureDao;
import bit.data.dao.MyLectureDaoInter;
import bit.data.dto.MyLectureDto;

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
}
