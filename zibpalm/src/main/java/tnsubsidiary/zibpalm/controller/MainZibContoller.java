package tnsubsidiary.zibpalm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tnsubsidiary.zibpalm.domain.*;
import tnsubsidiary.zibpalm.service.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static tnsubsidiary.zibpalm.service.LoginConst.*;

@Controller
public class MainZibContoller {

    @Autowired
    private PostService postService;

    @Autowired
    private MainPostService mainPostService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private LoginService loginService;

    @Autowired
    private MarketPriceService priceService;

    @Autowired
    private JoinService joinService;

    @GetMapping("index")
    public String index(HttpSession session, HttpServletRequest request){
        // 세션 url 만들기
        String currentUri = request.getRequestURI().toString();
        String queryString = request.getQueryString();

        session.setAttribute("uri", currentUri);
        session.setAttribute("query", queryString);

        return "index";
    }

    @GetMapping("/subsidiary")
    public String subsidiary(HttpSession session, HttpServletRequest request) {
        // 세션 url 만들기
        String currentUri = request.getRequestURI().toString();
        String queryString = request.getQueryString();

        session.setAttribute("uri", currentUri);
        session.setAttribute("query", queryString);

        return "subsidiary";
    }

    @GetMapping("/terms")
    public String terms(HttpSession session, HttpServletRequest request) {
        // 세션 url 만들기
        String currentUri = request.getRequestURI().toString();
        String queryString = request.getQueryString();

        session.setAttribute("uri", currentUri);
        session.setAttribute("query", queryString);

        return "terms";
    }

    @GetMapping("/introduce")
    public String introduce(HttpSession session, HttpServletRequest request) {
        // 세션 url 만들기
        String currentUri = request.getRequestURI().toString();
        String queryString = request.getQueryString();

        session.setAttribute("uri", currentUri);
        session.setAttribute("query", queryString);

        return "introduce";
    }

    @GetMapping("/join")
    public String join(HttpSession session, HttpServletRequest request) {
        // 세션 url 만들기
        String currentUri = request.getRequestURI().toString();
        String queryString = request.getQueryString();

        session.setAttribute("uri", currentUri);
        session.setAttribute("query", queryString);

        return "join";
    }

    @PostMapping("join.do")
    public void joinDo(Model model, Login login, HttpSession session, HttpServletResponse response) {
        int resultEmail =  joinService.checkEmailS(login.getEmail());
        int resultNick = joinService.checkNickS(login.getNickname());
        int resultPhone = joinService.checkPhoneS(login.getPhone());

        // 관리자용 회원가입 코드
        String admin = "dojin";
        String print;

        if(resultEmail == 0) {
            if(resultNick == 0) {
                if(resultPhone == 0) {
                    if(login.getIsadmin().equals(admin)) {
                        joinService.insertAdminS(login);
                        print = "<script>alert('관리자 회원가입이 완료되었습니다.'); location.href='index';</script>";
                    }else if(login.getIsadmin().equals("")) {
                        joinService.check(login);
                        print = "<script>alert('회원가입이 완료되었습니다.'); location.href='index';</script>";
                    }else {
                        print = "<script>alert('잘못된 관리자 코드입니다.'); history.go(-1);</script>";
                    }
                }else{
                    print = "<script>alert('중복된 전화번호입니다.'); history.go(-1);</script>";
                }
            }else{
                print = "<script>alert('중복된 닉네임입니다.'); history.go(-1);</script>";
            }
        }else{
            print = "<script>alert('중복된 이메일입니다.'); history.go(-1);</script>";
        }

        try {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println(print);
            out.flush();
        } catch (Exception e) {
            System.out.println("예외상황 발생: " + e);
        }
    }

    @GetMapping("/updatemember")
    public String updatemember(Model model, HttpSession session, HttpServletResponse response) {
        String email = (String)session.getAttribute("email");
        if(email == null){
            try {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인이 필요한 서비스입니다.'); history.go(-1);</script>");
                out.flush();
            }catch (Exception e) {
                System.out.println("예외상황 발생: " + e);
                return "index";
            }
        }

        Login login = loginService.findByEmail(email);

        model.addAttribute("login", login);

        return "updatemember";
    }

