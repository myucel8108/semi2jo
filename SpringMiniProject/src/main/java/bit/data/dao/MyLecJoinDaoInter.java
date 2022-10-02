package bit.data.dao;


import bit.data.dto.MyLecJoinDto;

import java.util.List;

public interface MyLecJoinDaoInter {
    public List<MyLecJoinDto> getMyLecListByNum(int usernum);

}
