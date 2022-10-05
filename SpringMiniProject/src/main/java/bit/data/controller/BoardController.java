package bit.data.controller;

import bit.data.dto.BoardDto;
import bit.data.service.BoardServiceInter;
import bit.data.service.LoginService;
import bit.data.service.ReboardServiceInter;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import util.ChangeName;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
public class BoardController {

    @Autowired
    BoardServiceInter boardService;
    @Autowired
    ReboardServiceInter reboardService;
    @Autowired
    UserServiceInter userService;

    @Autowired
    LoginService loginService;

    @GetMapping("/board/boardForm") //게시판 작성폼
    public String boardForm(){

        return "/main/board/boardForm";
    }

    @GetMapping("/board/boardDetail") //게시판 디테일
    public ModelAndView boardDetail(int boardnum, int currentPage){

        ModelAndView mview = new ModelAndView();

        boardService.updateReadCount(boardnum);

        BoardDto dto = boardService.selectByNum(boardnum);

        String userphoto;
        try {
            userphoto = userService.getDataById(dto.getUserid()).getPhoto();
        }catch (NullPointerException e){
            userphoto="no";
        }
        mview.addObject("dto", dto);
        mview.addObject("currentPage", currentPage);
        mview.addObject("userphoto", userphoto);

        mview.setViewName("/main/board/boardDetail");

        return mview;
    }

    @PostMapping("/board/insert") //게시판 추가
    public String insert(BoardDto dto, List<MultipartFile>upload, HttpServletRequest request)
    {
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");

        //loging한 usernum에 해당하는 nickname 얻어서 dto에 넣기
        String nickname=userService.getDataByNum(dto.getUsernum()).getNickname();
        dto.setNickname(nickname);

        if (upload.get(0).getOriginalFilename().equals("")) {
            dto.setPhoto("no");
        } else {
            String photo = "";
            for(MultipartFile multi:upload)
            {
                String newName = ChangeName.getChangeFileName(multi.getOriginalFilename());
                photo+=newName+",";

                try {
                    Path paths= Paths.get(path+"/"+newName);
                    multi.transferTo(paths);
                   // multi.transferTo(new File(path+"/"+newName));
                } catch (Exception e) {
                    // throw new RuntimeException(e);
                }
            }
            photo = photo.substring(0, photo.length()-1);
            dto.setPhoto(photo);
        }
        boardService.insertBoard(dto);
        return "redirect:boardFree";
    }

    @GetMapping("/board/boardFree") //게시판 리스트 출력
    public String board(
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(value = "searchcolumn" ,required = false) String sc,
            @RequestParam(value = "searchword" ,required = false) String sw,
            Model model
    )
    {
        int totalCount=boardService.getTotalCount(sc,sw);
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

        List<BoardDto> list = boardService.getPagingList(sc, sw, startNum, perPage);
        for(BoardDto dto:list)
        {
            int reboardcount = reboardService.getAllReboards(dto.getBoardnum()).size();
            dto.setReboardcount(reboardcount);
        }
        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("totalPage", totalPage);

        return "/main/board/boardFree";
    }

    @GetMapping("/board/delete")
    public String delete(int boardnum, int currentPage)
    {
        boardService.deleteBoard(boardnum);
        return "redirect:boardFree?currentPage="+currentPage;
    }

    @PostMapping("/board/update")
    public String update(BoardDto dto, int currentPage, List<MultipartFile>upload,
                         HttpServletRequest request)
    {
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");

        if (upload.get(0).getOriginalFilename().equals("")) {
            dto.setPhoto(null);
        } else {
            String photo = "";
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
        boardService.updateBoard(dto);
        return "redirect:boardDetail?currentPage="+currentPage+"&boardnum="+dto.getBoardnum();
    }
    @GetMapping("/board/boardUpdate")
    public String updateform(Model model, int boardnum, int currentPage)
    {
        BoardDto dto = boardService.selectByNum(boardnum);
        model.addAttribute("dto", dto);
        model.addAttribute("currentPage", currentPage);

        return "/main/board/boardUpdate";
    }

}
