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


    @GetMapping("/loginF")
    public String loginF(){
        return "account/accountForm";
    }

    @GetMapping("/loginA")
    @ResponseBody
    public Map<String, String> loginprocess(String id, String pass, HttpSession session){
        Map<String, String> map=new HashMap<String, String>();
//        int result=userService.getIdPassCheck(id, pass);
//        if(result==1){//아이디와 패스가 모두 맞는 경우
//            //유지 시간 설정
//            session.setMaxInactiveInterval(60*60*4);//4시간
//            //로그인한 아이디에 대한 정보를 얻어서 session에 저장
//            UserDto mdto=userService.getDataById(id);
//            session.setAttribute("loginok", "yes");
//            session.setAttribute("loginid", id);
////            session.setAttribute("loginname", mdto.getName());
//            session.setAttribute("loginphoto", mdto.getPhoto());
//        }
//        map.put("result",result==1?"success":"fail");

        return map;
    }


    @GetMapping("/addAccount")
    public String addAccount(){
        return "account/accountAddForm";
    }

    @PostMapping("/createAccount")
    public String createAccount(){
        return "account/accountForm";
    }

    //회원가입 insert
    @PostMapping("/insert")
    public String insert(HttpServletRequest request, UserDto dto, MultipartFile photo) {
        //톰켓에 올라간 upload 폴더 경로 구하기
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
        System.out.println(path);
        //저장할 파일명 구하기
        String fileName = ChangeName.getChangeFileName(photo.getOriginalFilename());
        //dto의 photo의 경로
        dto.setPhoto(fileName);

        //upload
        try {
            photo.transferTo(new File(path+"/"+fileName));
            userService.insertUser(dto);

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return "account/accountAddForm";
        //return "redirect:list";//	/member/list 매핑주소 호출-컨트롤러메서드 호출
    }

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
