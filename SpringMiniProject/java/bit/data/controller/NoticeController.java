package bit.data.controller;

import bit.data.service.NoticeServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class NoticeController {

    @Autowired
    NoticeServiceInter noticeService;
}
