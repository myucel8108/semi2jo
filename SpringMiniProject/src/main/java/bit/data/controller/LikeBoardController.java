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
            likeBoardService.insertLikeBoard(dto); //최초로 좋아요를 클릭하기
        }else{
            //System.out.println("update="+dto.getUsernum()+","+dto.getLikestate());
            likeBoardService.updateLikeState(dto); //좋아요를 수정하기
        }
        if(dto.getLikestate()==0){
            boardService.updateDecreLikeCount(dto.getBoardnum()); //좋아요를 취소하기
        }else{
            boardService.updateIncreLikeCount(dto.getBoardnum()); //취소했던 좋아요를 다시 좋아요하기
        }
        int totallike=boardService.selectByNum(dto.getBoardnum()).getLikes();
        return totallike; //좋아요 여부를 반환
    }

    @GetMapping("/board/likesstate") //좋아요 돼있는지 안돼있는지
    @ResponseBody
    public int likeStateBoardUser(int boardnum, HttpSession session)
    {
        int usernum=((int)session.getAttribute("usernum"));

        int likestate=likeBoardService.stateBoardLike(boardnum,usernum);
        //System.out.println("likestate="+likestate);
        return likestate;
    }
    @GetMapping("/board/likesuser") //좋아요 누른 회원들 출력
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
