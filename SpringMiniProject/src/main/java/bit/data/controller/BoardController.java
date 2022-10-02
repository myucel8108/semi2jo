package bit.data.controller;

import bit.data.dto.BoardDto;
import bit.data.service.BoardServiceInter;
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
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
public class BoardController {

    @Autowired
    BoardServiceInter boardService;

    @GetMapping("/board/boardForm")
    public String boardForm(){

        return "/mypage/board/boardForm";
    }

    @GetMapping("/board/boardDetail")
    public ModelAndView boardDetail(int boardnum, int currentPage){

        ModelAndView mview = new ModelAndView();

        boardService.updateReadCount(boardnum);

        BoardDto dto = boardService.selectByNum(boardnum);

        mview.addObject("dto", dto);
        mview.addObject("currentPage", currentPage);

        mview.setViewName("/mypage/board/boardDetail");

        return mview;
    }

    @PostMapping("/board/insert")
    public String insert(BoardDto dto, List<MultipartFile>upload, HttpServletRequest request)
    {
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");

        System.out.println(path);
        System.out.println(upload.size());

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
                } catch (Exception e) {
                   // throw new RuntimeException(e);
                    System.out.println("파일오류:"+e.getMessage());
                }
            }
            photo = photo.substring(0, photo.length()-1);
            dto.setPhoto(photo);
        }
        boardService.insertBoard(dto);
        return "redirect:boardFree";
    }

    @GetMapping("/board/boardFree")
    public String board(
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(value = "searchcolumn" ,required = false) String sc,
            @RequestParam(value = "searchword" ,required = false) String sw,
            Model model
    )
    {
        int totalCount=boardService.getTotalCount(sc,sw);
        int perPage=10;
        int perBlock=10;
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
        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("totalPage", totalPage);

        return "/mypage/board/boardFree";
    }

}
