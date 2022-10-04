package bit.data.dao;

import bit.data.dto.LectureDto;

import java.util.List;
import java.util.Map;

public interface LectureDaoInter {
    public int getTotalLectureCount(Map<String, String> map);
    public List<LectureDto> getLectureList(Map<String, Object> map);
    public void insertLecture(LectureDto dto);
}
