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

    //嚥≪뮄�젃占쎌뵥 占쎈읂占쎌뵠筌욑옙嚥∽옙 占쎌뵠占쎈짗
    @GetMapping("/loginF")
    public String loginF(){
        return "/main/account/accountForm";
    }


    //占쎌돳占쎌뜚揶쏉옙占쎌뿯 占쎈읂占쎌뵠筌욑옙嚥∽옙 占쎌뵠占쎈짗
    @GetMapping("/insertAccountF")
    public String insertAccount(){

        return "/main/account/accountAddForm";
    }

    //嚥≪뮄�젃占쎌뵥 (id, pass 占쎌뿯占쎌젾 占쎌뜎 甕곌쑵�뱣)
    @GetMapping("/loginA")
    @ResponseBody
    public Map<String, Object> loginprocess(String loginid, String loginpass, HttpSession session){
        Map<String, Object> map=new HashMap<String, Object>();
        int result=userService.checkLoginIdPass(loginid, loginpass);
        if(result==1){//占쎈툡占쎌뵠占쎈탵占쏙옙 占쎈솭占쎈뮞揶쏉옙 筌뤴뫀紐� 筌띿쉶�뮉 野껋럩�뒭
            //占쎌�筌욑옙 占쎈뻻揶쏉옙 占쎄퐬占쎌젟
            session.setMaxInactiveInterval(60*60*4);//4占쎈뻻揶쏉옙
            //嚥≪뮄�젃占쎌뵥占쎈립 占쎈툡占쎌뵠占쎈탵占쎈퓠 占쏙옙占쎈립 占쎌젟癰귣�占쏙옙 占쎈섯占쎈선占쎄퐣 session占쎈퓠 占쏙옙占쎌삢
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

    // 嚥≪뮄�젃占쎈툡占쎌뜍
    @GetMapping("/logout")
    @ResponseBody
    public void logout(HttpSession session) {
        System.out.println("logoutcontroller");
        session.removeAttribute("loginok");
        session.removeAttribute("loginid");
    }



    //占쎌돳占쎌뜚揶쏉옙占쎌뿯 insert
    @PostMapping("/insertAccountA")
    public String insert(UserDto dto) {
//        //占쎈꽦�노낌肉� 占쎌궞占쎌뵬揶쏉옙 upload 占쎈쨨占쎈쐭 野껋럥以� �뤃�뗫릭疫뀐옙
//        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
//        System.out.println(path);
//        //占쏙옙占쎌삢占쎈막 占쎈솁占쎌뵬筌륅옙 �뤃�뗫릭疫뀐옙
//        String fileName = ChangeName.getChangeFileName(photo.getOriginalFilename());
//        //dto占쎌벥 photo占쎌벥 野껋럥以�
//        dto.setPhoto(fileName);

        //upload
//        try {
//            photo.transferTo(new File(path+"/"+fileName));
            userService.insertUser(dto);

//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
        return "redirect:loginF";

        //return "redirect:list";//	/member/list 筌띲끋釉ⓧ틠�눘�꺖 占쎌깈�빊占�-�뚢뫂�뱜嚥▲끇�쑎筌롫뗄苑뚳옙諭� 占쎌깈�빊占�
    }
}

