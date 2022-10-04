package bit.data.service;

import bit.data.dto.LectureDto;

import java.util.List;
import java.util.Map;

public interface LectureServiceInter {
    public int getTotalLectureCount(String searchcolumn, String searchword);
    public List<LectureDto> getLectureList(String searchcolumn, String searchword, int startnum, int perpage);
    public void insertLecture(LectureDto dto);
}
