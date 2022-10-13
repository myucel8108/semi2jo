package bit.data.controller;

import bit.data.dto.BoardDto;

import bit.data.dto.ReboardDto;
import bit.data.dto.UserDto;
import bit.data.service.BoardServiceInter;
import bit.data.service.LikeBoardServiceInter;
import bit.data.service.ReboardServiceInter;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import util.ChangeName;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;


@Controller
public class UserController {

    @Autowired
    UserServiceInter userService;

    //�쉶�썝�젙蹂� �닔�젙 �쟾 鍮꾨�踰덊샇 �솗�씤�뤌
    @GetMapping("student/upStuPassCheck")
    public String upStuPassCheck(Model model,HttpSession session){

        int usernum= Integer.parseInt(session.getAttribute("usernum").toString());
        UserDto dto=userService.getDataByNum(usernum);
        model.addAttribute("dto",dto);

        return "/mypage/student/upStuPassCheck";
    }

    @GetMapping("student/studentBoard")
    public String studentBoard(){

        return "/mypage/student/studentBoard";
    }

    //�닔�젙�뤌�뿉 異쒕젰�븷 �뜲�씠�꽣 諛섑솚
    @PostMapping("student/updateStudent")
    public String updateStudent(Model model,HttpSession session){

        int usernum= Integer.parseInt(session.getAttribute("usernum").toString());
        UserDto dto=userService.getDataByNum(usernum);
        model.addAttribute("dto",dto);

        return "/mypage/student/updateStudent";
    }

    //ajax濡� 媛� �꽆湲몃븣�뒗 �씠嫄몃줈 媛��뒫
    /*@ResponseBody
    public UserDto getDataByNum(int usernum)
    {
        return userService.getDataByNum(usernum);
    }*/

    //�닔�젙
    @PostMapping("/student/update")
    public String update(UserDto dto, HttpSession session, HttpServletRequest request,
                       MultipartFile myphoto)
    {
        //�넱罹ｌ뿉 �삱�씪媛� upload �뤃�뜑 寃쎈줈 援ы븯湲�
        String path=request.getSession().getServletContext().getRealPath("/resources/upload");
        System.out.println(path);
        //�뾽濡쒕뱶 諛� ���옣�맆 �뙆�씪紐� 援ы븯湲�
        String photoName=myphoto.getOriginalFilename();
        if(!photoName.equals("")) {
            String fileName= ChangeName.getChangeFileName(photoName);
            //�뾽濡쒕뱶
            try {
                myphoto.transferTo(new File(path+"/"+fileName));
                //dto�뿉 諛붾�� userphoto �꽔湲�
                dto.setUserphoto(fileName);
            } catch (IllegalStateException | IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        //DB�쓽 dto update
        userService.updateUser(dto);
        //�꽭�뀡�뿉 ���옣�맂 �씠由꾨룄 蹂�寃쏀븯湲�
        session.setAttribute("loginname", dto.getUsername());
        return "redirect:timeTable";
    }

    //�깉�눜, user�뀒�씠釉붿뿉�꽌 �궘�젣 諛� board愿��젴 �뀒�씠釉붿뿉 nickname �깉�눜�쉶�썝�쑝濡�
    @GetMapping("/student/delete")
    @ResponseBody
    public void delete(int usernum,HttpSession session)
    {
        //board�뀒�씠釉� nickname �깉�눜�쉶�썝�쑝濡�
        userService.updateBoardNickname("(�깉�눜�쉶�썝)",usernum);
        //reboard�뀒�씠釉� nickname �깉�눜�쉶�썝�쑝濡�
        userService.updateReBoardNickname("(�깉�눜�쉶�썝)",usernum);

        //user�뀒�씠釉붿뿉�꽌 �궘�젣
        userService.deleteUser(usernum);
        //�꽭�뀡�뿉�꽌 �궘�젣
        session.removeAttribute("loginok");
        session.removeAttribute("email");
        session.removeAttribute("usernum");
        session.removeAttribute("loginname");
        session.removeAttribute("usertype");
    }

    /////////////////////////////////////////////////////////////////////
    //�궗吏꾨쭔 蹂�寃쎈찓�꽌�뱶(�벝 �씪 �엳�쓣吏� 紐곕씪�꽌 �궓寃⑤몺)
    @PostMapping("student/updatephoto")
    @ResponseBody
    public void updatePhoto(HttpServletRequest request,HttpSession session,
                            int usernum,MultipartFile userphoto)
    {
        //�넱罹ｌ뿉 �삱�씪媛� upload �뤃�뜑 寃쎈줈 援ы븯湲�
        String path=request.getSession().getServletContext().getRealPath("/resources/upload");
        System.out.println(path);
        //�뾽濡쒕뱶 諛� ���옣�맆 �뙆�씪紐� 援ы븯湲�
        String fileName= ChangeName.getChangeFileName(userphoto.getOriginalFilename());

        //�뾽濡쒕뱶
        try {
            userphoto.transferTo(new File(path+"/"+fileName));
            userService.updateUserPhoto(usernum, fileName); //db�뿉�꽌 �궗吏꾩닔�젙
            session.setAttribute("userphoto", fileName); //�꽭�뀡�쓽 �궗吏꾨�寃�
        } catch (IllegalStateException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}