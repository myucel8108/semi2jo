package bit.data.service;

import bit.data.dto.LikeBoardDto;

import java.util.List;

public interface LikeBoardServiceInter {

    public int checkBoardLike(int boardnum, int usernum);
    public int stateBoardLike(int boardnum, int usernum);
    public void insertLikeBoard(LikeBoardDto dto);
    public void updateLikeState(LikeBoardDto dto);
    public List<Integer> likeUserAll(int boardnum);

}
