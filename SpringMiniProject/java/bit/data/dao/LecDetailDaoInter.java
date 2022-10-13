package bit.data.dao;

import bit.data.dto.LecDetailDto;

import java.util.Map;

public interface LecDetailDaoInter {

    public int getLecTotalCountMonth(Map<String, Integer> map);
    public LecDetailDto getDataByLecDeNum(int lecdenum);
    public void insertLectureDetail(LecDetailDto dto);
    public void deleteLectureDetail(int lecdenum);

}
