package bit.data.service;

import bit.data.dto.BoardDto;

import java.util.List;
import java.util.Map;

public interface BoardServiceInter {

    public void insertBoard(BoardDto dto);
    public List<BoardDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage, String boardtype);
    public int getTotalCount(String searchcolumn, String searchword, String boardtype);
    public BoardDto selectByNum(int boardnum);
    public void updateReadCount(int boardnum);
    public void updateBoard(BoardDto dto);
    public void deleteBoard(int boardnum);
    public void updateIncreLikeCount(int boardnum);
    public void updateDecreLikeCount(int boardnum);
    public int moveToPrevBoard(int boardnum);
    public int moveToNextBoard(int boardnum);
    public int getMinNum();
    public int getMaxNum();
    public void updateReportCount(int boardnum);

    public List<BoardDto> getHotList();

//    public List<BoardDto> getBoardTypeList(String searchcolumn, String searchword, int startnum, int perpage);


}
