package bit.data.controller;

import bit.data.service.BoardServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {

    @Autowired
    BoardServiceInter boardService;
    
    @GetMapping("/board/boardFree")
    public String sibal()
    {
        return "/main/board/boardFree";
    }

}
