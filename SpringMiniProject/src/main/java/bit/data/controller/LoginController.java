package bit.data.controller;

import bit.data.dao.LoginDaoInter;
import bit.data.dto.UserDto;
import bit.data.service.LoginServiceInter;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
    LoginServiceInter loginService;


    @GetMapping("/loginF")
    public String loginF(){
        return "/main/account/accountForm";
    }



    @GetMapping("/insertAccountF")
    public String insertAccount(){

        return "/main/account/accountAddForm";
    }

    @GetMapping("/loginA")
    @ResponseBody
    public Map<String, Object> loginprocess(String email, String userpass, HttpSession session){
        Map<String, Object> map=new HashMap<String, Object>();
        String result=loginService.checkLoginIdPass(email, userpass);
        if(result!=null){
            System.out.println(result);
            int usernum = Integer.parseInt(result);
            System.out.println(usernum);
            session.setMaxInactiveInterval(60*60*4);
            UserDto udto=loginService.getDataByNum(usernum);
            System.out.println("test3");
            session.setAttribute("loginok", "yes");
            session.setAttribute("loginname", udto.getUsername());
            session.setAttribute("usernum", usernum);
            session.setAttribute("photo", udto.getUserphoto());

            session.setAttribute("email",email);
            session.setAttribute("usertype",udto.getUsertype());
        }
        String temp = (result!=null?"success":"fail");
        map.put("result",temp);
        System.out.println("test"+temp);
        return map;
    }


    @GetMapping("/loginByApi")
    @ResponseBody
    public Map<String, Object> loginByApi(String userid, HttpSession session){
        System.out.println(userid);

        Map<String, Object> map=new HashMap<String, Object>();
        String result = loginService.checkLoginId(userid);
        int usernum = Integer.parseInt(result);
        if(result!=null){
            System.out.println("controller if");
            session.setMaxInactiveInterval(60*60*4);
            UserDto udto=loginService.getDataByNum(usernum);
            session.setAttribute("loginok", "yes");
            session.setAttribute("loginid", udto.getEmail());
            session.setAttribute("loginname", udto.getUsername());
            session.setAttribute("usernum", udto.getUsernum());
        }
        String temp = (result!=null?"success":"fail");
        map.put("result",temp);
        System.out.println("test"+temp);
        return map;
    }


    @GetMapping("/logout")
    @ResponseBody
    public void logout(HttpSession session) {
        System.out.println("logoutcontroller");
        session.removeAttribute("loginok");
        session.removeAttribute("loginid");
        session.removeAttribute("usernum");
    }




    @PostMapping("/insertAccountA")
    @ResponseBody
    public String insert(UserDto dto) {
        System.out.println("acountA");



        loginService.insertUser(dto);
//
//        //upload
//        try {
//            photo.transferTo(new File(path+"/"+fileName));
//            session.setAttribute("loginphoto", fileName);	//�꽭�뀡�쓽 �궗吏� 蹂�寃�
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
        return "redirect:loginF";
    }


    @GetMapping("/checkId")
    @ResponseBody
    public Map<String, Integer> checkId(String userid){
        Map<String, Integer> map = new HashMap<String, Integer>();
        int result = loginService.checkId(userid);
        map.put("result",result);
        return map;
    }
}

