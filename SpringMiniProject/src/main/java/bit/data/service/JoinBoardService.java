package bit.data.service;

import bit.data.dao.JoinBoardDao;
import bit.data.dao.ManagerDaoInter;
import bit.data.dto.JoinBoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JoinBoardService {


    @Autowired
    JoinBoardDao joinBoardDao;

    public List<JoinBoardDto> getReportBoardList(){

        return joinBoardDao.getReportBoardList();
    }
}
