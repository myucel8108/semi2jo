package bit.data.service;

import bit.data.dao.LoginDaoInter;
import bit.data.dao.UserDaoInter;
import bit.data.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
@Service
public class LoginService implements LoginServiceInter{

    @Autowired
    LoginDaoInter loginDao;

    @Override
    public void insertUser(UserDto dto) {

        loginDao.insertUser(dto);
    }

    @Override
    public int checkLoginIdPass(String loginid, String loginpass) {
        Map<String,String> map = new HashMap<String, String>();
        map.put("loginid",loginid);
        map.put("loginpass",loginpass);
        return loginDao.checkLoginIdPass(map);
    }

    @Override
    public UserDto getDataById(String id) {
        // TODO Auto-generated method stub
        return loginDao.getDataById(id);
    }

    @Override
    public int checkId(String userid) {
        return loginDao.checkId(userid);
    }
}
