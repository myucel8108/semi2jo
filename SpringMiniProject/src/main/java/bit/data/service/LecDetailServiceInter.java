package bit.data.service;

import bit.data.dto.LecDetailDto;

import java.util.Map;

public interface LecDetailServiceInter {

    public int getLecTotalCountMonth(int lecyear, int lecmonth);
    public void insertLectureDetail(LecDetailDto dto);
    public void deleteLectureDetail(int lecdenum);
}
