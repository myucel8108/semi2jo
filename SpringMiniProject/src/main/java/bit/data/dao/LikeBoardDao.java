package bit.data.dao;

import bit.data.dto.LikeBoardDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class LikeBoardDao implements LikeBoardDaoInter{

    @Autowired
    SqlSession session;

    @Override
    public int checkBoardLike(Map<String, Object> map) {
        return session.selectOne("checkBoardLike", map);
    }

    @Override
    public int stateBoardLike(Map<String, Object> map) {
        return session.selectOne("stateBoardLike", map);
    }

    @Override
    public void insertLikeBoard(LikeBoardDto dto) {
        session.insert("insertLikeBoard", dto);
    }

    @Override
    public void updateLikeState(Map<String, Object> map) {
        session.update("updateLikeState", map);
    }

    @Override
    public List<String> likeUserAll(int boardnum) {
        return session.selectList("likeUserAll", boardnum);
    }
}
