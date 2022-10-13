package bit.data.dao;


import bit.data.dto.MyLecJoinDto;

import java.util.List;
import java.util.Map;

public interface MyLecJoinDaoInter {
    public List<MyLecJoinDto> getMyLecListByNum(Map<String,Object> map);
    public List<MyLecJoinDto> getMyLecPayByNum(int usernum);
    public void deleteMyCartByLecdenum(Map<String,Integer> map);

    public List<MyLecJoinDto> getTotalIncom(Map<String, Object> map);
}
