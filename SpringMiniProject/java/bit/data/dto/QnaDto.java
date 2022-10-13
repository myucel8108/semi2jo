package bit.data.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class QnaDto {

	private int qnanum;
	private int usernum;
	private String username;
	private String qnatype;
	private String subject;
	private String content;
	private String photo;
	private String pass;
	private Timestamp writeday;
	private int regroup;
	private int restep;
	private int relevel;
	private boolean secret;
	private String gongzitype;


}
