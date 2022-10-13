package bit.data.dao;

import bit.data.dto.QnaDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class QnaDao implements QnaDaoInter{

    @Autowired
    SqlSession session;

    String ns = "bit.data.dao.QnaDao.";

    @Override
    public void insertQna(QnaDto dto) {
        session.insert(ns+"insertQna", dto);
    }

    @Override
    public int getTotalCount(int usernum) {
        // TODO Auto-generated method stub
        return session.selectOne(ns+"getTotalCount", usernum);
    }

    @Override
    public List<QnaDto> getPagingList(Map<String, Object> map) {
        // TODO Auto-generated method stub
        return session.selectList(ns+"getPagingList", map);
    }
    @Override
    public QnaDto selectByNum(int qnanum) {
        // TODO Auto-generated method stub
        return session.selectOne(ns+"selectByNum", qnanum);
    }

    @Override
    public void updateQna(QnaDto dto) {
        session.update(ns+"updateQna", dto);
    }


    @Override
    public void deleteQna(int qnanum) {
        // TODO Auto-generated method stub
        session.delete(ns+"deleteQna", qnanum);
    }

    @Override
    public void updateRestep(Map<String, Integer> map) {
        // TODO Auto-generated method stub
        session.update(ns+"updateRestep",map);
    }

    @Override
    public int getMaxNum() {
        return session.selectOne(ns+"getMaxNum");
    }

    @Override
    public void deleteQnaRegroup(int regroup) {
        session.delete(ns+"deleteQnaRegroup",regroup);
    }
}



