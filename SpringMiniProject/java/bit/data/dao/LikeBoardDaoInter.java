package bit.data.dao;

import bit.data.dto.LikeBoardDto;

import java.util.List;
import java.util.Map;

public interface LikeBoardDaoInter {

    public int checkBoardLike(Map<String, Object> map);
    public int stateBoardLike(Map<String, Object> map);
    public void insertLikeBoard(LikeBoardDto dto);
    public void updateLikeState(Map<String, Object> map);
    public List<Integer> likeUserAll(int boardnum);

}
