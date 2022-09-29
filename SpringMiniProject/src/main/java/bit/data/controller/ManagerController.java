package bit.data.controller;

import bit.data.service.ManagerServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ManagerController {

    @Autowired
    ManagerServiceInter ManagerService;
}
