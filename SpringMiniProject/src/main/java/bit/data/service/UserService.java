package bit.data.service;

import bit.data.dao.UserDaoInter;
import bit.data.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService implements UserServiceInter{

    @Autowired
    UserDaoInter userDao;

    @Override
    public int getUserTotalCount() {
        return userDao.getUserTotalCount();
    }

    @Override
    public List<UserDto> getAllUsers() {
        return userDao.getAllUsers();
    }

    @Override
    public UserDto getDataByNum(int usernum) {
        return userDao.getDataByNum(usernum);
    }

    @Override
    public UserDto getDataById(String userid) {
        return userDao.getDataById(userid);
    }

    @Override
    public void updateUserPhoto(int usernum, String photo) {
        Map<String, Object> map= new HashMap<>();
        map.put("usernum",usernum);
        map.put("photo", photo);
        userDao.updateUserPhoto(map);
    }

    @Override
    public void updateUser(UserDto dto) {
        userDao.updateUser(dto);
    }

    @Override
    public void deleteUser(int usernum) {
        userDao.deleteUser(usernum);
    }
}
