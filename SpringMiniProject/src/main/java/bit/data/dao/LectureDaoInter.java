package bit.data.dao;

import java.util.List;

import bit.data.dto.LectureDto;
import bit.data.dto.LectureDetailJoinDto;

import java.util.Map;

public interface LectureDaoInter {
    public int getTotalLectureCount(Map<String, String> map);
    public List<LectureDto> getLectureList(Map<String, Object> map);
    public void insertLecture(LectureDto dto);
    public List<LectureDetailJoinDto> getLecturePresent(int lecnum);
    public LectureDetailJoinDto getLectureDetailData(int lecdenum);
    public LectureDto getLectureDetail(int lecnum);
    public void deleteLecture(int lecnum);
    public void updateLecture(LectureDto dto);
    public List<LectureDto> getAllLecture();
    public List<LectureDto> getLecTypeA();
}
