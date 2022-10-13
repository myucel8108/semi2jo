package bit.data.controller;

import bit.data.dto.ReportBoardDto;
import bit.data.service.BoardServiceInter;
import bit.data.service.ReportBoardServiceInter;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class ReportBoardController {

    @Autowired
    ReportBoardServiceInter reportBoardService;
    @Autowired
    BoardServiceInter boardService;
    @Autowired
    UserServiceInter userService;

    @GetMapping("/board/report")
    @ResponseBody
    public int reportBoardUser(ReportBoardDto dto, HttpSession session)
    {

        dto.setUsernum((int)session.getAttribute("usernum"));
        int cnt = reportBoardService.checkReportBoard(dto.getBoardnum(), dto.getUsernum());
        //System.out.println(cnt);
        if(cnt==0){
            reportBoardService.insertReportBoard(dto);
            //총 신고수 증가
            boardService.updateReportCount(dto.getBoardnum());

            int totalreport = boardService.selectByNum(dto.getBoardnum()).getReport();
            return totalreport;
        }else{
            return -1;
        }
    }
}
