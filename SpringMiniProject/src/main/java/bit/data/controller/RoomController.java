package bit.data.controller;

import bit.data.service.RoomServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class RoomController {

    @Autowired
    RoomServiceInter roomService;
}
