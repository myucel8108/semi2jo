package bit.data.service;

import bit.data.dao.LectureDaoInter;
import bit.data.dto.LectureDto;

import java.util.List;

import bit.data.dto.LectureDetailJoinDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class LectureService implements LectureServiceInter{

    @Autowired
    LectureDaoInter lectureDao;

    @Override
    public int getTotalLectureCount(String searchcolumn, String searchword) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("searchcolumn", searchcolumn);
        map.put("searchword", searchword);

        return lectureDao.getTotalLectureCount(map);
    }

    @Override
    public List<LectureDto> getLectureList(String searchcolumn, String searchword, int startnum, int perpage) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchcolumn", searchcolumn);
        map.put("searchword", searchword);
        map.put("startnum", startnum);
        map.put("perpage", perpage);

        return lectureDao.getLectureList(map);
    }

    @Override
    public void insertLecture(LectureDto dto) {
        lectureDao.insertLecture(dto);
    }

    @Override
    public List<LectureDetailJoinDto> getLecturePresent(int lecnum) {
        return lectureDao.getLecturePresent(lecnum);
    }

    @Override
    public LectureDetailJoinDto getLectureDetailData(int lecdenum) {
        return lectureDao.getLectureDetailData(lecdenum);
    }

    @Override
    public LectureDto getLectureDetail(int lecnum) {
        return lectureDao.getLectureDetail(lecnum);
    }

    @Override
    public void deleteLecture(int lecnum) {
        lectureDao.deleteLecture(lecnum);
    }

    @Override
    public void updateLecture(LectureDto dto) {
        lectureDao.updateLecture(dto);
    }

    @Override
    public List<LectureDto> getAllLecture(){
    	
    	return lectureDao.getAllLecture();
    }

    //lectype A 의 종류 구하기
    @Override
    public List<LectureDto> getLecTypeA() {
        return lectureDao.getLecTypeA();
    }
}
