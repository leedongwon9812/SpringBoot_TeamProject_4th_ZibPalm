package tnsubsidiary.zibpalm.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MainPost {
    private Long mpId;
    private String mpsub;
    private String mpcon;
    private String mpemail;
    private Long mpview;
    private Date mpcdate;
    private Date mpudate;
    private Login login;
}
