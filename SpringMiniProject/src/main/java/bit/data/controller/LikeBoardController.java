package bit.data.controller;

import bit.data.dto.LikeBoardDto;
import bit.data.service.BoardServiceInter;
import bit.data.service.LikeBoardServiceInter;
import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class LikeBoardController {

    @Autowired
    LikeBoardServiceInter likeBoardService;
    @Autowired
    BoardServiceInter boardService;

    @Autowired
    UserServiceInter userService;

    @GetMapping("/board/likes")
    @ResponseBody
    public int likeBoardUser(LikeBoardDto dto, HttpSession session)
    {
        dto.setUserid((String)session.getAttribute("loginid"));
        int cnt=likeBoardService.checkBoardLike(dto.getBoardnum(),dto.getUserid());

        if(cnt==0){
            likeBoardService.insertLikeBoard(dto);
        }else{
            likeBoardService.updateLikeState(dto);
        }
        if(dto.getLikestate()==0){
            boardService.updateDecreLikeCount(dto.getBoardnum());
        }else{
            boardService.updateIncreLikeCount(dto.getBoardnum());
        }
        int totallike=boardService.selectByNum(dto.getBoardnum()).getLikes();
        return totallike;
    }

    @GetMapping("/board/likesstate")
    @ResponseBody
    public int likeStateBoardUser(int boardnum, HttpSession session)
    {
        String userid=(String)session.getAttribute("loginid");

        int likestate=likeBoardService.stateBoardLike(boardnum,userid);
        return likestate;
    }
    @GetMapping("/board/likesuser")
    @ResponseBody
    public List<String> likeUser(int boardnum)
    {

      List<String> userids=likeBoardService.likeUserAll(boardnum);
      List<String> list=new ArrayList<>();
     String s="";
      for(String id:userids){
          String nickname=userService.getDataById(id).getNickname();
          s=nickname+"("+id+")";
          list.add(s);
      }
      return  list;
    }


}
