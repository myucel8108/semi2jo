package bit.data.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import bit.data.dto.BoardDto;
import bit.data.dto.LectureDto;
import bit.data.dto.ReadyPayDto;

import bit.data.service.ReadyPayService;


@Controller
public class ReadyPayController {
	
	 @Autowired
	 ReadyPayService readypayservice;

	  
	 @GetMapping("/lecture/lectureDetail")
		public ModelAndView detail(int lecdenum) {
			ModelAndView mview = new ModelAndView();
	
			//num에 해당하는 dto 얻기
			ReadyPayDto dto = readypayservice.selectByLecdeNum(lecdenum);
			//글쓴 사람의 사진을 
		
			mview.addObject("dto", dto);
			
			mview.setViewName("/main/lecture/lectureDetail");
			
			return mview;
		}
	 
	    @GetMapping("/lecture/lectureList")
	    public String lecturelist(Model model)
	    {
	    		List<ReadyPayDto> list= readypayservice.MainGetAllLecture();
	    		model.addAttribute("list",list);
	    		
	        return "/main/lecture/lectureList";
	    }
	    

	
}
