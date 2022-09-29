package bit.data.controller;

import bit.data.service.LecTypeServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class LecTypeController {

    @Autowired
    LecTypeServiceInter LecTypeService;
}
