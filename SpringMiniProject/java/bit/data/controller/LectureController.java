package bit.data.controller;

import bit.data.dto.*;
import bit.data.service.*;

import java.util.List;

import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LectureController {

    @Autowired
    LectureServiceInter lectureService;

    @Autowired
    MyLectureServiceInter myLectureService;
    @Autowired
    LecDetailServiceInter lecDetailService;
    @Autowired
    UserServiceInter userService;
    @Autowired
    ReadyPayService readypayservice;

    @Autowired
    MyLecJoinServiceInter myLecJoinService;

    private HttpSession session;
    MyLectureDto dto = new MyLectureDto();


    @GetMapping("/lecture/lectureDetail")
    public ModelAndView detail(int lecdenum, HttpServletRequest request) {

        ModelAndView mview = new ModelAndView();
        List<MyLectureDto> list = myLectureService.getReview(lecdenum);
        ReadyPayDto dto =  readypayservice.selectByLecdeNum(lecdenum);

        HttpSession session =request.getSession();
        //내가 수강한 강의상세페이지에만 수강평 작성할 수 있도록 myLecJoin 정보 보내주기(로그인한 경우만)
        if(session.getAttribute("usernum")!=null)
        {
            //로그인한 수강생 usernum 가져오기
            int usernum= Integer.parseInt(session.getAttribute("usernum").toString());
            //usernum 기준으로 수강목록 data 가져오기
            List<MyLecJoinDto> jlist=myLecJoinService.getMyLecListByNum(usernum,"ok");
            //mview에 jlist 넣어주기
            mview.addObject("jlist", jlist);
        }

        mview.addObject("dto", dto);
        mview.addObject("list", list);
        mview.setViewName("/main/lecture/lectureDetail");

        return mview;

    }
    
    //mylecture의 별점과 수강평 작성하고 등록하기 누르면 lecture테이블의 avgstar 업데이트 되게 하기
    @PostMapping("lecture/lecUpStarReview")
    public String lecUpStarReview(int star, String review, int usernum, int lecdenum) {

        myLectureService.updateStarReview(star,review,usernum,lecdenum);
        
        //lecdenum에 해당하는 lecnum가져오기
        LecDetailDto dto = lecDetailService.getDataByLecDeNum(lecdenum);
        int lecnum=dto.getLecnum();

        try {
            //lecnum으로 lecture 테이블의 avgstar 값 바꾸기
            double avgstar=myLectureService.getAvgstarByLecnum(lecnum).getAvgstar();
            myLectureService.updateAvgstarByLecnum(avgstar,lecnum);
        }catch (NullPointerException e){}

        return "redirect:lectureDetail?lecdenum="+lecdenum;
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


}
