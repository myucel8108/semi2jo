package bit.data.service;

import bit.data.dao.UserDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserServiceInter{

    @Autowired
    UserDaoInter userDao;
}
