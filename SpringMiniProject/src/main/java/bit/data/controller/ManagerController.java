package bit.data.controller;

import bit.data.dto.LectureDto;
import bit.data.service.ManagerServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    ManagerServiceInter managerService;
    
    @GetMapping("/lecturelist")
    public String lecturelist(LectureDto dto) {
    	return "/manager/manager/addLectureForm";
    }
    
    
}
