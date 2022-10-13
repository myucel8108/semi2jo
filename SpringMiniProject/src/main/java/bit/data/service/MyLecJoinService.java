package bit.data.service;

import bit.data.dao.MyLecJoinDaoInter;
import bit.data.dao.MyLectureDaoInter;
import bit.data.dto.MyLecJoinDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MyLecJoinService implements MyLecJoinServiceInter{

    @Autowired
    MyLecJoinDaoInter myLecJoinDao;


    @Override
    public List<MyLecJoinDto> getMyLecListByNum(int usernum, String payok) {
        Map<String, Object> map= new HashMap<>();
        map.put("usernum",usernum);
        map.put("payok",payok);

        return myLecJoinDao.getMyLecListByNum(map);
    }

    @Override
    public List<MyLecJoinDto> getMyLecPayByNum(int usernum) {
        return myLecJoinDao.getMyLecPayByNum(usernum);
    }

    @Override
    public void deleteMyCartByLecdenum(int usernum, int lecdenum) {
        Map<String, Integer> map= new HashMap<>();
        map.put("usernum",usernum);
        map.put("lecdenum",lecdenum);

        myLecJoinDao.deleteMyCartByLecdenum(map);
    }
        
    @Override
    public List<MyLecJoinDto> getTotalIncom(int year, int mon) {
        Map<String, Object> map = new HashMap<>();
        map.put("year",year);
        map.put("month",mon);
        System.out.println(mon);
        return myLecJoinDao.getTotalIncom(map);
    }
}
