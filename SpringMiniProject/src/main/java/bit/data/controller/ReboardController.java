package bit.data.controller;

import bit.data.dto.ReboardDto;
import bit.data.service.ReboardService;
import bit.data.service.ReboardServiceInter;
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

    @PostMapping("/insert")
    @ResponseBody
    public void insert(ReboardDto dto)
    {
        reboardService.insertReboard(dto);
    }
    @GetMapping("/reboard/list")
    public List<ReboardDto>list(int boardnum)
    {
        return reboardService.getAllReboards(boardnum);
    }
}
