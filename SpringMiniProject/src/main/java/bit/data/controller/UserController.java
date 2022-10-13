package bit.data.controller;

import bit.data.dto.BoardDto;
import bit.data.dto.LikeBoardDto;
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
import org.springframework.web.servlet.ModelAndView;
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

    @Autowired
    BoardServiceInter boardService;

    //회원정보 수정 전 비밀번호 확인폼
    @GetMapping("student/upStuPassCheck")
    public String upStuPassCheck(Model model,HttpSession session){

        int usernum= Integer.parseInt(session.getAttribute("usernum").toString());
        UserDto dto=userService.getDataByNum(usernum);
        model.addAttribute("dto",dto);

        return "/mypage/student/upStuPassCheck";
    }


    //수정폼에 출력할 데이터 반환
    @PostMapping("student/updateStudent")
    public String updateStudent(Model model,HttpSession session){

        int usernum= Integer.parseInt(session.getAttribute("usernum").toString());
        UserDto dto=userService.getDataByNum(usernum);
        model.addAttribute("dto",dto);

        return "/mypage/student/updateStudent";
    }

    //ajax로 값 넘길때는 이걸로 가능
    /*@ResponseBody
    public UserDto getDataByNum(int usernum)
    {
        return userService.getDataByNum(usernum);
    }*/

    //수정
    @PostMapping("/student/update")
    public String update(UserDto dto, HttpSession session, HttpServletRequest request,
                       MultipartFile myphoto)
    {
        //톰캣에 올라간 upload 폴더 경로 구하기
        String path=request.getSession().getServletContext().getRealPath("/resources/upload");
        System.out.println(path);
        //업로드 및 저장될 파일명 구하기
        String photoName=myphoto.getOriginalFilename();
        if(!photoName.equals("")) {
            String fileName= ChangeName.getChangeFileName(photoName);
            //업로드
            try {
                myphoto.transferTo(new File(path+"/"+fileName));
                //dto에 바뀐 userphoto 넣기
                dto.setUserphoto(fileName);
            } catch (IllegalStateException | IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        //DB의 dto update
        userService.updateUser(dto);
        //세션에 저장된 이름도 변경하기
        session.setAttribute("loginname", dto.getUsername());
        return "redirect:timeTable";
    }

    //탈퇴, user테이블에서 삭제 및 board관련 테이블에 nickname 탈퇴회원으로
    @GetMapping("/student/delete")
    @ResponseBody
    public void delete(int usernum,HttpSession session)
    {
        //board테이블 nickname 탈퇴회원으로
        userService.updateBoardNickname("(탈퇴회원)",usernum);
        //reboard테이블 nickname 탈퇴회원으로
        userService.updateReBoardNickname("(탈퇴회원)",usernum);

        //user테이블에서 삭제
        userService.deleteUser(usernum);
        //세션에서 삭제
        session.removeAttribute("loginok");
        session.removeAttribute("email");
        session.removeAttribute("usernum");
        session.removeAttribute("loginname");
        session.removeAttribute("usertype");
    }

    /////////////////////////////////////////////////////////////////////
    //사진만 변경메서드(쓸 일 있을지 몰라서 남겨둠)
    @PostMapping("student/updatephoto")
    @ResponseBody
    public void updatePhoto(HttpServletRequest request,HttpSession session,
                            int usernum,MultipartFile userphoto)
    {
        //톰캣에 올라간 upload 폴더 경로 구하기
        String path=request.getSession().getServletContext().getRealPath("/resources/upload");
        System.out.println(path);
        //업로드 및 저장될 파일명 구하기
        String fileName= ChangeName.getChangeFileName(userphoto.getOriginalFilename());

        //업로드
        try {
            userphoto.transferTo(new File(path+"/"+fileName));
            userService.updateUserPhoto(usernum, fileName); //db에서 사진수정
            session.setAttribute("userphoto", fileName); //세션의 사진변경
        } catch (IllegalStateException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @GetMapping("student/studentBoard")
    public String studentBoard(){

        return "/mypage/student/studentBoard";
    }
    @GetMapping("student/mylist1")
    @ResponseBody
    public List<BoardDto> mylist1(int usernum){

        return userService.getMyBoardList(usernum);
    }
    @GetMapping("student/mylist2")
    @ResponseBody
    public List<ReboardDto> mylist2(int usernum){

        return userService.getMyReboardList(usernum);
    }
    @GetMapping("student/mylist3")
    @ResponseBody
    public List<LikeBoardDto> mylist3(int usernum){

        return userService.getMyLikeboardList(usernum);
    }
}
