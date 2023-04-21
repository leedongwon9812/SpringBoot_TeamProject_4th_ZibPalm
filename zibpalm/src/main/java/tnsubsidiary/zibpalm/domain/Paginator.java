package tnsubsidiary.zibpalm.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Paginator {
    private int currentPage;
    private long totalCount;
    private int pageSize;
    private long totalPageCount;
    private int foreachStart;
    private int foreachEnd;
    private int modifiedTotalCount;
    private String category;
    private String boardType;
    private Date nowTime;
    private String searchOption;
    private String searchWord;
    private String myEmail;

    private int fcurrentPage;
    private int fpageSize;

    public Paginator(int currentPage, int pageSize, long totalCount, String category, String selectOption, String search, String boardType) {
        this.currentPage = currentPage;
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.totalPageCount = calTotalPageCount();
        this.category = category;
        this.boardType = boardType;
        this.nowTime = getDateFormat();
        this.searchOption = selectOption;
        this.searchWord = search;
        forEachStartAndEnd();
    }

    public Paginator(int currentPage, int pageSize, String category, String boardType) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.category = category;
        this.boardType = boardType;
        this.nowTime = getDateFormat();
    }

    public Paginator(int fcurrentPage, int fpageSize, long totalCount) {
        this.fcurrentPage = fcurrentPage;
        this.fpageSize = fpageSize;
        this.totalCount = totalCount;
        this.totalPageCount = calTotalCommentPageCount();
    }

    public Paginator(int currentPage, int pageSize, long totalCount, String category, String boardType, String myEmail) {
        this.currentPage = currentPage;
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.totalPageCount = calTotalPageCount();
        this.category = category;
        this.boardType = boardType;
        this.myEmail = myEmail;
        this.nowTime = getDateFormat();
        forEachStartAndEnd();
    }

    private long calTotalPageCount() {
        if(totalCount==0){
            return 1;
        }else {
            long tpc = totalCount / pageSize;
            if (totalCount % pageSize != 0) tpc++;
            return tpc;
        }
    }

    private long calTotalCommentPageCount() {
        if(totalCount==0){
            return 1;
        }else {
            long tpc = totalCount / fpageSize;
            if (totalCount % fpageSize != 0) tpc++;
            return tpc;
        }
    }

    private void forEachStartAndEnd() {
        foreachStart = 1;
        foreachEnd = (int)totalPageCount;
        if (currentPage<=5 && totalPageCount>10) {
            foreachEnd = 10;
        } else if (currentPage > 5 && totalPageCount - currentPage >= 5) {
            foreachStart = currentPage - 4;
            foreachEnd = currentPage + 5;
        } else if (currentPage > 5 && totalPageCount > 9 && totalPageCount - currentPage < 5) {
            foreachStart = (int) totalPageCount - 9;
            foreachEnd = (int) totalPageCount;
        }
    }

    private Date getDateFormat(){
        LocalDate localDate = LocalDate.now();
        Date nowTime = java.sql.Date.valueOf(localDate);
        return nowTime;
    }
}
