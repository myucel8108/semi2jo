package bit.data.service;

import bit.data.dao.LikeBoardDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeBoardService implements LikeBoardServiceInter{

    @Autowired
    LikeBoardDaoInter likeBoardDao;
}
