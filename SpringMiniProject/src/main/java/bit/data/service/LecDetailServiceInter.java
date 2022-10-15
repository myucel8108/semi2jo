package bit.data.service;

import bit.data.dto.LecDetailDto;
import bit.data.dto.LectureDto;

import java.util.List;
import java.util.Map;

public interface LecDetailServiceInter {

    public int getLecTotalCountMonth(int lecyear, int lecmonth);
    public LecDetailDto getDataByLecDeNum(int lecdenum);
    public void insertLectureDetail(LecDetailDto dto);
    public void updateLectureDetail(LecDetailDto dto);
    public void deleteLectureDetail(int lecdenum);
    public List<LectureDto> selectHotLectures();


}
