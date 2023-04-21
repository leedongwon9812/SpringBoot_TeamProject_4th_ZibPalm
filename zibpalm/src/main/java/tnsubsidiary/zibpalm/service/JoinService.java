package tnsubsidiary.zibpalm.service;

import tnsubsidiary.zibpalm.domain.Login;

public interface JoinService {
    Login check(Login login);

    int checkEmailS(String email);
    int checkNickS(String nickname);
    int checkPhoneS(String phone);
    Login insertAdminS(Login login);

    void deleteUser(String email);

    void updateUser(Login login);
}
