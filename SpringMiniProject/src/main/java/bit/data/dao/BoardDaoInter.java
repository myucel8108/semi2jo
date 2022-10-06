package bit.data.dao;

import bit.data.dto.BoardDto;


import java.util.List;
import java.util.Map;

public interface BoardDaoInter {

    public void insertBoard(BoardDto dto);

    public List<BoardDto> getPagingList(Map<String, Object> map);
    public int getTotalCount(Map<String, String>map);

    public BoardDto selectByNum(int boardnum);
    public void updateReadCount(int boardnum);
    public void updateBoard(BoardDto dto);
    public void deleteBoard(int boardnum);

    public void updateIncreLikeCount(int boardnum);
    public void updateDecreLikeCount(int boardnum);
    public int moveToPrevBoard(int boardnum);
    public int moveToNextBoard(int boardnum);








}
