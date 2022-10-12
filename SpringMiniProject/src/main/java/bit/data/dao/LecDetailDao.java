package bit.data.dao;

import bit.data.dto.LecDetailDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class LecDetailDao implements LecDetailDaoInter{

    @Autowired
    SqlSession session;

    String ns = "bit.data.dao.LecDetailDao.";

//    이번달에 개설된 강의 총 수 반환
    @Override
    public int getLecTotalCountMonth(Map<String, Integer> map) {
        System.out.println("dao");
        return session.selectOne(ns+"getLecTotalCountMonth",map);
    }

    @Override
    public LecDetailDto getDataByLecDeNum(int lecdenum) {
        return session.selectOne(ns+"getDataByLecDeNum",lecdenum);
    }
}
