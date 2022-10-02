package bit.data.dao;

import bit.data.dto.LectureDto;
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
}
