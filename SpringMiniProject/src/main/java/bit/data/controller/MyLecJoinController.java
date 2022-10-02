package bit.data.controller;

import bit.data.dto.MyLecJoinDto;
import bit.data.service.MyLecJoinServiceInter;
import bit.data.service.MyLectureServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MyLecJoinController {

    @Autowired
    MyLecJoinServiceInter myLecJoinService;

    @GetMapping("/student/stuLectureList")
    public String stuLectureList(Model model){

        List<MyLecJoinDto> list=myLecJoinService.getMyLecListByNum(1);

        model.addAttribute("list",list);

        return "/mypage/student/stuLectureList";

    }
}
