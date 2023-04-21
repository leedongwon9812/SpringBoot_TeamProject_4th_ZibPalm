package tnsubsidiary.zibpalm.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Login {
    private String email;
    private String pwd;
    private String nickname;
    private String phone;
    private Date lcdate;
    private Date lwdate;
    private String isadmin;
}
