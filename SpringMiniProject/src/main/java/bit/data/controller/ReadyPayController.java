package bit.data.controller;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.TryCatchFinally;

import org.apache.tiles.request.Request;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.Session;
import com.mysql.cj.log.Log;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import bit.data.dto.BoardDto;
import bit.data.dto.LectureDto;
import bit.data.dto.MyLectureDto;
import bit.data.dto.ReadyPayDto;
import bit.data.dto.UserDto;
import bit.data.service.LecDetailServiceInter;
import bit.data.service.MyLectureServiceInter;
import bit.data.service.ReadyPayService;
import bit.data.service.UserServiceInter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
public class ReadyPayController {

	  @Autowired
	  MyLectureServiceInter myLectureService;    
	  @Autowired
	  LecDetailServiceInter lecDetailService;
	  @Autowired
	  UserServiceInter userService;
	 @Autowired 
	 ReadyPayService readypayservice;
	 
	 private HttpSession session;
	 MyLectureDto dto = new MyLectureDto();
	 
	  
	 @GetMapping("/lecture/lectureDetail")
	 public ModelAndView detail(int lecdenum) {
		 
		ModelAndView mview = new ModelAndView();
		List<MyLectureDto> list = myLectureService.getReview(lecdenum);
	 	ReadyPayDto dto =  readypayservice.selectByLecdeNum(lecdenum);
	  	mview.addObject("dto", dto);
	  	mview.addObject("list", list);
	  	mview.setViewName("/main/lecture/lectureDetail");
	  
	  return mview; 
	  
	  }
	  
	  @GetMapping("/lecture/lectureList") 
	  public String lecturelist(Model model) {
	  List<ReadyPayDto> list= readypayservice.MainGetAllLecture();
	  model.addAttribute("list",list);
	  
	  return "/main/lecture/lectureList"; 
	  
	  }
	  
	@GetMapping(value= "/lecture/lectureList" , params = {"lectypeb"})
	public String lectureCategori(@RequestParam String lectypeb , Model model) {
			 
		List<ReadyPayDto> list =  readypayservice.selectByCategori(lectypeb);
		model.addAttribute("list",list);
		 
		  
		  return "/main/lecture/lectureList";
		  
		  }
	  

	// �뜝�럥�걥�뜝�럥堉� �뛾�룇猷꾤뵳占�
	  @RequestMapping(value = "/payment/callback_receive")
	  @ResponseBody
	  public ResponseEntity<?> callback_receive(@RequestBody Map<String, Object> model, HttpServletRequest request ){  
		  HttpSession session = request.getSession();
		  int usernum = (int) session.getAttribute("usernum");
		System.out.println(usernum);
		String process_result="�뇦猿됲�ｏ옙�젷�뜝�럡�뎽占썩뫅�삕";
		System.out.println(process_result);
		JSONObject responseobj = new JSONObject();
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type","application/json; charset=UTF-8");
	  
	  try { 
		  String imp_uid = (String)model.get("imp_uid"); 
		  String merchant_uid =(String)model.get("merchant_uid");
		  boolean success =  (boolean)model.get("success"); 
		  String error_msg =  (String)model.get("error_msg");
		  System.out.println("--callback--receive--");
		  System.out.println("----------------------");
		  System.out.println("imp_uid: "+imp_uid);
		  System.out.println("merchant_uid"+ merchant_uid); 
		  System.out.println("success:"+success);
		 
	  if(success == true) {
	  
	


		String api_key ="4743784663216508"; 
		String api_secret= "jvIqx7xwB2bVbp7T4XGai7r32NnRx6vRvLcUhfQTngSnnYMdqVEjG7a98sIiiatXtapTUMtA5bqz8dhQ";

	  
		IamportClient ic = new IamportClient(api_key, api_secret);
		IamportResponse<Payment> response =ic.paymentByImpUid(imp_uid);
		BigDecimal import_amount = response.getResponse().getAmount();
		//dbsave 
	  myLectureService.updatePayok(usernum);
	  
	  } 
	  else { 
		  
		  System.out.println("error_msg: "+error_msg);
	  	  responseobj.put("process_result", " "); 

	  } 
	  
	  
	  }
	  
	  catch (Exception e) {
		    
		  
	
	  }


	  return new ResponseEntity<String>(responseobj.toJSONString(), responseHeaders, HttpStatus.OK);
	  
	  }
	
}

