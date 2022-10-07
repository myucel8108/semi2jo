package bit.data.controller;

import bit.data.dao.MyLectureDao;
import bit.data.dto.MyLectureDto;
import bit.data.service.LecDetailServiceInter;
import bit.data.service.MyLectureServiceInter;
import bit.data.service.UserServiceInter;
import retrofit2.http.POST;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;

@Controller
public class MyLectureController {

    @Autowired
    MyLectureServiceInter myLectureService;    
    @Autowired
    LecDetailServiceInter lecDetailService;
    @Autowired
    UserServiceInter userService;
    
    @PostMapping("/student/myCart")
    @ResponseBody
    public void insertMyLecture(MyLectureDto dto) {
    	myLectureService.insertMyLecture(dto);
    }
    
    
    
    
    
}
