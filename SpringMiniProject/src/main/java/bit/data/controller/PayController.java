package bit.data.controller;

import bit.data.service.PayServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class PayController {

    @Autowired
    PayServiceInter payService;
}
