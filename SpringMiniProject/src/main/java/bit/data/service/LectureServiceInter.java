package bit.data.service;

import java.util.List;

import bit.data.dto.LectureDto;

public interface LectureServiceInter {
    public void insertLecture(LectureDto dto);
    public List<LectureDto> getAllLecture();
    
}
