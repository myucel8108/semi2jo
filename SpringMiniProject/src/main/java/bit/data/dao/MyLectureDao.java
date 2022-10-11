package bit.data.dao;

import java.util.List;
import java.util.Map;

import bit.data.dto.LecAvgStarDto;
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
    public void updatePayok(int usernum) {
    	
    	
    	session.update(ns+"updatePayok", usernum);
    }
    
    @Override
    public List<MyLectureDto>  getReview(int lecdenum) {
   
    return session.selectList(ns+"getReview", lecdenum);
    	
    }

    @Override
    public void updateStarReview(Map<String, Object> map) {
        session.selectOne(ns+"updateStarReview",map);
    }

    @Override
    public LecAvgStarDto getAvgstarByLecnum(int lecnum) {
        return session.selectOne(ns+"getAvgstarByLecnum", lecnum);
    }

    @Override
    public void updateAvgstarByLecnum(Map<String, Object> map) {
        session.selectOne(ns+"updateAvgstarByLecnum",map);
    }
}
