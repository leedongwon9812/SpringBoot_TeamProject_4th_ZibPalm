package tnsubsidiary.zibpalm.service;

import tnsubsidiary.zibpalm.domain.Login;

import java.util.List;


public interface LoginService {

    int checkLogin(String email, String pwd);

    Login getLogin(String email);

    Login findByEmail(String email);

    List<Login> findByOthers(String email);
}
