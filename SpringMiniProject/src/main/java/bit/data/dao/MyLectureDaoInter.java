package bit.data.dao;

import java.util.List;
import java.util.Map;

import bit.data.dto.MyLecJoinDto;
import bit.data.dto.MyLectureDto;

public interface MyLectureDaoInter {
	
	   public void insertMyLecture(MyLectureDto mylecDto);
	   public void updatePayok(MyLectureDto mylecDto);
}
