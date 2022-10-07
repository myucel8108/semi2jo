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
import org.springframework.web.servlet.ModelAndView;
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

    //로그인 페이지로 이동
    @GetMapping("/loginF")
    public String loginF(){
        return "/main/account/accountForm";
    }


    //회원가입 페이지 이동
//    @GetMapping("/insertAccountF")
//    public String insertAccount(){
//
//        return "/main/account/accountAddForm";
//    }
    @GetMapping("/insertAccountF")
    public ModelAndView insertAccount(String email){
        ModelAndView mview = new ModelAndView();
        mview.addObject("email",email);
        mview.setViewName("/main/account/accountAddForm");
        return mview;
    }



    //로그인 하기
    @GetMapping("/loginA")
    @ResponseBody
    public Map<String, Object> loginprocess(String email, String userpass, HttpSession session){
        Map<String, Object> map=new HashMap<String, Object>();
        String result=loginService.checkLoginIdPass(email, userpass);
        if(result!=null){
            System.out.println(result);
            int usernum = Integer.parseInt(result);
            session.setMaxInactiveInterval(60*60*4);
            UserDto udto=loginService.getDataByNum(usernum);
            session.setAttribute("loginok", "yes");
            session.setAttribute("loginname", udto.getUsername());
            session.setAttribute("usernum", usernum);
            session.setAttribute("photo", udto.getUserphoto());
            session.setAttribute("email",email);
            session.setAttribute("usertype",udto.getUsertype());
        }
        String temp = (result!=null?"success":"fail");
        map.put("result",temp);
        return map;
    }

//    간편 로그인
    @GetMapping("/loginByApi")
    @ResponseBody
    public Map<String, Object> loginByApi(String email, HttpSession session){
        System.out.println(email);

        Map<String, Object> map=new HashMap<String, Object>();
        String result = loginService.checkLoginId(email);

        if(result!=null){
            System.out.println("controller if");
            int usernum = Integer.parseInt(result);
            session.setMaxInactiveInterval(60*60*4);
            UserDto udto=loginService.getDataByNum(usernum);
            session.setAttribute("loginok", "yes");
            session.setAttribute("email", email);
            session.setAttribute("loginname", udto.getUsername());
            session.setAttribute("usernum", usernum);
            session.setAttribute("usertype",udto.getUsertype());
        }
        String temp = (result!=null?"success":"fail");
        map.put("result",temp);
        return map;
    }

    // 로그아웃
    @GetMapping("/logout")
    @ResponseBody
    public void logout(HttpSession session) {
        session.removeAttribute("loginok");
        session.removeAttribute("email");
        session.removeAttribute("usernum");
    }



    //회원가입
    @PostMapping("/insertAccountA")
//    @ResponseBody
    public String insert(UserDto dto) {
        //톰켓에 올라간 upload 폴더 경로 구하기
//        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
//        System.out.println(path);
//        //저장할 파일명 구하기
//        String fileName = ChangeName.getChangeFileName(photo.getOriginalFilename());
//        //dto�쓽 photo�쓽 寃쎈줈
//        dto.setPhoto(fileName);


        loginService.insertUser(dto);
//
//        //upload
//        try {
//            photo.transferTo(new File(path+"/"+fileName));
//            session.setAttribute("loginphoto", fileName);	//세션의 사진 변경
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
        return "redirect:loginF";
    }

    //회원가입 시 아이디 중복체크
    @GetMapping("/checkId")
    @ResponseBody
    public Map<String, Integer> checkId(String userid){
        Map<String, Integer> map = new HashMap<String, Integer>();
        int result = loginService.checkId(userid);
        map.put("result",result);
        return map;
    }
}

