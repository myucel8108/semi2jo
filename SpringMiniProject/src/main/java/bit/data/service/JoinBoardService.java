package bit.data.service;

import bit.data.dao.JoinBoardDao;
import bit.data.dto.JoinBoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class JoinBoardService {


    @Autowired
    JoinBoardDao joinBoardDao;

    public List<JoinBoardDto> getReportBoardList(int startNum, int perPage){
        Map<String, Integer> map = new HashMap<>();
        map.put("startNum",startNum);
        map.put("perPage",perPage);
        return joinBoardDao.getReportBoardList(map);
    }

    public List<JoinBoardDto> getReportListCount(){
        return joinBoardDao.getReportListCount();
    }
}