    @PostMapping("updatemember.do")
    public void updatememberDo(Model model, Login login, HttpSession session, HttpServletResponse response) {
        String email = (String)session.getAttribute("email");
        if(email == null){
            try {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인이 필요한 서비스입니다.'); history.go(-1);</script>");
                out.flush();
            }catch (Exception e) {
                System.out.println("예외상황 발생: " + e);
            }
        }

        List<Login> others = loginService.findByOthers(email);

        String print;
        int check = 0;

        for(Login other : others){
            if(other.getNickname().equals(login.getNickname())){
                check = 1;
            }else if(other.getPhone().equals(login.getPhone())){
                check = 2;
            }
        }

        if(check == 1) {
            print = "<script>alert('중복된 닉네임입니다.'); history.go(-1);</script>";
        }else if(check == 2) {
            print = "<script>alert('중복된 전화번호입니다.'); history.go(-1);</script>";
        }else{
            joinService.updateUser(login);
            Login newLogin = loginService.findByEmail(email);

            model.addAttribute("login", newLogin);

            print = "<script>alert('회원정보 수정이 완료되었습니다.'); history.go(-1);</script>";
        }

        try {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println(print);
            out.flush();
        } catch (Exception e) {
            System.out.println("예외상황 발생: " + e);
        }
    }

    @GetMapping("/withdraw")
    public String withdraw(Model model, HttpServletResponse response, HttpSession session) {
        String email = (String)session.getAttribute("email");
        if(email == null){
            try {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인이 필요한 서비스입니다.'); history.go(-1);</script>");
                out.flush();
            }catch (Exception e) {
                System.out.println("예외상황 발생: " + e);
                return "index";
            }
        }

        Login login = loginService.findByEmail(email);

        model.addAttribute("login", login);

        return "withdraw";
    }

    @PostMapping("withdraw.do")
    public String withdrawDo(Login login, HttpServletResponse response, HttpSession session) {

        session.removeAttribute("email");
        session.removeAttribute("nickname");

        joinService.deleteUser(login.getEmail());

        //접속한 url 만들기
        String path = "";
        String uri = (String)session.getAttribute("uri");
        String query = (String)session.getAttribute("query");

        if(uri != null) {
            uri = uri.substring(1);
            path = uri;
            if(query != null) {
                path = uri + "?" + query;
            }
        }else{
            path = "index";
        }
        return "redirect:" + path;
    }

    @PostMapping("login.do")
    public void loginDo(Login login, HttpSession session, HttpServletResponse response){
        int result = loginService.checkLogin(login.getEmail(), login.getPwd());

        //접속한 url 만들기
        String path;
        String uri = (String)session.getAttribute("uri");
        String query = (String)session.getAttribute("query");

        if(uri != null) {
            uri = uri.substring(1);
            path = uri;
            if(query != null) {
                path = uri + "?" + query;
            }
        }else{
            path = "index";
        }

        String print;

        if(result == YES_ID_PWD) {
            Login loginOkUser = loginService.getLogin(login.getEmail());

            session.setAttribute("email", loginOkUser.getEmail());
            session.setAttribute("nickname", loginOkUser.getNickname());

            print = "<script>alert('로그인 성공'); location.href='"+ path + "';</script>";
        }else if(result == NO_ID){
            print = "<script>alert('아이디를 확인해주세요.'); history.go(-1);</script>";
        }else if(result == NO_PWD) {
            print = "<script>alert('비밀번호를 확인해주세요.'); history.go(-1);</script>";
        }else{
            print = "<script>alert('예외상황 발생');</script>";
        }

        try {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println(print);
            out.flush();
        } catch (Exception e) {
            System.out.println("예외상황 발생: " + e);
        }
    }

    @GetMapping("logout.do")
    public String logout(HttpSession session){

        session.removeAttribute("email");
        session.removeAttribute("nickname");

        //접속한 url 만들기
        String path = "";
        String uri = (String)session.getAttribute("uri");
        String query = (String)session.getAttribute("query");

        if(uri != null) {
            uri = uri.substring(1);
            path = uri;
            if(query != null) {
                path = uri + "?" + query;
            }
        }else{
            path = "index";
        }
        return "redirect:" + path;
    }

