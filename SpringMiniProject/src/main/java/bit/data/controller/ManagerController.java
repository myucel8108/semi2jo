package bit.data.controller;

import bit.data.dto.LectureDto;
import bit.data.service.LectureServiceInter;
import bit.data.service.ManagerServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    LectureServiceInter lectureService;

    @GetMapping("/lecturelist")
    public String getLecturelist(LectureDto dto) {
    	return "/manager/manager/addLectureForm";
    }

    @PostMapping("/insertLecture")
    public String insertLecture(LectureDto dto) {
        lectureService.insertLecture(dto);
        return "redirect:/manager/manager/lecturelist";
    }
}
