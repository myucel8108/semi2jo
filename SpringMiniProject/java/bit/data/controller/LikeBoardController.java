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
        dto.setUsernum((int)session.getAttribute("usernum"));
        int cnt=likeBoardService.checkBoardLike(dto.getBoardnum(),dto.getUsernum());

        if(cnt==0){
            //System.out.println("insert="+dto.getUsernum()+","+dto.getLikestate());
            likeBoardService.insertLikeBoard(dto);
        }else{
            //System.out.println("update="+dto.getUsernum()+","+dto.getLikestate());
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
        int usernum=((int)session.getAttribute("usernum"));

        int likestate=likeBoardService.stateBoardLike(boardnum,usernum);
        //System.out.println("likestate="+likestate);
        return likestate;
    }
    @GetMapping("/board/likesuser") 
    @ResponseBody
    public List<String> likeUser(int boardnum)
    {
      List<Integer> usernums=likeBoardService.likeUserAll(boardnum);
      List<String> list=new ArrayList<>();
     String s="";

      for(int num:usernums){
          String nickname=userService.getDataByNum(num).getNickname();
          String userphoto=userService.getDataByNum(num).getUserphoto();
          if (userphoto != null) {

              s="<img src='../upload/"+userphoto+"' width=40 height=40 class='rounded-circle'>"+nickname;
          }
          if (userphoto == null) {

              s="<img src='../image/noprofilepicture.png' width=40 height=40 class='rounded-circle'>"+nickname;
          }
          //s=nickname;
          list.add(s);
      }
      return  list;
    }
}
