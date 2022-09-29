package bit.data.service;

import bit.data.dao.MyLectureDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyLectureService implements MyLectureServiceInter{

    @Autowired
    MyLectureDaoInter myLectureDao;
}
