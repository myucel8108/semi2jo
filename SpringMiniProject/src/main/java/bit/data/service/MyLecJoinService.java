package bit.data.service;

import bit.data.dao.MyLecJoinDaoInter;
import bit.data.dao.MyLectureDaoInter;
import bit.data.dto.MyLecJoinDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyLecJoinService implements MyLecJoinServiceInter{

    @Autowired
    MyLecJoinDaoInter myLecJoinDao;


    @Override
    public List<MyLecJoinDto> getMyLecListByNum(int usernum) {
        return myLecJoinDao.getMyLecListByNum(usernum);
    }
}
