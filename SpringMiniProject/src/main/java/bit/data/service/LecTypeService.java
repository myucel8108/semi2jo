package bit.data.service;

import bit.data.dao.LecTypeDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LecTypeService implements LecTypeServiceInter{

    @Autowired
    LecTypeDaoInter lecTypeDao;
}
