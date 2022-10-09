package bit.data.dao;

import java.util.List;

import bit.data.dto.LectureDto;
import bit.data.dto.LecturePresentJoinDto;

import java.util.List;
import java.util.Map;

public interface LectureDaoInter {
    public int getTotalLectureCount(Map<String, String> map);
    public List<LectureDto> getLectureList(Map<String, Object> map);
    public void insertLecture(LectureDto dto);
    public List<LecturePresentJoinDto> getLecturePresent(int lecnum);
    public List<LectureDto> getAllLecture();
}
