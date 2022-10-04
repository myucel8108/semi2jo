package bit.data.dao;

import bit.data.dto.ReboardDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReboardDao implements ReboardDaoInter{

    @Autowired
    SqlSession session;

    @Override
    public void insertReboard(ReboardDto dto) {
        session.insert("insertReboard", dto);
    }

    @Override
    public List<ReboardDto> getAllReboards(int boardnum) {
        return session.selectList("getAllReboards", boardnum);
    }
}
