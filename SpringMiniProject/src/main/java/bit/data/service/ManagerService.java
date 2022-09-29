package bit.data.service;

import bit.data.dao.ManagerDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerService implements ManagerServiceInter{

    @Autowired
    ManagerDaoInter managerDao;
}
