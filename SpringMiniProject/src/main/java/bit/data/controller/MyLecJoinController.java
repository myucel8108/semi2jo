package bit.data.controller;

import bit.data.dto.MyLecJoinDto;
import bit.data.service.MyLecJoinServiceInter;
import bit.data.service.MyLectureServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MyLecJoinController {

    @Autowired
    MyLecJoinServiceInter myLecJoinService;

    @GetMapping("/student/stuLectureList")
    public String stuLectureList(Model model, HttpServletRequest request){

        HttpSession session =request.getSession();
        int usernum= Integer.parseInt(session.getAttribute("usernum").toString());
        List<MyLecJoinDto> list=myLecJoinService.getMyLecListByNum(usernum);

        model.addAttribute("list",list);

        return "/mypage/student/stuLectureList";

    }

    @GetMapping("/student/timeTable")
    public String stuTimeTable(Model model, HttpServletRequest request){

        HttpSession session =request.getSession();
        int usernum= Integer.parseInt(session.getAttribute("usernum").toString());
        List<MyLecJoinDto> list=myLecJoinService.getMyLecListByNum(usernum);

        model.addAttribute("list",list);

        return "/mypage/student/timeTable";

    }
    
    
}
