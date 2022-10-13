package bit.data.dao;

import bit.data.dto.BoardDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardDao implements BoardDaoInter{

    @Autowired
    SqlSession session;

    String ns = "bit.data.dao.BoardDao.";

    @Override
    public void insertBoard(BoardDto dto) {
        session.insert(ns+"insertBoard", dto);
    }

    @Override
    public int getTotalCount(Map<String, String> map) {
        // TODO Auto-generated method stub
        return session.selectOne(ns+"getTotalCount", map);
    }

    @Override
    public List<BoardDto> getPagingList(Map<String, Object> map) {
        // TODO Auto-generated method stub
        return session.selectList(ns+"getPagingList", map);
    }
    @Override
    public BoardDto selectByNum(int boardnum) {
        // TODO Auto-generated method stub
        return session.selectOne(ns+"selectByNum", boardnum);
    }

    @Override
    public void updateReadCount(int boardnum) {
        session.update(ns+"updateReadCount", boardnum);
    }

    @Override
    public void updateBoard(BoardDto dto) {
        // TODO Auto-generated method stub
        session.update(ns+"updateBoard", dto);
    }

    @Override
    public void deleteBoard(int boardnum) {
        // TODO Auto-generated method stub
        session.delete(ns+"deleteBoard", boardnum);
    }

    @Override
    public void updateIncreLikeCount(int boardnum) {
        session.update(ns+"updateIncreLikeCount", boardnum);
    }

    @Override
    public void updateDecreLikeCount(int boardnum) {
        session.update(ns+"updateDecreLikeCount", boardnum);
    }

    @Override
    public int moveToPrevBoard(int boardnum) {
        return session.selectOne(ns+"moveToPrevBoard", boardnum);
    }
    @Override
    public int moveToNextBoard(int boardnum) {
        return session.selectOne(ns+"moveToNextBoard", boardnum);
    }

    @Override
    public int getMaxNum() {
        return session.selectOne(ns+"getMaxNum");
    }
    @Override
    public int getMinNum() {
        return session.selectOne(ns+"getMinNum");
    }

    @Override
    public void updateReportCount(int boardnum) {
        session.update(ns+"updateReportCount", boardnum);
    }

    @Override
    public List<BoardDto> getHotList() {
        return session.selectList(ns+"getHotList");
    }

    //    @Override
//    public List<BoardDto> getBoardTypeList(Map<String, Object> map) {
//        return session.selectList(ns+"getBoardTypeList", map);
//    }
}


