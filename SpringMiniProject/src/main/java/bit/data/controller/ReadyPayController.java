package bit.data.controller;


import java.io.IOException;

import java.util.List;
import java.util.Map;

import javax.servlet.jsp.tagext.TryCatchFinally;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
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

import com.google.gson.JsonObject;
import com.mysql.cj.log.Log;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import bit.data.dto.BoardDto;
import bit.data.dto.LectureDto;
import bit.data.dto.ReadyPayDto;

import bit.data.service.ReadyPayService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
public class ReadyPayController {
	
	/*
	 * @Autowired ReadyPayService readypayservice;
	 * 
	 * @GetMapping("/lecture/lectureDetail") public ModelAndView detail(int
	 * lecdenum) { ModelAndView mview = new ModelAndView();
	 * 
	 * //num에 해당하는 dto 얻기 ReadyPayDto dto =
	 * readypayservice.selectByLecdeNum(lecdenum);
	 * 
	 * mview.addObject("dto", dto);
	 * 
	 * mview.setViewName("/main/lecture/lectureDetail");
	 * 
	 * return mview; }
	 * 
	 * @GetMapping("/lecture/lectureList") public String lecturelist(Model model) {
	 * List<ReadyPayDto> list= readypayservice.MainGetAllLecture();
	 * model.addAttribute("list",list);
	 * 
	 * return "/main/lecture/lectureList"; }
	 * 
	 * @RequestMapping("/payment/call_back_receive") public ResponseEntity<?>
	 * callback_receive(@RequestBody Map<String, Object> model){
	 * 
	 * String process_result="결제 성공"; HttpHeaders responHeaders = new HttpHeaders();
	 * responHeaders.add("Content-Type","application/json; charset=UTF-8");
	 * JsonObject responseOBJ = new JsonObject(); try { String imp_uid =
	 * (String)model.get("imp_uid"); String merchant_uid
	 * =(String)model.get("merchant_uid"); boolean success =
	 * (boolean)model.get("success"); String error_msg =
	 * (String)model.get("error_msg"); System.out.println("--callback--receive--");
	 * System.out.println("----------------------");
	 * System.out.println("imp_uid: "+imp_uid); System.out.println("merchant_uid"+
	 * merchant_uid); System.out.println("success:"+success); if(success == true) {
	 * //db select (select amount from oder_table where merchant_uid=?)
	 * 
	 * String api_key ="4743784663216508"; String api_secret=
	 * "jvIqx7xwB2bVbp7T4XGai7r32NnRx6vRvLcUhfQTngSnnYMdqVEjG7a98sIiiatXtapTUMtA5bqz8dhQ";
	 * 
	 * IamportClient ic = new IamportClient(api_key, api_secret);
	 * IamportResponse<Payment> response =ic.paymentByImpUid(imp_uid);
	 * 
	 * } else { System.out.println("error_msg: "+error_msg);
	 * responseOBJ.put("process_result", "결제성공"); } } catch (Exception e) { // TODO:
	 * handle exception }
	 * 
	 * 
	 * 
	 * }
	 */
}
