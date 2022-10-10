package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MyLectureDto {
	
	 private int mylecnum;
	 private int usernum;
	 private int lecdenum;
	 private int star;
	 private String review;
	 private String payok;
	 private String username;
	 private Timestamp paytime;
}
