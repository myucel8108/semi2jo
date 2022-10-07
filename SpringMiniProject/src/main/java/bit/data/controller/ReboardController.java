package bit.data.controller;

import bit.data.dto.ReboardDto;
import bit.data.service.ReboardService;
import bit.data.service.ReboardServiceInter;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/reboard")
public class ReboardController {

    @Autowired
    ReboardServiceInter reboardService;

    @Autowired
    UserServiceInter userService;

    @PostMapping("/insert")
    @ResponseBody
    public void insert(ReboardDto dto)
    {
        //loging한 usernum에 해당하는 nickname 얻어서 dto에 넣기
        String nickname=userService.getDataByNum(dto.getUsernum()).getNickname();
        dto.setNickname(nickname);

        // reboard DB의 photo에 user DB의 userphoto 넣기
        String userphoto = userService.getDataByNum(dto.getUsernum()).getUserphoto();
        dto.setPhoto(userphoto);
        reboardService.insertReboard(dto);
    }
    @GetMapping("/list")
    @ResponseBody
    public List<ReboardDto>list(int boardnum)
    {
        return reboardService.getAllReboards(boardnum);
    }
    @GetMapping("/delete")
    @ResponseBody
    public void delete(int reboardnum)
    {
        reboardService.deleteByReboardnum(reboardnum);
    }
}
