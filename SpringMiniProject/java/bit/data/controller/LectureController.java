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
        //�궡媛� �닔媛뺥븳 媛뺤쓽�긽�꽭�럹�씠吏��뿉留� �닔媛뺥룊 �옉�꽦�븷 �닔 �엳�룄濡� myLecJoin �젙蹂� 蹂대궡二쇨린(濡쒓렇�씤�븳 寃쎌슦留�)
        if(session.getAttribute("usernum")!=null)
        {
            //濡쒓렇�씤�븳 �닔媛뺤깮 usernum 媛��졇�삤湲�
            int usernum= Integer.parseInt(session.getAttribute("usernum").toString());
            //usernum 湲곗��쑝濡� �닔媛뺣ぉ濡� data 媛��졇�삤湲�
            List<MyLecJoinDto> jlist=myLecJoinService.getMyLecListByNum(usernum,"ok");
            //mview�뿉 jlist �꽔�뼱二쇨린
            mview.addObject("jlist", jlist);
        }

        mview.addObject("dto", dto);
        mview.addObject("list", list);
        mview.setViewName("/main/lecture/lectureDetail");

        return mview;

    }
    
    //mylecture�쓽 蹂꾩젏怨� �닔媛뺥룊 �옉�꽦�븯怨� �벑濡앺븯湲� �늻瑜대㈃ lecture�뀒�씠釉붿쓽 avgstar �뾽�뜲�씠�듃 �릺寃� �븯湲�
    @PostMapping("lecture/lecUpStarReview")
    public String lecUpStarReview(int star, String review, int usernum, int lecdenum) {

        myLectureService.updateStarReview(star,review,usernum,lecdenum);
        
        //lecdenum�뿉 �빐�떦�븯�뒗 lecnum媛��졇�삤湲�
        LecDetailDto dto = lecDetailService.getDataByLecDeNum(lecdenum);
        int lecnum=dto.getLecnum();

        try {
            //lecnum�쑝濡� lecture �뀒�씠釉붿쓽 avgstar 媛� 諛붽씀湲�
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
    @GetMapping(value= "/lecture/lectureList" , params = {"lectypea"})
    public String lectureCategori2(@RequestParam String lectypea , Model model) {

        List<ReadyPayDto> list =  readypayservice.selectByCategori2(lectypea);
        model.addAttribute("list",list);


        return "/main/lecture/lectureList";

    }

}
