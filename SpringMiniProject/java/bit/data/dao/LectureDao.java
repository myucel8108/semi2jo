package bit.data.dao;

import bit.data.dto.LectureDto;

import java.util.List;

import bit.data.dto.LectureDetailJoinDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class LectureDao implements LectureDaoInter{

    @Autowired
    SqlSession session;
    String ns = "bit.data.dao.LectureDao.";

    @Override
    public int getTotalLectureCount(Map<String, String> map) {
        return session.selectOne(ns + "getTotalLectureCount", map);
    }

    @Override
    public List<LectureDto> getLectureList(Map<String, Object> map) {
        return session.selectList(ns + "getLectureList", map);
    }

    @Override
    public void insertLecture(LectureDto dto) {
        session.insert(ns + "insertLecture", dto);
    }

    @Override
    public List<LectureDetailJoinDto> getLecturePresent(int lecnum) {
        return session.selectList(ns + "getLecturePresent", lecnum);
    }

    @Override
    public LectureDetailJoinDto getLectureDetailData(int lecdenum) {
        return session.selectOne(ns + "getLecturePresent", lecdenum);
    }

    @Override
    public LectureDto getLectureDetail(int lecnum) {
        return session.selectOne(ns + "getLectureDetail", lecnum);
    }

    @Override
    public void deleteLecture(int lecnum) {
        session.selectOne(ns + "deleteLecture", lecnum);
    }

    @Override
    public void updateLecture(LectureDto dto) {
        session.selectOne(ns + "updateLecture", dto);
    }

    @Override
    public List<LectureDto> getAllLecture(){
    	return session.selectList(ns+"getAllLecture");
    }

    //lectypeA 의 종류 구하기
    @Override
    public List<LectureDto> getLecTypeA() {
        return session.selectList(ns+"getLecTypeA");
    }
}
