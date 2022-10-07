package bit.data.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.BoardDto;
import bit.data.dto.MyLectureDto;

@Repository
public class MyLectureDao implements MyLectureDaoInter{

    @Autowired
    SqlSession session;
    String ns = "bit.data.dao.MyLectureDao.";
    
    @Override
    public void insertMyLecture(MyLectureDto mylecDto) {
    	
        session.insert(ns+"insertMyLecture", mylecDto);
    }
    @Override
    public void updatePayok(MyLectureDto mylecDto) {
    	
    	
    	session.update(ns+"updatePayok", mylecDto);
    }
    
}
