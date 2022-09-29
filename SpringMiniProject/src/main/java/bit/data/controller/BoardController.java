package bit.data.controller;

import bit.data.service.BoardServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BoardController {

    @Autowired
    BoardServiceInter BoardService;
}
