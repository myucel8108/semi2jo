package bit.data.controller;

import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
public class LoginController {

    @Autowired
    UserServiceInter userService;

    //로그인 페이지로 이동
    @GetMapping("/loginF")
    public String loginF(){
        return "/mypage/account/accountForm";
    }


    //회원가입 페이지로 이동
    @GetMapping("/insertAccountF")
    public String addAccount(){
        return "/mypage/account/accountAddForm";
    }

    //로그인 (id, pass 입력 후 버튼)
    @GetMapping("/loginA")
    @ResponseBody
    public Map<String, Object> loginprocess(String loginid, String loginpass, HttpSession session){
        Map<String, Object> map=new HashMap<String, Object>();
        int result=userService.checkLoginIdPass(loginid, loginpass);
        if(result==1){//아이디와 패스가 모두 맞는 경우
            //유지 시간 설정
            session.setMaxInactiveInterval(60*60*4);//4시간
            //로그인한 아이디에 대한 정보를 얻어서 session에 저장
            UserDto udto=userService.getDataById(loginid);
            session.setAttribute("loginok", "yes");
            session.setAttribute("loginid", loginid);
            session.setAttribute("loginname", udto.getUsername());
        }
        String temp = (result==1?"success":"fail");
        map.put("result",temp);
        System.out.println("test"+temp);
        return map;
    }

    // 로그아웃
    @GetMapping("/logout")
    @ResponseBody
    public void logout(HttpSession session) {
        System.out.println("logoutcontroller");
        session.removeAttribute("loginok");
        session.removeAttribute("loginid");
    }



    //회원가입 insert
    @PostMapping("/insert")
    public void insert(HttpServletRequest request, UserDto dto, MultipartFile photo) {
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
        //return "redirect:/loginF";

        //return "redirect:list";//	/member/list 매핑주소 호출-컨트롤러메서드 호출
    }
}
