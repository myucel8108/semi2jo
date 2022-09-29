package bit.data.service;

import bit.data.dao.LockerDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LockerService implements LockerServiceInter{

    @Autowired
    LockerDaoInter lockeerDao;
}
