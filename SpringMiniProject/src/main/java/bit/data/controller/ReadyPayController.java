package bit.data.controller;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import javax.servlet.jsp.tagext.TryCatchFinally;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.mysql.cj.log.Log;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import bit.data.dto.BoardDto;
import bit.data.dto.LectureDto;
import bit.data.dto.MyLectureDto;
import bit.data.dto.ReadyPayDto;
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
	 
	 MyLectureDto dto = new MyLectureDto();
	 
	  
	 @GetMapping("/lecture/lectureDetail")
	 public ModelAndView detail(int lecdenum) {
		 
		 ModelAndView mview = new ModelAndView();
	  
	 	ReadyPayDto dto =  readypayservice.selectByLecdeNum(lecdenum);
	 
	  	mview.addObject("dto", dto);
	 
	  	mview.setViewName("/main/lecture/lectureDetail");
	  
	  return mview; 
	  
	  }
	  
	  @GetMapping("/lecture/lectureList") public String lecturelist(Model model) {
	  List<ReadyPayDto> list= readypayservice.MainGetAllLecture();
	  model.addAttribute("list",list);
	  
	  return "/main/lecture/lectureList"; 
	  
	  }
	  
	  
	  @RequestMapping("/payment/callback_receive") 
	  
	  public ResponseEntity<?> callback_receive(@RequestBody Map<String, Object> model){  
		  
	  String process_result="결제성공";
	  
	  HttpHeaders responseHeaders = new HttpHeaders(); 
	  
	  responseHeaders.add("Content-Type","application/json; charset=UTF-8");
	  
	  JSONObject responseobj = new JSONObject();
	  
	  
	  try {
		  
	  String imp_uid = (String)model.get("imp_uid"); 
	  String merchant_uid =(String)model.get("merchant_uid");
	  boolean success =  (boolean)model.get("success"); 
	  String error_msg =  (String)model.get("error_msg");
	  int usernum = (int)model.get("usernum");
	  
	  System.out.println("--callback--receive--");
	  System.out.println("----------------------");
	  System.out.println("imp_uid: "+imp_uid);
	  System.out.println("merchant_uid"+ merchant_uid); 
	  System.out.println("success:"+success);
	  System.out.println("usernum:"+ usernum);
	  if(success == true) {
	  
	
		myLectureService.updatePayok(usernum);
		    	
		    

	  String api_key ="4743784663216508"; 
	  String api_secret= "jvIqx7xwB2bVbp7T4XGai7r32NnRx6vRvLcUhfQTngSnnYMdqVEjG7a98sIiiatXtapTUMtA5bqz8dhQ";

	  
	  IamportClient ic = new IamportClient(api_key, api_secret);
	  IamportResponse<Payment> response =ic.paymentByImpUid(imp_uid);
	  BigDecimal import_amount = response.getResponse().getAmount();
	  //dbsave 
	  
	  
	  } 
	  else { 
		  
		  System.out.println("error_msg: "+error_msg);
	  	  responseobj.put("process_result", "결제실패"); 
	  
	  
	  } 
	  
	  
	  }
	  
	  catch (Exception e) {
		    
		  
	
	  }


	  return new ResponseEntity<String>(responseobj.toJSONString(), responseHeaders, HttpStatus.OK);
	  
	  }
	
}
