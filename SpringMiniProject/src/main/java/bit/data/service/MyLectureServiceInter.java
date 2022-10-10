package bit.data.service;

import java.util.List;

import bit.data.dto.MyLectureDto;

public interface MyLectureServiceInter {
	
	
	  public void insertMyLecture(MyLectureDto mylecdto);
	  public void updatePayok(int usernum);
	  public List<MyLectureDto> getReview(int usernum);
	  
}
