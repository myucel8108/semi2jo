package bit.data.service;

import bit.data.dao.LectureDaoInter;
import bit.data.dto.LectureDto;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LectureService implements LectureServiceInter{

    @Autowired
    LectureDaoInter lectureDao;

    @Override
    public void insertLecture(LectureDto dto) {
        lectureDao.insertLecture(dto);
    }
    @Override
    public List<LectureDto> getAllLecture(){
    	
    	return lectureDao.getAllLecture();
    }
}
