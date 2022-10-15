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
        //
        if(session.getAttribute("usernum")!=null)
        {
       
            int usernum= Integer.parseInt(session.getAttribute("usernum").toString());
            //usernum 
            List<MyLecJoinDto> jlist=myLecJoinService.getMyLecListByNum(usernum,"ok");
            //mview
            mview.addObject("jlist", jlist);
        }

        mview.addObject("dto", dto);
        mview.addObject("list", list);
        mview.setViewName("/main/lecture/lectureDetail");

        return mview;

    }
    
    //mylecture
    @PostMapping("lecture/lecUpStarReview")
    public String lecUpStarReview(int star, String review, int usernum, int lecdenum) {

        myLectureService.updateStarReview(star,review,usernum,lecdenum);
        
        //lecdenum
        LecDetailDto dto = lecDetailService.getDataByLecDeNum(lecdenum);
        int lecnum=dto.getLecnum();

        try {
            //lecnum
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
    public String lectureCategori(@RequestParam String lectypeb, Model model) {

        List<ReadyPayDto> list =  readypayservice.selectByCategori(lectypeb);
        model.addAttribute("list",list);


        return "/main/lecture/lectureList";

    }
    


}
