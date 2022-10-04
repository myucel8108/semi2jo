package bit.data.service;

import bit.data.dao.LikeBoardDaoInter;
import bit.data.dto.LikeBoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LikeBoardService implements LikeBoardServiceInter{

    @Autowired
    LikeBoardDaoInter likeBoardDao;

    @Override
    public int checkBoardLike(int boardnum, String userid) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardnum", boardnum);
        map.put("userid", userid);
        return likeBoardDao.checkBoardLike(map);
    }

    @Override
    public int stateBoardLike(int boardnum, String userid) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardnum", boardnum);
        map.put("userid", userid);
        return likeBoardDao.stateBoardLike(map);
    }

    @Override
    public void insertLikeBoard(LikeBoardDto dto) {
        likeBoardDao.insertLikeBoard(dto);
    }

    @Override
    public void updateLikeState(LikeBoardDto dto) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("boardnum",dto.getBoardnum());
        map.put("userid", dto.getUserid());
        map.put("likestate",dto.getLikestate());
        likeBoardDao.updateLikeState(map);
    }

    @Override
    public List<String> likeUserAll(int boardnum) {
        return likeBoardDao.likeUserAll(boardnum);
    }
}