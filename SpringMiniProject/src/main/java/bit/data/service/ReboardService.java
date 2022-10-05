package bit.data.service;

import bit.data.dao.ReboardDaoInter;
import bit.data.dto.ReboardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReboardService implements ReboardServiceInter{

    @Autowired
    ReboardDaoInter reboardDao;

    @Override
    public void insertReboard(ReboardDto dto) {
       reboardDao.insertReboard(dto);
    }
    @Override
    public List<ReboardDto> getAllReboards(int boardnum) {
        return reboardDao.getAllReboards(boardnum);
    }

    @Override
    public void deleteByReboardnum(int reboardnum) {
        reboardDao.deleteByReboardnum(reboardnum);
    }

//    @Override
//    public ReboardDto selectByNum(int reboardnum) {
//        return reboardDao.selectByNum(reboardnum);
//    }
}
