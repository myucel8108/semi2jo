package bit.data.controller;

import bit.data.service.LockerServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class LockerController {

    @Autowired
    LockerServiceInter LockerService;
}
