package bit.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaController {

	@GetMapping("/qna/qnaList")
	public String qnalist(){
		
		
		return "/main/qna/qnaList";
	}

}