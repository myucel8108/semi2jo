package bit.data.service;

import bit.data.dao.LecDetailDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LecDetailService implements LecDetailServiceInter{

    @Autowired
    LecDetailDaoInter lecDetailDao;
}
