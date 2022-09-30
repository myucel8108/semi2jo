package bit.data.controller;

import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
