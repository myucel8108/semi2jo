package bit.data.service;

import bit.data.dao.QnaDaoInter;
import bit.data.dto.QnaDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class QnaService implements QnaServiceInter{

    @Autowired
    QnaDaoInter qnaDao;


    @Override
    public void insertQna(QnaDto dto) {
        qnaDao.insertQna(dto);
    }

    @Override
    public List<QnaDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage) {
        // TODO Auto-generated method stub
        Map<String, Object>map = new HashMap<String, Object>();
        map.put("searchcolumn", searchcolumn);
        map.put("searchword", searchword);
        map.put("startnum", startnum);
        map.put("perpage", perpage);
        return qnaDao.getPagingList(map);
    }

    @Override
    public int getTotalCount(String searchcolumn, String searchword) {
        // TODO Auto-generated method stub
        Map<String, String>map = new HashMap<String, String>();
        map.put("searchcolumn", searchcolumn);
        map.put("searchword", searchword);
        return qnaDao.getTotalCount(map);
    }

    @Override
    public QnaDto selectByNum(int qnanum) {
        return qnaDao.selectByNum(qnanum);
    }


    @Override
    public void updateQna(QnaDto dto) {
        // TODO Auto-generated method stub
        qnaDao.updateQna(dto);
    }

    @Override
    public void deleteQna(int qnanum) {
        // TODO Auto-generated method stub
        qnaDao.deleteQna(qnanum);
    }
}
