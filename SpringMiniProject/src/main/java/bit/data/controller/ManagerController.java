package bit.data.controller;

import bit.data.dto.LectureDto;
import bit.data.service.LectureServiceInter;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class ManagerController {

    @Autowired
    LectureServiceInter lectureService;

    @GetMapping("/lecturelist")
    public String getLecturelist(@RequestParam(defaultValue = "1") int currentPage,
                                 @RequestParam(value = "searchcolomn", required = false) String sc,
                                 @RequestParam(value = "searchword", required = false) String sw,
                                 Model model) { //강의 목록 출력
        int totalCount = lectureService.getTotalLectureCount(sc,sw);
        int perPage=12;//한 페이지 당 보여질 글의 갯수
        int perBlock=5;//한 블럭당 보여질 페이지의 갯수
        int startNum;//db에서 가져올 글의 시작번호(mysql은 첫글이 0번,오라클은 1번)
        int startPage;//각 블럭당 보여질 시작페이지
        int endPage;//각 블럭당 보여질 끝페이지
        int totalPage;//총 페이지수
        int no;//각 페이지 당 출력할 시작번호

        //총 페이지수를 구한다
        //총글의 개수/한페이지 당 보여질 개수로 나눔 (7/5=1)
        //나머지가 1이라도 있으면 무조건 1페이지 추가 (1+1=2페이지가 필요)
        totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

        //각 블럭 당 보여질 시작페이지
        //perBlock=5 일 경우 현재페이지가 1~5 일 경우는 시작페이지가 1, 끝페이지가 5
        //만약 현재페이지가 13 일 경우는 시작페이지가 11, 끝페이지가 15
        startPage=(currentPage-1)/perBlock*perBlock+1;
        endPage=startPage+perBlock-1;
        //총페이지수가 23개일 경우 마지막 블럭은 끝페이지가 25가 아니라 23이라야한다
        if(endPage>totalPage){
            endPage=totalPage;
        }

        //각 페이지에서 보여질 시작번호
        //예: 1페이지->0, 2페이지:5, 3페이지 : 10...
        startNum=(currentPage-1)*perPage;

        //각페이지당 출력할 시작번호 구하기
        //예: 총글갯수가 23이라면  1페이지는 23,2페이지는 18,3페이지는 13...
        no=totalCount-(currentPage-1)*perPage;
        List<LectureDto> list = lectureService.getLectureList(sc, sw, startNum, perPage);

        model.addAttribute("list", list);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("totalPage", totalPage);

        return "/manager/manager/lectureList";
    }

    //강의 등록 폼으로 이동
    @GetMapping("/addlectureform")
    public String addLecture(){
        return "/manager/manager/addLectureForm";
    }

    //강의 등록 후 강의 리스트로 이동
    @PostMapping("/insertlecture")
    public String insertLecture(LectureDto dto) { //강의 등록
        lectureService.insertLecture(dto);
        return "redirect:/lecturelist";
    }

    @GetMapping("/searchWordConn")
    @ResponseBody
    public HashMap<String, String> searchWordConn(HttpServletRequest req) { //강의 등록

        System.out.println("###### req : " + req.getParameter("searchWord"));
        String selectCol = req.getParameter("searchcolumn");
        System.out.println(selectCol);

        if(selectCol.equals("1")){
            System.out.println("###### searchcolumn : 1 ");

           // select * from table where date >= today(날짜만)(sysdate=초까지)
            // TO_CHAR(ADD_MONTHS(SYSDATE),'yyyy-MM-dd')
        } else if (selectCol.equals("2")){
            System.out.println("###### searchcolumn : 2 ");
        } else {
            System.out.println("###### 오류입니다.");
        }


        HashMap<String, String> msg = new HashMap<String, String>();
        msg.put("result", "성공!!");

        return msg;
    }
}
