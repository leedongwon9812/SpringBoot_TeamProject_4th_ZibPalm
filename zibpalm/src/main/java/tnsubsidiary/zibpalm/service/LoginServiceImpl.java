package tnsubsidiary.zibpalm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tnsubsidiary.zibpalm.domain.Login;
import tnsubsidiary.zibpalm.mapper.LoginMapper;

import java.util.List;

import static tnsubsidiary.zibpalm.service.LoginConst.*;

@Service
public class LoginServiceImpl implements LoginService{

    @Autowired
    LoginMapper loginMapper;

    @Override
    public int checkLogin(String email, String pwd) {
        Login login = loginMapper.findByEmail(email);
        if(login == null){
            return NO_ID;
        }else {
            String dbPwd = login.getPwd();
            if(dbPwd != null) dbPwd = dbPwd.trim();

            if(!dbPwd.equals(pwd)){
                return NO_PWD;
            }else{
                return YES_ID_PWD;
            }
        }
    }

    @Override
    public Login getLogin(String email) {
        Login login = loginMapper.findByEmail(email);
        login.setPwd("");

        return login;
    }

    @Override
    public Login findByEmail(String email){
        return loginMapper.findByEmail(email);
    }

    @Override
    public List<Login> findByOthers(String email){
        return loginMapper.findByOthers(email);
    }
}
