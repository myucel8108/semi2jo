package bit.data.service;

import java.util.List;

import bit.data.dto.LectureDto;

import java.util.List;
import java.util.Map;

public interface LectureServiceInter {
    public int getTotalLectureCount(String searchcolumn, String searchword);
    public List<LectureDto> getLectureList(String searchcolumn, String searchword, int startnum, int perpage);
    public void insertLecture(LectureDto dto);
    public List<LectureDto> getAllLecture();

    //lectype A 의 종류 구하기
    public List<LectureDto> getLecTypeA();
    
}
