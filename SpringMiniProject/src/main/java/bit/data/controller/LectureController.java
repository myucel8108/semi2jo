package bit.data.controller;

import bit.data.dto.LectureDto;
import bit.data.service.LectureServiceInter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LectureController {

    @Autowired
    LectureServiceInter lectureService;

    
}
