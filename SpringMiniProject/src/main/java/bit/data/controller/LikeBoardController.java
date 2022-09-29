package bit.data.controller;

import bit.data.service.LikeBoardServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class LikeBoardController {

    @Autowired
    LikeBoardServiceInter LikeBoardService;
}
