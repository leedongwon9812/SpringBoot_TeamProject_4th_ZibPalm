package tnsubsidiary.zibpalm.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Info {
    private Long infoId;
    private String apt;
    private Long iguId;
    private String dong;
    private String price;
    private float earea;
    private int dyear;
    private int dmonth;
    private Gu gu;
}
