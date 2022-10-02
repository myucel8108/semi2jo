//package bit.data.dao;
//
//import java.util.List;
//import java.util.Map;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import bit.data.dto.QnaDto;
//
//@Repository
//public class QnaDao implements QnaDaoInter{
//
//    @Autowired
//    SqlSession session;
//
//    String ns="bit.data.dao.QnaDao.";
//    @Override
//	public int getMaxNum() {
//		// TODO Auto-generated method stub
//		return session.selectOne(ns + "getMaxNum");
//	}
//
//	@Override
//	public int getTotalCount(Map<String, String> map) {
//		// TODO Auto-generated method stub
//		return session.selectOne(ns + "getTotalCount", map);
//	}
//
//	@Override
//	public List<QnaDto> getPagingList(Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		return session.selectList(ns + "getPagingList", map);
//	}
//
//	@Override
//	public void insertBoard(QnaDto dto) {
//		// TODO Auto-generated method stub
//		session.insert(ns + "insertBoard", dto);
//	}
//
//	@Override
//	public void updateRestep(Map<String, Integer> map) {
//		// TODO Auto-generated method stub
//		session.update(ns + "updateRestep", map);
//	}
//
//	@Override
//	public QnaDto getData(int num) {
//		// TODO Auto-generated method stub
//		return session.selectOne(ns + "selectByNum", num);
//	}
//
//	@Override
//	public void updateBoard(QnaDto dto) {
//		// TODO Auto-generated method stub
//		session.update(ns + "updateBoard", dto);
//	}
//
//	@Override
//	public void deleteBoard(int num) {
//		// TODO Auto-generated method stub
//		session.delete(ns + "deleteBoard", num);
//	}
//
//
//}