    @GetMapping("/postlist")
    public String postlist(Model model, int cp, int ps, String cat, String sbv, String stv, String bt, String getEmail, HttpSession session, HttpServletRequest request){

        // 세션 url 만들기
        String currentUri = request.getRequestURI().toString();
        String queryString = request.getQueryString();
        session.setAttribute("uri", currentUri);
        session.setAttribute("query", queryString);

        // 공지사항 리스트
        List<MainPost> mlist = mainPostService.mainPostGetList();

        model.addAttribute("mlist", mlist);

        String email = (String)session.getAttribute("email");
        if(email != null){
            if(email.equals(getEmail)) {
                long totalMyCount = postService.getTotalMyCount(email);
                Paginator myPaginator = new Paginator(cp, ps, totalMyCount, cat, bt, email);
                List<Post> myPlist = postService.postGetMyList(myPaginator);

                model.addAttribute("plist", myPlist);
                model.addAttribute("paginator", myPaginator);

                return "/postlist";
            }
        }


        long totalCount = postService.getTotalCount();    // 리스트 전체 개수

        long totalAPTCount = postService.getTotalAPTCount();    // 아파트 리스트 전체 개수

        // 페이징 처리 객체(현제페이지, 페이지사이즈, 리스트전체개수, 카테고리, 검색옵션, 검색어, 보드타입)
        Paginator paginator = new Paginator(cp, ps, totalCount, cat, sbv, stv, bt);

        //카테고리에 따라
        if (cat.equals("apt")){
            Paginator aptPaginator = new Paginator(cp, ps, totalAPTCount, cat, sbv, stv, bt);
            paginator = aptPaginator;
        }else if(cat.equals("else")){
            long minus = totalCount - totalAPTCount;
            Paginator elsePaginator = new Paginator(cp, ps, minus, cat, sbv, stv, bt);
            paginator = elsePaginator;
        }

        //검색어에 따라 나눠주기
        if (paginator.getSearchWord() != null) {
            long modifiedTotalCount = postService.getModifiedTotalCount(paginator);
            Paginator newPaginator = new Paginator(cp, ps, modifiedTotalCount, cat, sbv, stv, bt);
            List<Post> newPlist = postService.searchGetList(newPaginator);

            model.addAttribute("plist", newPlist);
            model.addAttribute("paginator", newPaginator);
        }else{
            List<Post> plist = postService.postGetList(paginator);

            model.addAttribute("plist", plist);
            model.addAttribute("paginator", paginator);
        }

        return "/postlist";
    }

