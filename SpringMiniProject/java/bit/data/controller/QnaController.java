package bit.data.controller;

import bit.data.dto.QnaDto;
import bit.data.service.QnaServiceInter;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import util.ChangeName;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
public class QnaController {

    @Autowired
    QnaServiceInter qnaService;
    @Autowired
    UserServiceInter userService;




    @GetMapping("/qna/qnaForm") //게시판 작성폼
    public String qnaForm(
            @RequestParam(defaultValue="0") int qnanum,
            @RequestParam(defaultValue="0") int regroup,
            @RequestParam(defaultValue="0") int restep,
            @RequestParam(defaultValue="0") int relevel,
            @RequestParam(defaultValue="1") int currentPage,
            @RequestParam(defaultValue="0") String pass,
            Model model
    )
    {
        //답글일 경우만 넘어오는 값들. 새글일 경우 모두 null이므로 defaultValue값으로 전달
        model.addAttribute("qnanum",qnanum);
        model.addAttribute("regroup",regroup);
        model.addAttribute("restep",restep);
        model.addAttribute("relevel",relevel);
        model.addAttribute("currentPage",currentPage);
        model.addAttribute("pass",pass);
//        System.out.println(pass);
        //제목에 새글일경우 "", 답글일 경우 해당 제목을 넣어보자
        String content="";
        if(qnanum>0) {
            content=qnaService.selectByNum(qnanum).getContent();
        }
        model.addAttribute("content",content);

        return "/main/qna/qnaForm";
    }




    @GetMapping("/qna/qnaDetail") //게시판 디테일
    @ResponseBody
    public ModelAndView qnaDetail(int qnanum, int currentPage, HttpServletRequest request){


        ModelAndView mview = new ModelAndView();
        HttpSession session = request.getSession();

        int usernum = (int) session.getAttribute("usernum");
        System.out.println(usernum);

        QnaDto dto = qnaService.selectByNum(qnanum);

        mview.addObject("dto", dto);
        mview.addObject("currentPage", currentPage);
//        mview.addObject("dto", qnatype);
        System.out.println(dto.getQnatype());

        if (usernum==12 || usernum==dto.getUsernum() || dto.getQnatype().equals("공지사항") ){

            // 클릭한 글에 regroupnumber를 가져오고 로그인한 상태에서 해당 유저가 쓴 글의 리스트를 가져와야함 ( 내가쓴글들의 qnanum을 가져와야함 )
            // qnanum이 여러개인데 그중 내가 클릭한 글의 regroup num이랑 일치하는게 있으면
            mview.setViewName("/main/qna/qnaDetail");

        }else {
            mview.setViewName("/main/qna/secretQna");

        }
        return mview;
    }

    @GetMapping("/qna/secretQna") //암호체크
    public ModelAndView secretQna(int qnanum, int currentPage, String pass){

        ModelAndView mview = new ModelAndView();


        QnaDto dto = qnaService.selectByNum(qnanum);

        mview.addObject("dto", dto);
        mview.addObject("currentPage", currentPage);
        mview.addObject("pass", pass);

        mview.setViewName("/main/qna/qnaDetail");

        return mview;
    }

    @PostMapping("/qna/insert") //게시판 추가
    public String insert(QnaDto dto, List<MultipartFile>upload, HttpServletRequest request)
    {
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");

//        loginid 에 해당하는 username 얻기
        String username=userService.getDataByNum(dto.getUsernum()).getUsername();
//        int usernum=userService.getDataById(dto.getUsername()).getUsernum();
//        dto.setUsernum(usernum);
        dto.setUsername(username);
        System.out.println(dto.getPass());
        if (upload.get(0).getOriginalFilename().equals("")) {
            dto.setPhoto("no");
        } else {
            String photo = "";
            for(MultipartFile multi:upload)
            {
                //String newName = ChangeName.getChangeFileName(multi.getOriginalFilename());
                photo+=multi.getOriginalFilename()+",";

                try {
                    Path paths= Paths.get(path+"/"+multi.getOriginalFilename());
                    multi.transferTo(paths);
//                     multi.transferTo(new File(path+"/"+newName));
                } catch (Exception e) {
//                     throw new RuntimeException(e);
                }
            }
            photo = photo.substring(0, photo.length()-1);
            dto.setPhoto(photo);
        }
        qnaService.insertQna(dto);
        return "/main/qna/successQna";
    }

    @GetMapping("/qna/qnaList") //게시판 리스트 출력
    public String qna(
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(defaultValue = "0") int usernum,
            Model model
    )
    {
//        //sw는 유저 아이디임으로 usernum을 얻어야한다
//        String usernum=null;
//        if(sw!=null){
//             usernum=String.valueOf(userService.getDataById(sw).getUsernum());
////            System.out.println("111="+sw+","+usernum);
//        }

        int totalCount=qnaService.getTotalCount(usernum);
        int perPage=10;
        int perBlock=5;
        int startNum;
        int startPage;
        int endPage;
        int totalPage;
        int no;
        totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

        startPage=(currentPage-1)/perBlock*perBlock+1;
        endPage=startPage+perBlock-1;

        if(endPage>totalPage)
            endPage=totalPage;

        startNum=(currentPage-1)*perPage;

        no=totalCount-(currentPage-1)*perPage;




        List<QnaDto> list = qnaService.getPagingList(usernum, startNum, perPage);
        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("usernum", usernum);

        return "/main/qna/qnaList";
    }

    @GetMapping("/qna/delete")
    public String delete(int qnanum, int currentPage)
    {
        QnaDto dto=qnaService.selectByNum(qnanum);
        int restep=dto.getRestep();
        int regroup=dto.getRegroup();
        if(restep==0){
            qnaService.deleteQnaRegroup(regroup);
        }else{
            qnaService.deleteQna(qnanum);
        }

//                restep이 0이면 원글 regroup을 파라미터로 보내서  regroup을 지우자
//                num에 해당하는  dto 얻고
        return  "redirect:qnaList?currentPage="+currentPage;
    }






    @PostMapping("/qna/update")
    public String update(QnaDto dto, int currentPage, List<MultipartFile>upload,
                         HttpServletRequest request)
    {
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");

        if (upload.get(0).getOriginalFilename().equals("")) {
            dto.setPhoto(null);
        } else {
            String photo = "";
            int idx=0;
            for(MultipartFile multi:upload)
            {
                String newName = ChangeName.getChangeFileName(multi.getOriginalFilename());
                photo+=newName+",";

                try {
//                    Path paths= Paths.get(path+"/"+newName);
//                    multi.transferTo(paths);
                    multi.transferTo(new File(path+"/"+newName));
                } catch (Exception e) {
                    // throw new RuntimeException(e);
                }
            }
            photo = photo.substring(0, photo.length()-1);
            dto.setPhoto(photo);
        }



        qnaService.updateQna(dto);



        return "redirect:qnaDetail?currentPage="+currentPage+"&qnanum="+dto.getQnanum();
    }
    @GetMapping("/qna/qnaUpdate")
    public String updateform(Model model, int qnanum, int currentPage, String content)
    {
        QnaDto dto = qnaService.selectByNum(qnanum);
        model.addAttribute("dto", dto);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("content", content);

        return "/main/qna/qnaUpdate";


    }

}
