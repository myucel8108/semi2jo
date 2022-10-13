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
    //회원가입
    @Override
    public void insertUser(UserDto dto) {

        loginDao.insertUser(dto);
    }

    @Override
    public String checkLoginIdPass(String email, String userpass) {
        Map<String,String> map = new HashMap<String, String>();
        map.put("email",email);
        map.put("userpass",userpass);
        return loginDao.checkLoginIdPass(map);
    }

    @Override
    public UserDto getDataByNum(int usernum) {
        // TODO Auto-generated method stub
        return loginDao.getDataByNum(usernum);
    }

    @Override
    public int checkId(String userid) {
        return loginDao.checkId(userid);
    }

    //api로 로그인시 email로 판단
    @Override
    public String checkLoginId(String email) {
        return loginDao.checkLoginId(email);
    }
}


