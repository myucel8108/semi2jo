package bit.data.dao;

import bit.data.dto.LectureDto;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LectureDao implements LectureDaoInter{

    @Autowired
    SqlSession session;
    String ns = "bit.data.dao.LectureDao.";

    @Override
    public void insertLecture(LectureDto dto) {
        session.insert(ns + "insertLecture", dto);
    }
    
    @Override
    public List<LectureDto> getAllLecture(){
    	return session.selectList(ns+"getAllLecture");
    }
 
}
