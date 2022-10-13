package bit.data.service;

import bit.data.dao.QnaDao;
import bit.data.dao.QnaDaoInter;
import bit.data.dto.QnaDto;
import bit.data.dto.UserDto;
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

        //새글인지 답글인지 판단해서 로직을 짠다
        int qnanum=dto.getQnanum(); //새글일 경우는 0이 들어가있다
        int regroup=dto.getRegroup();
        int restep=dto.getRestep();
        int relevel=dto.getRelevel();

        if(qnanum==0)//새글일 경우
        {
            regroup=this.getMaxNum()+1; // regroup이 겹치지 않게 하기 위함
            restep=0;
            relevel=0;
        }else {//답글일 경우
            //같은 그룹 중 전달받은 restep보다 큰 값들은 모두 일괄적으로 +1을 해준다
            this.updateRestep(regroup, restep);
            //그리고나서 전달 받은 값보다 1크게 db에 저장을 해야한다
            restep++;
            relevel++;
        }
        //변경된 값들을 dto에 넣어준다
        dto.setRegroup(regroup);
        dto.setRestep(restep);
        dto.setRelevel(relevel);


        qnaDao.insertQna(dto);
    }

    @Override
    public List<QnaDto> getPagingList(int usernum, int startnum, int perpage) {
        // TODO Auto-generated method stub
        Map<String, Object>map = new HashMap<>();
        map.put("usernum", usernum);
        map.put("startnum", startnum);
        map.put("perpage", perpage);
        return qnaDao.getPagingList(map);
    }

    @Override
    public int getTotalCount(int usernum) {
        // TODO Auto-generated method stub
        return qnaDao.getTotalCount(usernum);
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
    public int getMaxNum() {
        return qnaDao.getMaxNum();
    }

    @Override
    public void deleteQna(int qnanum) {
        // TODO Auto-generated method stub

        qnaDao.deleteQna(qnanum);
    }

    @Override
    public void updateRestep(int regroup, int restep) {

        Map<String, Integer>map=new HashMap<String, Integer>();
        map.put("regroup", regroup);
        map.put("restep", restep);

        qnaDao.updateRestep(map);

    }



    @Override
    public void deleteQnaRegroup(int regroup) {
        qnaDao.deleteQnaRegroup(regroup);
    }
}


