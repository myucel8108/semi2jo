package bit.data.service;

import bit.data.dto.MyLecJoinDto;

import java.util.List;

public interface MyLecJoinServiceInter {

    public List<MyLecJoinDto> getMyLecListByNum(int usernum, String payok);
}
