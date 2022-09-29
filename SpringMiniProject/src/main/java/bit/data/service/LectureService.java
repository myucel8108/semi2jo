package bit.data.service;

import bit.data.dao.LectureDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LectureService implements LectureServiceInter{

    @Autowired
    LectureDaoInter lectureDao;
}
