package bit.data.controller;

import bit.data.service.MyLectureServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class MyLectureController {

    @Autowired
    MyLectureServiceInter myLectureService;
}
