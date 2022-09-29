package bit.data.controller;

import bit.data.service.ReboardServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ReboardController {

    @Autowired
    ReboardServiceInter reboardService;
}
