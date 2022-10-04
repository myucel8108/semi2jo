package bit.data.controller;

import bit.data.dto.UserDto;
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
    UserServiceInter userService;

    //�슖�돦裕꾬옙�쟽�뜝�럩逾� �뜝�럥�쓡�뜝�럩逾좂춯�쉻�삕�슖�댙�삕 �뜝�럩逾졾뜝�럥吏�
    @GetMapping("/loginF")
    public String loginF(){
        return "/main/account/accountForm";
    }


    //�뜝�럩�뤂�뜝�럩�쐸�뤆�룊�삕�뜝�럩肉� �뜝�럥�쓡�뜝�럩逾좂춯�쉻�삕�슖�댙�삕 �뜝�럩逾졾뜝�럥吏�
    @GetMapping("/insertAccountF")
    public String insertAccount(){

        return "/main/account/accountAddForm";
    }

    //�슖�돦裕꾬옙�쟽�뜝�럩逾� (id, pass �뜝�럩肉��뜝�럩�졑 �뜝�럩�쐩 �뵓怨뚯뫓占쎈괏)
    @GetMapping("/loginA")
    @ResponseBody
    public Map<String, Object> loginprocess(String loginid, String loginpass, HttpSession session){
        Map<String, Object> map=new HashMap<String, Object>();
        int result=userService.checkLoginIdPass(loginid, loginpass);
        if(result==1){//�뜝�럥�닡�뜝�럩逾졾뜝�럥�꺏�뜝�룞�삕 �뜝�럥�넮�뜝�럥裕욄뤆�룊�삕 嶺뚮ㅄ維�筌륅옙 嶺뚮씮�돳占쎈츎 �뇦猿뗫윪占쎈뮡
            //�뜝�럩占썹춯�쉻�삕 �뜝�럥六삥뤆�룊�삕 �뜝�럡�맟�뜝�럩�젧
            session.setMaxInactiveInterval(60*60*4);//4�뜝�럥六삥뤆�룊�삕
            //�슖�돦裕꾬옙�쟽�뜝�럩逾ε뜝�럥由� �뜝�럥�닡�뜝�럩逾졾뜝�럥�꺏�뜝�럥�뱺 �뜝�룞�삕�뜝�럥由� �뜝�럩�젧�솻洹ｏ옙�뜝�룞�삕 �뜝�럥�꽢�뜝�럥�꽑�뜝�럡�맋 session�뜝�럥�뱺 �뜝�룞�삕�뜝�럩�궋
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

    // �슖�돦裕꾬옙�쟽�뜝�럥�닡�뜝�럩�쐨
    @GetMapping("/logout")
    @ResponseBody
    public void logout(HttpSession session) {
        System.out.println("logoutcontroller");
        session.removeAttribute("loginok");
        session.removeAttribute("loginid");
    }



    //�뜝�럩�뤂�뜝�럩�쐸�뤆�룊�삕�뜝�럩肉� insert
    @PostMapping("/insertAccountA")
    public String insert(UserDto dto) {
//        //�뜝�럥苑�占쎈끂�굦�굢占� �뜝�럩沅욃뜝�럩逾ф뤆�룊�삕 upload �뜝�럥夷ⓨ뜝�럥�맠 �뇦猿뗫윥餓ο옙 占쎈쨨占쎈뿫由��뼨�먯삕
//        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
//        System.out.println(path);
//        //�뜝�룞�삕�뜝�럩�궋�뜝�럥留� �뜝�럥�냱�뜝�럩逾х춯瑜낆삕 占쎈쨨占쎈뿫由��뼨�먯삕
//        String fileName = ChangeName.getChangeFileName(photo.getOriginalFilename());
//        //dto�뜝�럩踰� photo�뜝�럩踰� �뇦猿뗫윥餓ο옙
//        dto.setPhoto(fileName);

        //upload
//        try {
//            photo.transferTo(new File(path+"/"+fileName));
            userService.insertUser(dto);

//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
        return "redirect:loginF";

        //return "redirect:list";//	/member/list 嶺뚮씞�걢�뇡�벁�떊占쎈닔占쎄틬 �뜝�럩源덌옙鍮듿뜝占�-占쎈슓維귨옙諭쒎슖�뼯�걞占쎌몠嶺뚮∥�뾼�땻�슪�삕獄�占� �뜝�럩源덌옙鍮듿뜝占�
    }
}

