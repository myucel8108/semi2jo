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





}
