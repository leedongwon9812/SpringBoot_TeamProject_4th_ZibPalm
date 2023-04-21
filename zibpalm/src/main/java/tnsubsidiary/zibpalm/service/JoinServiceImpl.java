package tnsubsidiary.zibpalm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tnsubsidiary.zibpalm.domain.Login;
import tnsubsidiary.zibpalm.mapper.JoinMapper;

@Service
public class JoinServiceImpl implements JoinService{
    @Autowired
    JoinMapper joinMapper;
    @Override
    public Login check(Login login) {
        joinMapper.insertKey(login);
        return login;

    }

    @Override
    public int checkEmailS(String email) {

        return joinMapper.checkEmail(email);
    }

    @Override
    public int checkNickS(String nickname) {
        return joinMapper.checkNick(nickname);
    }

    @Override
    public int checkPhoneS(String phone) {
        return joinMapper.checkPhone(phone);
    }

    @Override
    public Login insertAdminS(Login login) {
        joinMapper.insertAdmin(login);
        return login;
    }

    @Override
    public void deleteUser(String email) {
        joinMapper.deleteUser(email);
    }

    @Override
    public void updateUser(Login login) {
        joinMapper.updateUser(login);
    }
}
