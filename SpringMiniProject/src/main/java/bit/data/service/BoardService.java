package bit.data.service;

import bit.data.dao.BoardDaoInter;
import bit.data.dto.BoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService implements BoardServiceInter{

    @Autowired
    BoardDaoInter boardDao;

    @Override
    public void insertBoard(BoardDto dto) {
        // TODO Auto-generated method stub
        boardDao.insertBoard(dto);
    }
    @Override
    public List<BoardDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage) {
        // TODO Auto-generated method stub
        Map<String, Object>map = new HashMap<String, Object>();
        map.put("searchcolumn", searchcolumn);
        map.put("searchword", searchword);
        map.put("startnum", startnum);
        map.put("perpage", perpage);
        return boardDao.getPagingList(map);
    }

    @Override
    public int getTotalCount(String searchcolumn, String searchword) {
        // TODO Auto-generated method stub
        Map<String, String>map = new HashMap<String, String>();
        map.put("searchcolumn", searchcolumn);
        map.put("searchword", searchword);
        return boardDao.getTotalCount(map);
    }

    @Override
    public BoardDto selectByNum(int boardnum) {
        return boardDao.selectByNum(boardnum);
    }

    @Override
    public void updateReadCount(int boardnum) {
        boardDao.updateReadCount(boardnum);
    }

    @Override
    public void updateBoard(BoardDto dto) {
        // TODO Auto-generated method stub
        boardDao.updateBoard(dto);
    }

    @Override
    public void deleteBoard(int boardnum) {
        // TODO Auto-generated method stub
        boardDao.deleteBoard(boardnum);
    }

    @Override
    public void updateIncreLikeCount(int boardnum) {
        boardDao.updateIncreLikeCount(boardnum);
    }

    @Override
    public void updateDecreLikeCount(int boardnum) {
        boardDao.updateDecreLikeCount(boardnum);
    }

    @Override
    public int moveToPrevBoard(int boardnum) {
        return boardDao.moveToPrevBoard(boardnum);
    }
    @Override
    public int moveToNextBoard(int boardnum) {
        return boardDao.moveToNextBoard(boardnum);
    }

    @Override
    public int getMinNum() {
        return boardDao.getMinNum();
    }

    @Override
    public int getMaxNum() {
        return boardDao.getMaxNum();
    }

    @Override
    public void updateReportCount(int boardnum) {
        boardDao.updateReportCount(boardnum);
    }

    @Override
    public List<BoardDto> getHotList() {
        return boardDao.getHotList();
    }

    //    @Override
//    public List<BoardDto> getBoardTypeList(String searchcolumn, String searchword, int startnum, int perpage) {
//        Map<String, Object>map = new HashMap<String, Object>();
//        map.put("searchcolumn", searchcolumn);
//        map.put("searchword", searchword);
//        map.put("startnum", startnum);
//        map.put("perpage", perpage);
//        return boardDao.getBoardTypeList(map);
//    }
}
