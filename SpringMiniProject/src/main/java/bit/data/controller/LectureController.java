package bit.data.controller;

import bit.data.service.LectureServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class LectureController {

    @Autowired
    LectureServiceInter lectureService;
}
