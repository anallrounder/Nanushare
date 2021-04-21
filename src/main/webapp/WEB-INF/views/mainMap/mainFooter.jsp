<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="ko">

<head>

    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Main Footer</title>

</head>

<body class="home">
    <!-- Footer -->
    <footer id="charity-footer" class="charity-footer-one">

        <!-- Footer Newslatter -->
        <div class="charity-newslatter">
            <div class="container">
                <div class="row">
                    <aside class="col-md-6">
                        <h2>고액 기부 & 정기 기부 문의</h2>
                        <h6>고액으로 기부하시거나 정기 기부를 문의하실 분은<br> 나누셰어 공식 번호로 연락 또는 메일을 남겨주세요:D</h6>
                    </aside>
                    <aside class="col-md-6">
                        <form>
                            <input type="text" placeholder="기부 관련 메일을 보내드립니다">
                            <label>
                                <input type="submit" value="e-mail 전송">
                                <i class="far fa-paper-plane"></i>
                            </label>
                        </form>
                    </aside>
                </div>
            </div>
        </div>
        <!-- Footer Newslatter -->
        
        <!-- Footer Widget -->
        <div class="charity-footer-widget">
            <div class="container">
                <div class="row">
                    <aside class="col-md-4 widget widget_usefull_links">
                    
                        <div class="charity-footer-title"> <h2>Quick Links</h2> 
                        </div>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/menu/about">나누셰어란</a></li>
                            <li class="footerMap"><a href="#">나눔함 안내</a></li>
                            <li><a href="${pageContext.request.contextPath}/donation/item/main">물품 나누기</a></li>
                            <li><a href="${pageContext.request.contextPath}/donation/money/main">돈기부여하기</a></li>
                            <li><a href="${pageContext.request.contextPath}/board/shows/list">나눔인증</a></li>
                            <li><a href="${pageContext.request.contextPath}/my/event/check">이벤트</a></li>
                            <li><a href="${pageContext.request.contextPath}/board/notice">공지사항</a></li>
                            <li><a href="${pageContext.request.contextPath}/board/faq">FAQ</a></li>
                            <li><a href="${pageContext.request.contextPath}/board/qna">문의하기</a></li>
                        </ul>
                    </aside>
                    <aside class="col-md-4 widget widget_recent_news">
                        <div class="charity-footer-title"> <h2>Recent News</h2> </div>
                        <ul>
                            <li>
                                <figure><a href="#"><img src="/resources/nanulogo.png" alt=""></a></figure>
                                <div class="widget_recent_news_text">
                                    <h6><a href="https://www.ytn.co.kr/_ln/0103_202103202243071761">점점 줄어드는 현금 기부...<br>'QR 기부'까지 등장</a></h6>
                                    <span>20 March, 2021</span>
                                </div>
                            </li>
                            <li>
                                <figure><a href="#"><img src="/resources/nanulogo.png" alt=""></a></figure>
                                <div class="widget_recent_news_text">
                                    <h6><a href="https://www.donga.com/news/Economy/article/all/20210317/105918758/1">기업이익 사회에 환원하는<br> 기부천사</a></h6>
                                    <span>18 March, 2021</span>
                                </div>
                            </li>
                        </ul>
                    </aside>
                    <aside class="col-md-4 widget widget_gallery">
                        <div class="charity-footer-title"> <h2>Our Share</h2> </div>
                        <ul>
                            <li><a data-fancybox="gallery" href="/resources/picture/sb.png"><img src="/resources/picture/sb.png" alt=""> <i class="fa fa-plus"></i> </a></li>
                            <li><a data-fancybox="gallery" href="/resources/picture/ji.png"> <img src="/resources/picture/ji.png" alt=""><i class="fa fa-plus"></i> </a></li>
                            <li><a data-fancybox="gallery" href="/resources/picture/hj.png"><img src="/resources/picture/hj.png" alt=""> <i class="fa fa-plus"></i> </a></li>
                            <li><a data-fancybox="gallery" href="/resources/picture/hs.png"><img src="/resources/picture/hs.png" alt=""> <i class="fa fa-plus"></i> </a></li>
                        </ul>
                    </aside>
                </div>
                <!-- CopyRight -->
                <div class="charity-copyright">
                    <a href="#" class="back-top charity-bgcolor"><i class="fa fa-angle-up"></i></a>
                    	<ul>
                    		<li><a href="#">이용약관</a></li>
                    		<li><a href="#">개인정보처리방침</a></li>
                    		<li><a href="#">이메일집단수집거부</a></li>
                    		<li><a href="${pageContext.request.contextPath}/menu/way">오시는길</a></li>
                    		<li><a href="#">문의</a></li>
                    		<li><a href="#">사이트맵</a></li>
                    	
                    	
                    	</ul>
                    <p><i class="fa fa-map-marker-alt"></i> &nbsp;(우)03164 서울특별시 종로구 종로2가 종로69 <i class="fas fa-phone-volume"></i> &nbsp;대표전화 02-722-1481</p> 
                    <span>Â© 2021, All Right Reserved - by NanuShare</span>
                </div>
                <!-- CopyRight -->
            </div>
        </div>
        <!-- Footer Widget -->

    </footer>
    <!-- Footer -->

    <!-- jQuery -->
    <script src="/resources/charity/script/jquery.js"></script>
    <script src="/resources/charity/script/bootstrap.min.js"></script>
   

</html>