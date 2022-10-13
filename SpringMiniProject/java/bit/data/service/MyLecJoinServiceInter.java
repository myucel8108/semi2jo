package bit.data.service;

import bit.data.dto.MyLecJoinDto;

import java.util.List;

public interface MyLecJoinServiceInter {

    public List<MyLecJoinDto> getMyLecListByNum(int usernum, String payok);

    public List<MyLecJoinDto> getMyLecPayByNum(int usernum);

    public void deleteMyCartByLecdenum(int usernum,int lecdenum);

    public List<MyLecJoinDto> getTotalIncom(int year, int month);

}
