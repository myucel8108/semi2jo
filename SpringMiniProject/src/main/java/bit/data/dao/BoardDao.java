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
}
