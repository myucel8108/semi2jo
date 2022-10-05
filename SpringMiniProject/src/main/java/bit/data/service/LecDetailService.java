package bit.data.service;

import bit.data.dao.LecDetailDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class LecDetailService implements LecDetailServiceInter{

    @Autowired
    LecDetailDaoInter lecDetailDao;

//    이번달에 개설된 강의 총 수 반환
    @Override
    public int getLecTotalCountMonth(int lecyear, int lecmonth) {
        System.out.println("service"+lecyear+lecmonth);
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("lecyear",lecyear);
        map.put("lecmonth",lecmonth);
        return lecDetailDao.getLecTotalCountMonth(map);
    }
}
