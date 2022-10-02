package bit.data.service;

import bit.data.dao.BoardDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService implements BoardServiceInter{

    @Autowired
    BoardDaoInter boardDao;
}
