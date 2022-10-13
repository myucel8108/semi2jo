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

    String ns="bit.data.dao.LikeBoardDao.";

    @Override
    public int checkBoardLike(Map<String, Object> map) {
        return session.selectOne(ns+"checkBoardLike", map);
    }

    @Override
    public int stateBoardLike(Map<String, Object> map) {
        try {
            return session.selectOne(ns + "stateBoardLike", map);
        }catch(Exception e){ //새 게시글일 경우 0값을 준다
            return 0;
        }
    }

    @Override
    public void insertLikeBoard(LikeBoardDto dto) {
        session.insert(ns+"insertLikeBoard", dto);
    }

    @Override
    public void updateLikeState(Map<String, Object> map) {
        session.update(ns+"updateLikeState", map);
    }

    @Override
    public List<Integer> likeUserAll(int boardnum) {
        return session.selectList(ns+"likeUserAll", boardnum);
    }
}
