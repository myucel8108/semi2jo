package bit.data.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.data.dto.LectureDto;
import bit.data.dto.ReadyPayDto;

@Repository
public class ReadyPayDao implements ReadyPayDaoInter {
		
	
    @Autowired
    SqlSession session;
    
    String ns = "bit.data.dao.ReadyPayDao.";
    

    @Override
    	public ReadyPayDto selectByLecdeNum(int  lecdenum) {

		return session.selectOne(ns + "selectByLecdeNum", lecdenum);
    
    }

    @Override
    public List<ReadyPayDto> MainGetAllLecture(){
    	
    	return session.selectList(ns+"MainGetAllLecture");
    	
    }
}
