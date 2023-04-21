package tnsubsidiary.zibpalm.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Fcomment {
    private Long fcId;
    private String fccomment;
    private Long fcpostId;
    private String fcemail;
    private Date fccdate;
    private Login login;
}