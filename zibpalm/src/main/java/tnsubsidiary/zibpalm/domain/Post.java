package tnsubsidiary.zibpalm.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Post {
    private Long postId;
    private String subject;
    private String content;
    private String pemail;
    private Long pinfoId;
    private String status;
    private Long pview;
    private Date pcdate;
    private Date pudate;
    private Login login;
}