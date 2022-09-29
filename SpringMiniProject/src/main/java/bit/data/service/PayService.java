package bit.data.service;

import bit.data.dao.PayDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PayService implements PayServiceInter{

    @Autowired
    PayDaoInter payDao;
}
