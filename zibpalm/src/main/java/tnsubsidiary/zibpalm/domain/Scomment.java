package tnsubsidiary.zibpalm.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Scomment {
    private Long scId;
    private String sccomment;
    private Long scfcId;
    private String scemail;
    private Date sccdate;
    private Login login;
}