package bit.data.service;

import bit.data.dao.QnaDaoInter;
import bit.data.dto.QnaDto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService implements QnaServiceInter{

    @Autowired
    QnaDaoInter qnaDao;
    @Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return qnaDao.getMaxNum();
	}

	@Override
	public int getTotalCount(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		
		return qnaDao.getTotalCount(map);
	}

	@Override
	public List<QnaDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("startnum", startnum);
		map.put("perpage", perpage);
		
		return qnaDao.getPagingList(map);
	}

	@Override
	public void insertBoard(QnaDto dto) {
		// TODO Auto-generated method stub
		//새글인지 답글인지 판단해서 로직을 짠다
		int num = dto.getQnanum(); //새 글일 경우는 0이 들어가있다
		int regroup = dto.getRegroup();
		int restep = dto.getRestep();
		int relevel = dto.getRelevel();
		
		if(num==0) { //새 글인 경우
			regroup = this.getMaxNum()+1;
			restep = 0;
			relevel = 0;
		} else { //답글일 경우
			//같은 그룹 중 전달 받은 restep보다 큰 값들은 모두 일괄적으로 +1을 해준다
			this.updateRestep(regroup, restep);
			//그리고나서 전달 받은 값보다 1 크게 db에 저장한다
			restep++;
			relevel++;
		}
		//변경된 값들을 다시 dto에 넣는다
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		qnaDao.insertBoard(dto);
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<>();
		map.put("regroup", regroup);
		map.put("restep", restep);
				
		qnaDao.updateRestep(map);
	}

	@Override
	public QnaDto getData(int qnanum) {
		// TODO Auto-generated method stub
		return qnaDao.getData(qnanum);
	}

	@Override
	public void updateBoard(QnaDto dto) {
		// TODO Auto-generated method stub
		qnaDao.updateBoard(dto);
	}

	@Override
	public void deleteBoard(int qnanum) {
		// TODO Auto-generated method stub
		qnaDao.deleteBoard(qnanum);
	}

	@Override
	public void updateReadCount(int qnanum) {
		// TODO Auto-generated method stub
		
	}

    
}
