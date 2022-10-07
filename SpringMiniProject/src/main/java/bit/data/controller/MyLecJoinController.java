package bit.data.controller;

import bit.data.dto.MyLecJoinDto;
import bit.data.service.MyLecJoinServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MyLecJoinController {

    @Autowired
    MyLecJoinServiceInter myLecJoinService;

    //수강목록 출력(payok=="ok")
    @GetMapping("/student/stuLectureList")
    public String stuLectureList(Model model, HttpServletRequest request){

        HttpSession session =request.getSession();
        int usernum= Integer.parseInt(session.getAttribute("usernum").toString());
        List<MyLecJoinDto> list=myLecJoinService.getMyLecListByNum(usernum,"ok");

        model.addAttribute("list",list);

        return "/mypage/student/stuLectureList";

    }
    
    //시간표 출력(payok=="ok")
    @GetMapping("/student/timeTable")
    public String stuTimeTable(Model model, HttpServletRequest request){

        HttpSession session =request.getSession();
        int usernum= Integer.parseInt(session.getAttribute("usernum").toString());
        List<MyLecJoinDto> list=myLecJoinService.getMyLecListByNum(usernum,"ok");

        model.addAttribute("list",list);

        return "/mypage/student/timeTable";

    }
}
