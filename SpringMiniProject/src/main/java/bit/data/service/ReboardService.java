package bit.data.service;

import bit.data.dao.ReboardDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReboardService implements ReboardServiceInter{

    @Autowired
    ReboardDaoInter reboardDao;
}
