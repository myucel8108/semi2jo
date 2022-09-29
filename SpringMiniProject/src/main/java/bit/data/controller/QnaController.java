package bit.data.controller;

import bit.data.service.QnaServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class QnaController {

    @Autowired
    QnaServiceInter qnaService;
}