    @GetMapping("/postcontent")
    public String postcontent(Model model, Post post, MainPost mainPost, Info info, int cp, int ps,
                              Integer fcp, Integer fps, Long mpId, Long postId, String cat, String sbv,
                              String stv, String bt, HttpSession session, HttpServletRequest request, HttpServletResponse response) {

        // 세션 url 만들기
        String currentUri = request.getRequestURI().toString();
        String queryString = request.getQueryString();
        session.setAttribute("uri", currentUri);
        session.setAttribute("query", queryString);

        if(postId != null) {
            post = postService.selectBySeq(postId);
            info = postService.getInfoBySeq(post.getPinfoId());

            /* --------(참고) 댓글 페이징처리는 현재 사용 안함(23/03/29) --------*/
            /* ----------------   하지만 객체 자체는 필요함    ----------------*/
            long fcTotalCount = commentService.getTotalCountFC(postId); // 댓글 전체 개수
            if(fcp == null){
                fcp = 1;
            }
            if(fps == null){
                fps = 100;
            }
            Paginator fcPaginator = new Paginator(fcp, fps, fcTotalCount); // 댓글용 페이징객체

            HashMap<String, Object> fcListHashMap = commentService.forFcommentList(fcPaginator, postId); // 댓글리스트용 HashMap

            List<Fcomment> fcList = commentService.fcommentGetList(fcListHashMap);
            List<Scomment> scList;
            HashMap<Long, List> scMap = new HashMap<>();

            for(Fcomment f : fcList){
                long fc = f.getFcId();
                scList = commentService.scommentGetList(fc);
                if(scList.size() > 0) {

                    scMap.put(fc, scList);
                }
            }

            model.addAttribute("fcList", fcList);
            model.addAttribute("scMap", scMap);
            model.addAttribute("fcPaginator", fcPaginator);

        }else if(mpId != null){
            mainPost = mainPostService.selectBySeqM(mpId);
        }else{
            return "redirect:postlist?cp="+cp+"&ps=" + ps + "&cat=" + cat + "&bt=" + bt;
        }

        Paginator paginator = new Paginator(cp, ps, cat, bt);

        // 조회수 쿠키활용
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            String postCookie = "";
            String mainPostCookie = "";
            boolean isUsePC = true;
            boolean isUseMPC = true;
            for (Cookie cookie : cookies) {
                if(postId != null) {
                    postCookie = "postC_" + postId;
                    if (cookie.getValue().contains(postCookie)) {
                        isUsePC = false;
                    }
                }else if(mpId != null){
                    mainPostCookie = "mainC_" + mpId;
                    if (cookie.getValue().contains(mainPostCookie)) {
                        isUseMPC = false;
                    }
                }
            }
            if(postId != null) {
                if (isUsePC) {
                    Cookie newCookieP = new Cookie(postCookie, postCookie);
                    newCookieP.setMaxAge(86400);  /* 쿠키 시간 60 * 60 * 24 */
                    response.addCookie(newCookieP);
                    postService.selectHitsUpdatePost(postId);
                }
            }else if(mpId != null){
                if (isUseMPC) {
                    Cookie newCookieMP = new Cookie(mainPostCookie, mainPostCookie);
                    newCookieMP.setMaxAge(86400);
                    response.addCookie(newCookieMP);
                    mainPostService.selectHitsUpMainPost(mpId);
                }
            }
        } else {
            if(postId != null) {
                Cookie newCookieP = new Cookie("visit_post_cookie", "postC_" + postId);
                newCookieP.setMaxAge(60 * 60 * 24);
                response.addCookie(newCookieP);
                postService.selectHitsUpdatePost(postId);
            }else if(mpId != null){
                Cookie newCookieMP = new Cookie("visit_mainpost_cookie", "mainpostC_" + mpId);
                newCookieMP.setMaxAge(60 * 60 * 24);
                response.addCookie(newCookieMP);
                mainPostService.selectHitsUpMainPost(mpId);
            }
        }

