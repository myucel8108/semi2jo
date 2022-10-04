package bit.data.service;

import bit.data.dto.LikeBoardDto;

import java.util.List;
import java.util.Map;

public interface LikeBoardServiceInter {

    public int checkBoardLike(int boardnum, String userid);
    public int stateBoardLike(int boardnum, String userid);
    public void insertLikeBoard(LikeBoardDto dto);
    public void updateLikeState(LikeBoardDto dto);
    public List<String> likeUserAll(int boardnum);

}
