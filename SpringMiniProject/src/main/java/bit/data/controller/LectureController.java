package bit.data.controller;

import bit.data.service.LectureServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LectureController {

    @Autowired
    LectureServiceInter lectureService;

    @GetMapping("/lecture/lectureList")
    public String sibal()
    {
        return "/main/lecture/lectureList";
    }



}