        model.addAttribute("post", post);
        model.addAttribute("info", info);
        model.addAttribute("mainPost", mainPost);
        model.addAttribute("paginator", paginator);
        return "/postcontent";
    }

    @GetMapping("/postwrite")
    public String postwrite(Model model, int cp, int ps, String cat, String bt, HttpSession session, HttpServletResponse response) {
        String email = (String)session.getAttribute("email");
        if(email == null){
            try {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인이 필요한 서비스입니다.'); history.go(-1);</script>");
                out.flush();
            }catch (Exception e) {
                System.out.println("예외상황 발생: " + e);
                return "index";
            }
        }
        String admin = postService.checkIsAdmin(email);
        if(admin != null) {
            if (postService.checkIsAdmin(email).equals("admin")) {
                return "/mainpostwrite";
            }else{
                return "index";
            }
        }

        Paginator paginator = new Paginator(cp, ps, cat, bt);

        List<Info>  ilist = postService.getSelectInfo();

        model.addAttribute("paginator", paginator);
        model.addAttribute("ilist", ilist);
        return "/postwrite";
    }

    @PostMapping("write.search")
    public @ResponseBody List<Info> writeSearch(String text) {
        List<Info> list;
        if(text != null) {
            list = postService.getSearchInfo(text);
        }else{
            list = postService.getSelectInfo();
        }

        return list;
    }

    @PostMapping("auto.write")
    public @ResponseBody List<Info> autoWriteSearch(String text) {
        List<Info> list = postService.getSearchInfo(text);

        return list;
    }

    @PostMapping("write.info")
    public @ResponseBody Info writeInfo(Long select) {
        Info info = postService.getInfoBySeq(select);

        return info;
    }

    @PostMapping("postwrite.do")
    public String postwriteDo(Post post, MainPost mainpost, HttpSession session, HttpServletResponse response) {
        String email = (String)session.getAttribute("email");
        if(email == null){
            try {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인이 필요한 서비스입니다.'); history.go(-1);</script>");
                out.flush();
            }catch (Exception e) {
                System.out.println("예외상황 발생: " + e);
                return "index";
            }
        }

        String uri = (String)session.getAttribute("uri");
        String query = (String)session.getAttribute("query");
        uri = uri.substring(1);
        String path = uri;
        if(query != null) {
            path = uri + "?" + query;
        }

        String admin = postService.checkIsAdmin(email);
        if(admin != null) {
            if (postService.checkIsAdmin(email).equals("admin")) {
                mainpost.setMpemail(email);
                mainPostService.insertMainPost(mainpost);
                return "redirect:" + path;
            }else{
                return "index";
            }
        }

        post.setPemail(email);
        postService.insertPost(post);

        return "redirect:" + path;
    }

    @GetMapping("/postdel.do")
    public String postDel(Long postId, String pemail, Long mpId, String mpemail, String cat, HttpSession session, HttpServletResponse response) {

        String email = (String)session.getAttribute("email");
        if(email == null){
            try {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인이 필요한 서비스입니다.'); history.go(-1);</script>");
                out.flush();
            }catch (Exception e) {
                System.out.println("예외상황 발생: " + e);
                return "index";
            }
        }

        if(postId != null) {
            if(email.equals(pemail)){
                postService.deletePost(postId);
            }
        }else if(mpId != null){
            if(email.equals(mpemail)){
                mainPostService.deleteMainpost(mpId);
            }
        }


        return "redirect:postlist?cp=1&ps=10&cat=" + cat + "&bt=list";
    }

    @GetMapping("/postupdate")
    public String postUpdate(Model model, Long postId, String pemail, Long mpId, String mpemail, HttpSession session,
                             HttpServletResponse response, HttpServletRequest request) {

        String email = (String)session.getAttribute("email");
        if(email == null){
            try {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인이 필요한 서비스입니다.'); history.go(-1);</script>");
                out.flush();
            }catch (Exception e) {
                System.out.println("예외상황 발생: " + e);
                return "index";
            }
        }

        String referer = request.getHeader("Referer");

        if(postId != null) {
            if(email.equals(pemail)) {
                Post post = postService.selectBySeq(postId);
                List<Info>  ilist = postService.getSelectInfo();

                model.addAttribute("post", post);
                model.addAttribute("ilist", ilist);
            }else{
                return "redirect:/"+ referer;
            }
        }else if(mpId != null){
            if(email.equals(mpemail)) {
                MainPost mainPost = mainPostService.selectBySeqM(mpId);

                model.addAttribute("mainPost", mainPost);
            }else{
                return "redirect:/"+ referer;
            }
        }
        return "/postupdate";
    }

    @PostMapping("/postupdate.do")
    public String postUpdateDo(Post post, MainPost mainPost, Long postId, String pemail, Long mpId, String mpemail,
                               HttpSession session, HttpServletResponse response) {
        String email = (String)session.getAttribute("email");
        if(email == null){
            try {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인이 필요한 서비스입니다.'); history.go(-1);</script>");
                out.flush();
            }catch (Exception e) {
                System.out.println("예외상황 발생: " + e);
                return "index";
            }
        }

        //접속한 url 만들기
        String url = (String)session.getAttribute("url");   // 지금은 필요없음
        String uri = (String)session.getAttribute("uri");
        String query = (String)session.getAttribute("query");
        uri = uri.substring(1);
        String path = uri;
        if(query != null) {
            path = uri + "?" + query;
        }

        if(postId != null) {
            if(email.equals(pemail)) {
                postService.updatePost(post);
            }else{
                return "redirect:"+ path;
            }
        }else if(mpId != null){
            if(email.equals(mpemail)) {
                mainPostService.updateMainPost(mainPost);
            }else{
                return "redirect:"+ path;
            }
        }

        return "redirect:"+ path;
    }

    @PostMapping("postcomment.do")
    public String postcommentDo(Fcomment fcomment, Scomment scomment, Long fcpostId, Long scfcId,
                                 HttpSession session,HttpServletResponse response) {

        String email = (String)session.getAttribute("email");
        if(email == null){
            try {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인이 필요한 서비스입니다.'); history.go(-1);</script>");
                out.flush();
            }catch (Exception e) {
                System.out.println("예외상황 발생: " + e);
                return "index";
            }
        }

        //접속한 url 만들기
        String url = (String)session.getAttribute("url");   // 지금은 필요없음
        String uri = (String)session.getAttribute("uri");
        String query = (String)session.getAttribute("query");
        uri = uri.substring(1);
        String path = uri;
        if(query != null) {
            path = uri + "?" + query;
        }

        if(fcpostId != null){
            fcomment.setFcemail(email);
            commentService.insertFcomment(fcomment);

        }else if(scfcId != null) {
            scomment.setScemail(email);
            commentService.insertScomment(scomment);

        }else{
            return "redirect:" + path;
        }

        return "redirect:" + path;
    }

    @GetMapping("/commentdel.do")
    public String commentDel(Long fcId, String fcemail, Long scId, String scemail,
                             HttpSession session, HttpServletResponse response) {

        String email = (String)session.getAttribute("email");
        if(email == null){
            try {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('로그인이 필요한 서비스입니다.'); history.go(-1);</script>");
                out.flush();
            }catch (Exception e) {
                System.out.println("예외상황 발생: " + e);
                return "index";
            }
        }

        //접속한 url 만들기
        String url = (String)session.getAttribute("url");   // 지금은 필요없음
        String uri = (String)session.getAttribute("uri");
        String query = (String)session.getAttribute("query");
        uri = uri.substring(1);
        String path = uri;
        if(query != null) {
            path = uri + "?" + query;
        }

        if(fcId != null) {
            if (email.equals(fcemail)) {
                commentService.deleteFcomment(fcId);
            }
        }else if(scId != null) {
            if (email.equals(scemail)) {
                commentService.deleteScomment(scId);
            }
        }else{
            return "redirect:" + path;
        }

        return "redirect:" + path;
    }

    @GetMapping("price.do")
    public String price(Model model, HttpSession session, HttpServletRequest request){
        // 세션 url 만들기
        String currentUri = request.getRequestURI().toString();
        String queryString = request.getQueryString();
        session.setAttribute("uri", currentUri);
        session.setAttribute("query", queryString);

        List<Gu> guLists = priceService.getGunameS();
        model.addAttribute("guLists", guLists);
        String msg = "안녕하세요";
        model.addAttribute("msg", msg);
        return "infolist";
    }
    @GetMapping("price2.do")
    public String price2(Model model, String guid, String guname, int cp, int ps){
        if(guname != null){
            guid = String.valueOf(priceService.getGuId(guname));
        }
        long totalCount = priceService.getTotalCountS(guid);
        Paginator2 paginator = new Paginator2(cp, ps, totalCount);
        model.addAttribute("paginator", paginator);
        HashMap<String, Object> input = new HashMap<String, Object>();
        input.put("guid", guid);
        input.put("paginator", paginator);

        List<Gu> guLists = priceService.getGunameS();
        model.addAttribute("guLists", guLists);
        model.addAttribute("guid", guid);
        model.addAttribute("ps", ps);
        List<Info> infoLists = priceService.getInfoListS(guid);
        model.addAttribute("infoLists", infoLists);
        List<Info> guidSelectLists = priceService.guidSelectListS(input);
        model.addAttribute("guidSelectLists", guidSelectLists);
        return "infolist";
    }
    @GetMapping("price3.do")
    public String price3(Model model, String guid, String dong, int cp, int ps){
        HashMap<String, String> guidDong = new HashMap<String, String>();
        guidDong.put("guid", guid);
        guidDong.put("dong", dong);
        long totalCount = priceService.getTotalCountDongS(guidDong);
        Paginator2 paginator = new Paginator2(cp, ps, totalCount);
        model.addAttribute("paginator", paginator);

        List<Gu> guLists = priceService.getGunameS();
        model.addAttribute("guLists", guLists);
        model.addAttribute("guid", guid);
        List<Info> infoLists = priceService.getInfoListS(guid);
        model.addAttribute("infoLists", infoLists);
        model.addAttribute("dong", dong);
        HashMap<String, Object> input = new HashMap<String, Object>();
        input.put("guid", guid);
        input.put("dong", dong);
        input.put("paginator", paginator);

        List<Info> aptLists = priceService.getAptListS(input);
        model.addAttribute("aptLists", aptLists);
        List<Info> dongSelectLists = priceService.dongSelectListS(input);
        model.addAttribute("dongSelectLists", dongSelectLists);
        return "infolist";
    }
    @GetMapping("price4.do")
    public String price4(Model model, String guid, String dong, String apt, int cp, int ps){
        List<Gu> guLists = priceService.getGunameS();
        model.addAttribute("guLists", guLists);
        model.addAttribute("guid", guid);
        List<Info> infoLists = priceService.getInfoListS(guid);
        model.addAttribute("infoLists", infoLists);
        model.addAttribute("dong", dong);
        HashMap<String, Object> input = new HashMap<String, Object>();
        input.put("guid", guid);
        input.put("dong", dong);
        List<Info> aptLists = priceService.getAptListS(input);
        model.addAttribute("aptLists", aptLists);
        model.addAttribute("apt", apt);
        input.put("apt", apt);

        long totalCount = priceService.getTotalCountAptS(input);
        Paginator2 paginator = new Paginator2(cp, ps, totalCount);
        model.addAttribute("paginator", paginator);
        List<Info> eareaLists = priceService.getEareaListS(input);
        model.addAttribute("eareaLists", eareaLists);
        input.put("paginator", paginator);
        List<Info> aptSelectLists = priceService.aptSelectListS(input);
        model.addAttribute("aptSelectLists", aptSelectLists);
        return "infolist";
    }
    @GetMapping("price5.do")
    public String price5(Model model, String guid, String dong, String apt, String earea, int cp, int ps){
        List<Gu> guLists = priceService.getGunameS();
        model.addAttribute("guLists", guLists);
        model.addAttribute("guid", guid);
        List<Info> infoLists = priceService.getInfoListS(guid);
        model.addAttribute("infoLists", infoLists);
        model.addAttribute("dong", dong);
        HashMap<String, Object> input = new HashMap<String, Object>();
        input.put("guid", guid);
        input.put("dong", dong);
        List<Info> aptLists = priceService.getAptListS(input);
        model.addAttribute("aptLists", aptLists);
        model.addAttribute("apt", apt);
        input.put("apt", apt);
        List<Info> eareaLists = priceService.getEareaListS(input);
        model.addAttribute("eareaLists", eareaLists);
        model.addAttribute("earea", earea);
        input.put("earea", earea);

        long totalCount = priceService.getTotalCountEareaS(input);
        Paginator2 paginator = new Paginator2(cp, ps, totalCount);
        model.addAttribute("paginator", paginator);
        input.put("paginator", paginator);
        List<Info> priceLists = priceService.getPriceListS(input);
        model.addAttribute("priceLists", priceLists);
        return "infolist";
    }
    @GetMapping("price6.do")
    public String searchprice(Model model, String searchBox, String searchText, int cp, int ps){
        List<Gu> guLists = priceService.getGunameS();
        model.addAttribute("guLists", guLists);
        HashMap<String, Object> search = new HashMap<String, Object>();
        search.put("searchBox", searchBox);
        search.put("searchText", searchText);

        long totalCount = priceService.getTotalCountSearchS(search);
        Paginator2 paginator = new Paginator2(cp, ps, totalCount);
        model.addAttribute("paginator", paginator);
        search.put("paginator", paginator);
        List<Info> searchLists = priceService.searchListS(search);
        model.addAttribute("searchLists", searchLists);
        model.addAttribute("searchBox", searchBox);
        model.addAttribute("searchText", searchText);
        return "infolist";
    }
    @PostMapping("price.do")
    public @ResponseBody List<String> getGunameList(String keyword, String searchBox){
        if(searchBox.equals("APT")) {
            List<String> list = priceService.getListByKeywordS(keyword);
            return list;
        }else if(searchBox.equals("DONG")) {
            List<String> list = priceService.getDongListByKeywordS(keyword);
            return list;
        }else {
            List<String> list = priceService.getGunameListByKeywordS(keyword);
            return list;
        }
    }
}