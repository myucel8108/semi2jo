package bit.data.dao;

import java.util.List;

import bit.data.dto.LectureDto;

public interface LectureDaoInter {
    public void insertLecture(LectureDto dto);
    public List<LectureDto> getAllLecture();
}
