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

    //濡쒓렇�씤 �럹�씠吏�濡� �씠�룞
    @GetMapping("/loginF")
    public String loginF(){
        return "/main/account/accountForm";
    }


    //�쉶�썝媛��엯 �럹�씠吏�濡� �씠�룞
    @GetMapping("/insertAccountF")
    public String insertAccount(){

        return "/main/account/accountAddForm";
    }

    //濡쒓렇�씤 (id, pass �엯�젰 �썑 踰꾪듉)
    @GetMapping("/loginA")
    @ResponseBody
    public Map<String, Object> loginprocess(String loginid, String loginpass, HttpSession session){
        Map<String, Object> map=new HashMap<String, Object>();
        int result=userService.checkLoginIdPass(loginid, loginpass);
        if(result==1){//�븘�씠�뵒�� �뙣�뒪媛� 紐⑤몢 留욌뒗 寃쎌슦
            //�쑀吏� �떆媛� �꽕�젙
            session.setMaxInactiveInterval(60*60*4);//4�떆媛�
            //濡쒓렇�씤�븳 �븘�씠�뵒�뿉 ���븳 �젙蹂대�� �뼸�뼱�꽌 session�뿉 ���옣
            UserDto udto=userService.getDataById(loginid);
            session.setAttribute("loginok", "yes");
            session.setAttribute("loginid", loginid);
            session.setAttribute("loginname", udto.getUsername());
            session.setAttribute("usernum", udto.getUsernum());
        }
        String temp = (result==1?"success":"fail");
        map.put("result",temp);
        System.out.println("test"+temp);
        return map;
    }

    // 濡쒓렇�븘�썐
    @GetMapping("/logout")
    @ResponseBody
    public void logout(HttpSession session) {
        System.out.println("logoutcontroller");
        session.removeAttribute("loginok");
        session.removeAttribute("loginid");
        session.removeAttribute("usernum");
    }



    //�쉶�썝媛��엯 insert
    @PostMapping("/insertAccountA")
    public String insert(UserDto dto) {
//        //�넱耳볦뿉 �삱�씪媛� upload �뤃�뜑 寃쎈줈 援ы븯湲�
//        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
//        System.out.println(path);
//        //���옣�븷 �뙆�씪紐� 援ы븯湲�
//        String fileName = ChangeName.getChangeFileName(photo.getOriginalFilename());
//        //dto�쓽 photo�쓽 寃쎈줈
//        dto.setPhoto(fileName);

        //upload
//        try {
//            photo.transferTo(new File(path+"/"+fileName));
            userService.insertUser(dto);

//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
        return "redirect:loginF";

        //return "redirect:list";//	/member/list 留ㅽ븨二쇱냼 �샇異�-而⑦듃濡ㅻ윭硫붿꽌�뱶 �샇異�
    }
}

