package bit.data.dao;

import java.util.List;
import java.util.Map;

import bit.data.dto.LecAvgStarDto;
import bit.data.dto.MyLecJoinDto;
import bit.data.dto.MyLectureDto;

public interface MyLectureDaoInter {
	
	   public void insertMyLecture(MyLectureDto mylecDto);
	   public void updatePayok(int usernum);
	   public List<MyLectureDto>  getReview(int lecdenum);
	   public void updateStarReview(Map<String, Object> map);
	   public LecAvgStarDto getAvgstarByLecnum(int lecnum);
	   public void updateAvgstarByLecnum(Map<String, Object> map);
}
