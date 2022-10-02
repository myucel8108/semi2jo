package bit.data.controller;

import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import util.ChangeName;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@Controller
public class UserController {

    @Autowired
    UserServiceInter userService;




    @GetMapping("/student/updateStudent")
    public String updateStudent()
    {
        return "/mypage/student/updateStudent";
    }

    @GetMapping("/student/timeTable")
    public String time(){

        return "/mypage/student/timeTable";

    }

}
