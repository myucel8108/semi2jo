package bit.data.dao;

import bit.data.dto.QnaDto;


import java.util.List;
import java.util.Map;

public interface QnaDaoInter {

    public void insertQna(QnaDto dto);

    public List<QnaDto> getPagingList(Map<String, Object> map);
    public int getTotalCount(int usernum);

    public QnaDto selectByNum(int qnanum);

    public void updateQna(QnaDto dto);

    public void deleteQna(int qnanum);

    public void updateRestep(Map<String, Integer> map);

    public int getMaxNum();

    public void deleteQnaRegroup(int regroup);

}
