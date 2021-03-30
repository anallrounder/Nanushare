<!-- 혜선_ 물품기부 메인페이지_사용예정 뷰 페이지 _ 수정필요함, 테스트중 03.18-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!doctype html>
<html lang="en">

<head>
    <!-- meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Charity Cause Detail</title>

    <!-- CSS -->
    <link rel="stylesheet" href="/resources/charity/css/bootstrap.css">
    <link rel="stylesheet" href="/resources/charity/css/fontawesome-all.css">
    <link rel="stylesheet" href="/resources/charity/css/flaticon.css">
    <link rel="stylesheet" href="/resources/charity/css/slick-slider.css">
    <link rel="stylesheet" href="/resources/charity/css/fancybox.css">
    <link href="/resources/charity/css/jplayer.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/charity/css/style.css">
    <link rel="stylesheet" href="/resources/charity/css/color.css">
    <link rel="stylesheet" href="/resources/charity/css/responsive.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
	
	<!-- new korean font from google -->
	<!-- NotoSansKR, Gothic A1 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
	
	<!-- FONT AWSOME -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
    <!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
    <!-- Header -->

    <!-- Banner -->
    <div class="charity-subheader">
        <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>물품 나누기</h1>
                    <p>Product Donation Guidelines and Application</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner -->

    <!-- Content -->
    <div class="charity-main-content">

        <!-- Main Section -->
        <div class="charity-main-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <div class="charity-rich-editor charity-cause-detail">
                            <figure class="charity-cause-thumb"><img src="/resources/extra-images/cause-detail-img.png" alt=""></figure>
                            <h3>물품 나누기 소개 및 신청 방법 안내</h3>
                            <ul class="charity-cause-options">
                                <li>
                                    <i class="fa fa-clock"></i>
                                    <h6>이번 달:</h6>
                                    <span>19 days left</span>
                                </li>
                                <li>
                                    <i class="fa fa-heart"></i>
                                    <h6>나눔 횟수:</h6>
                                    <span>23</span>
                                </li>
                              <!--   <li>
                                    <i class="fa fa-map-marker-alt"></i>
                                    <h6>Location:</h6>
                                    <span>Cairo,Africa</span>
                                </li> -->
                                <li></li>
                            </ul>
                           
                            <p>나누셰어의 물품 나눔에 관심을 갖고 찾아와 주셔서 감사합니다.</p>
                            <p>나누셰어는 금전적 기부를 넘어 물품 나누기 프로젝트를 통해 지역 사회를 지원합니다.
							또한 후원금을 통해 파트너, 등록 및 미등록 자선 단체, 비영리 단체 및 지역 사회 단체에 기부금을 제공합니다.</p>
							<p>후원 회원 관리를 위해 로그인 한 회원만 물품 기부 신청을 하실 수 있는 점 양해부탁드립니다. 
							모두 어려운 코로나 상황 속에서도 지속적인 여러분의 참여에 감사드립니다. </p>
							<p>회원가입은 홈페이지 오른쪽 상단 '회원가입' 버튼을 통해서 하실 수 있으며, 
							이미 가입하신 회원님은 물품 나눔을 위해  오른쪽 상단 '로그인' 버튼을 통해 로그인 후 이용해 주시면 감사하겠습니다.</p>
							
                            <div class="charity-cause-donate">
                                <div class="skillst charity-item-text">
                                    <h6>물품 신청을 하시기 전에 아래 정보를 꼭 확인해주세요!</h6>
                                    <!-- <h6 class="skillst-right">Goal: <span>$5000</span></h6> -->
                                    <div data-width='90' data-target='95' class="charity-cause-progressbar"></div>
                                </div>
                                <a href="/donation/item/form" class="charity-plan-btn">신청서 작성하기<i class="fa fa-heart"></i></a>
                            </div>
                          <!--   <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed iaculis purus nulla, at rhoncus elit non. Ut luct us libero at laore ncus. Praesent fermentum lacus at nulla hendrerit facilisis. Ut ips us, mollis non sollicitu din quis, lacinia a tellus.</p>
                            <p>Phasellus lobortis mattis dolor ac laoreet. Pellentesque feugiat scelerisque libero, et convallis cidunt at. Aen ean inn luctus, felis in, luctus elit. Aenean fringilla consectetur posuere.</p>
                            <blockquote>Curabitur lacus dui, convallis quis arcu vel, sagittis vulputate elit. Nullam ex libero, imp rdiet  lib ndit ac, tempor ac magna. In finibus libero vitae ex tincidunt pharetr.</blockquote>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed iaculis purus nulla, at rhoncus elit non. Ut luct us libero at laore ncus. Praesent fermentum lacus at nulla hendrerit facilisis. Ut ips us, mollis non sollicitu din quis, lacinia a tellus.</p> -->
                        </div>
                        
                        <!-- 물품 나눔 항목 소개 -->
                        <!-- responsive.css -> .charity-team-timeline { width: 100%; } 반응형 지워야할지 수정해야할지... -->
                         <!--// company-timeline \\--><!-- charity-team-timeline-text -->
	                        <div class="charity-team-timeline">
	                          <div class="widget_title"><h2>이 품목들에 대해 나눔이 필요해요!</h2></div>
	                           <h6><b>신청 가능 물품 종류: </b> <span> 마스크 | 기저귀 | 생리대 | 문구류 | 손세정제 </span></h6><br>
	                          <ul>
	                             <li>
	                                <div class="charity-image">
	                                   <i class="icon-donation"></i><!-- fas fa-head-side-mask -->
	                                   <!-- <div>Icons made by <a href="https://www.flaticon.com/authors/srip" title="srip">srip</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div> -->
	                                   <span></span>
	                                </div>
	                                <div class="charity-item-text">
	                                   <h6>마스크: </h6>
	                                   <p>감기인 듯 스쳐 지나갈 술 알았던 코로나바이러스는 우리의 일상을 참 많이도 바꿔 버렸습니다.
										사회적 거리두기와 마스크 착용이 의무화되면서 일상적이던 이웃과의 만남과 소통은 자연스레 멀어지고 있습니다.</p>
	                                </div>
	                             </li>
	                             <li>
	                                <div class="charity-image">
	                                   <i class="icon-donation"></i>
	                                   <span></span>
	                                </div>
	                                <div class="charity-item-text">
	                                   <h6>기저귀: </h6>
	                                   <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque maximus felis ut ullamc entum. Ut imperdiet lobortis ex.</p>
	                                </div>
	                             </li>
	                             <li>
	                                <div class="charity-image">
	                                   <i class="icon-heart"></i><!-- icon-books-stack-of-three -->
	                                   <span></span>
	                                </div>
	                                <div class="charity-item-text">
	                                   <h6>생리대: 생리가 찾아올 때마다 홀로 고민하는 아이들이 있습니다.</h6>
	                                   <p>더 이상 생리대 때문에 걱정하는 여학생들이 없었으면 좋겠습니다. 
	                                	 누군가에게는 어느 마트에서나 손쉽게 구매할 수 있는 아이템이지만 조금이라도 더 싸게 파는 곳을 찾아 헤매는 여정을 거쳐야 합니다. 하지만 이마저도 부담이 됩니다.
	                                	 매달 생리를 맞이하는 여성 청소년이 고민 없이 행복하게 청소년기를 보낼 수 있도록, 몸의 변화에 대해 긍정적으로 느끼고, 이로써 그들의 자존감을 지킬 수 있도록 여러분의 작은 관심으로 이를 실현할 수 있습니다.</p>
	                                </div>
	                             </li>
	                             <li>
	                                <div class="charity-image">
	                                   <i class="icon-heart"></i>
	                                   <span></span>
	                                </div>
	                                <div class="charity-item-text">
	                                   <h6>문구류: 아이들에게는 희망을 선물해 주세요.</h6>
	                                   <p>온라인 수업으로 집에서 홀로 생활하는 아이들! 저소득 가정의 아이들은 보호자 없이  하루를 보냅니다. 
	                                   그리고 어떻게 시간을 보내야 할지 몰라 게임과 스마트폰으로 시간을 보내고 있습니다. 
	                                   고립된 생활로 우울감과 무력감으로 생활하는 저소득가정이 건강하고 행복한 세상에서 가장 아름다운 “오늘”을 만들 수 있도록 응원해 주세요.</p>
	                                </div>
	                             </li>
	                             <li>
	                                <div class="charity-image">
	                                   <i class="icon-heart"></i>
	                                   <span></span>
	                                </div>
	                                <div class="charity-item-text">
	                                   <h6>손 세정제: </h6>
	                                   <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque maximus felis ut ullamc entum. Ut imperdiet lobortis ex.</p>
	                                </div>
	                             </li>
	                          </ul>
	                        </div>
	                        <!--// company-timeline \\-->
                
                        
                       <!--  지침: 확인 사항 리스트 -->
                        <div class="widget_title mt-5"><h2>물품 신청 전 반드시 확인해 주세요!</h2></div>
                        <div class="charity-campaign-content">
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="charity-item-text"><!-- charity-list-style-one -->
                                       	<li class="mt-3">다음 내용은 2021년 3월 17일 기준으로 작성되었습니다.</li>
                                        <li class="mt-3">마스크, 기저귀, 생리대, 문구류, 손세정제 품목에 한해서 물품 나눔이 가능합니다.</li>
                                        <li class="mt-3">제출된 신청서를 검토한 후 승인된 건에 한하여 나눔이 진행됩니다.</li>
                                        <li class="mt-3">제휴 택배사 외 다른 업체를 통해 발송할 시 입출고가 원활하지 않을 수 있습니다.</li>
                                        <li class="mt-3">포장이 심하게 훼손되거나 그 외 정상적인 사용이 불가한 제품은 추후 반려될 수 있습니다. </li>
                                    </ul>
                                </div>
                                <div class="col-md-5">
                                    <img src="/resources/extra-images/Campaign-img1.png" alt="" class="charity-campaing-image">
                                </div>
                            </div>
                        </div>
                        
                        <div class="widget_title"><h2>물품 나눔 신청 후 절차</h2></div>
                        <div class="charity-progress-wrap">
                            <div class="row">
                                <div class="charity-item-text col-md-12 mb-2">
                                    <h6>신청서가 승인되는 데 얼마나 걸립니까?</h6>
 									<p>매월 제품 기부 신청서를 검토합니다. 또한 귀하의 요청을 처리하고 배송을 보장하려면 이벤트 날짜로부터 최소 3 주가 필요합니다.</p>
									<h6 class="mt-3">신청서가 승인되면 다음 단계는 무엇입니까?</h6>
									<p class="mb-4">신청이 성공하면 '나누셰어'팀에서 환영 이메일을 받게됩니다. 그런 다음 제공되는 제품, 배송 정보 및 기타 특별 고려 사항을 확인하여 기부 요청을 완료합니다.</p>
                                </div>
                                <!-- <div class="col-md-7">
                                    <div class="charity-cause-skillbar">
                                        <div class="skillst">
                                            <h5>Photoshop</h5>
                                            <div data-width='70' data-target='95' class="charity-cause-progressbar"></div>
                                        </div>
                                        <div class="skillst">
                                            <h5>Wordpress</h5>
                                            <div data-width='50' data-target='95' class="charity-cause-progressbar"></div>
                                        </div>
                                        <div class="skillst">
                                            <h5>Designing</h5>
                                            <div data-width='65' data-target='95' class="charity-cause-progressbar"></div>
                                        </div>
                                    </div>
                                </div> -->
                                
                            </div>
                           
                        </div>
                        
                         <div class="charity-cause-donate">
                                <div class="skillst">
                                    <div data-width='90' data-target='95' class="charity-cause-progressbar"></div>
                                </div>
                                <div class="charity-item-text">
                                <h6>후원자 여러분~!</h6>
								<p class="mb-5">일상의 기본인 생필품이 부족하여 어렵게 생활하고 있는 이웃을 위해 따뜻한 관심과 마음을 표현해주세요 :)</p>
								</div>
                                <a href="/donation/item/form" class="charity-plan-btn">신청서 작성하기<i class="fa fa-heart"></i></a>
                         </div>
                    </div>
                    
                    
                    
                    
                    <aside class="col-md-3">
                        
                        <!-- Widget Search -->
                        <div class="widget widget_search">
                            <div class="widget_title"><h2>Search Here</h2></div>
                            <form>
                                <input type="text" placeholder="Search Here">
                                <input type="submit" value="">
                                <i class="fa fa-search"></i>
                            </form>
                        </div>
                        <!-- Widget Search -->
                        <!--// Widget Caendar \\-->
                        <div class="widget widget_calendar">
                            <div class="widget_title"><h2>Event Calender</h2></div>
                            <table>
                                <caption>January 2017</caption>
                                <thead>
                                    <tr>
                                        <th title="Monday">M</th>
                                        <th title="Tuesday">T</th>
                                        <th title="Wednesday">W</th>
                                        <th title="Thursday">T</th>
                                        <th title="Friday">F</th>
                                        <th title="Saturday">S</th>
                                        <th title="Sunday">S</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="5"></td><td id="today">1</td><td>2</td>
                                    </tr>
                                    <tr>
                                        <td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td>
                                    </tr>
                                    <tr>
                                        <td>10</td><td>11</td><td>12</td><td>13</td><td>14</td><td>15</td><td>16</td>
                                    </tr>
                                    <tr>
                                        <td>17</td><td>18</td><td>19</td><td>20</td><td>21</td><td>22</td><td>23</td>
                                    </tr>
                                    <tr>
                                        <td>24</td><td>25</td><td>26</td><td>27</td><td>28</td><td>29</td><td>30</td>
                                    </tr>
                                    <tr>
                                        <td>31</td><td colspan="6"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!--// Widget Caendar \\-->
                        <!-- Widget Archive -->
                        <div class="widget widget_archive">
                            <div class="widget_title"><h2>Calender Archives</h2></div>
                            <ul>
                                <li><a href="404.html">13 August 2017</a></li>
                                <li><a href="404.html">28 September 2017</a></li>
                                <li><a href="404.html">19 May 2017</a></li>
                                <li><a href="404.html">03 March 2017</a></li>
                                <li><a href="404.html">28 February 2017</a></li>
                            </ul>
                        </div>
                        <!-- Widget Archive -->
                        <!-- Widget Event -->
                        <div class="widget widget_events">
                            <div class="widget_title"><h2>Upcoming Events</h2></div>
                            <ul>
                                <li>
                                    <time datetime="2008-02-14 20:00">22 Aug</time>
                                    <div class="charity-events">
                                       <h6><a href="event-detail.html">Fusce fibus purus cos vulputate</a></h6>
                                       <a href="event-detail.html"><i class="fa fa-map-marker-alt"></i> 1403 Blackwell Street 9976</a>
                                    </div>
                                </li>
                                <li>
                                    <time datetime="2008-02-14 20:00">13 Sep</time>
                                    <div class="charity-events">
                                       <h6><a href="event-detail.html">Fusce fibus purus cos vulputate</a></h6>
                                       <a href="event-detail.html"><i class="fa fa-map-marker-alt"></i> 1403 Blackwell Street 9976</a>
                                    </div>
                                </li>
                                <li>
                                    <time datetime="2008-02-14 20:00">07 Dec</time>
                                    <div class="charity-events">
                                       <h6><a href="event-detail.html">Fusce fibus purus cos vulputate</a></h6>
                                       <a href="event-detail.html"><i class="fa fa-map-marker-alt"></i> 1403 Blackwell Street 9976</a>
                                    </div>
                                </li>
                             </ul>
                        </div>
                        <!-- Widget Event -->
                        <!-- Widget Gallery -->
                        <div class="widget widget_gallery">
                            <div class="widget_title"> <h2>Our Gallery</h2> </div>
                            <ul>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-1.jpg"><img src="/resources/extra-images/widget-gallery-1.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-2.jpg"><img src="/resources/extra-images/widget-gallery-2.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-3.jpg"><img src="/resources/extra-images/widget-gallery-3.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-4.jpg"><img src="/resources/extra-images/widget-gallery-4.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-5.jpg"><img src="/resources/extra-images/widget-gallery-5.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-6.jpg"><img src="/resources/extra-images/widget-gallery-6.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-7.jpg"><img src="/resources/extra-images/widget-gallery-7.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-8.jpg"><img src="/resources/extra-images/widget-gallery-8.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                                <li><a data-fancybox="gallery" href="extra-images/widget-gallery-6.jpg"><img src="/resources/extra-images/widget-gallery-6.jpg" alt=""> <i class="fa fa-plus"></i> </a></li>
                            </ul>
                        </div>
                        <!-- Widget Gallery -->

                    </aside>
                </div>
            </div>
        </div>
        <!-- Main Section -->

    </div>
    <!-- Content -->

    <!-- Footer -->
    <%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
    <!-- Footer -->

    <!-- Search Modal -->
    <div class="modal fade searchmodal" id="searchModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <a href="#" class="charity-close-btn" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a>
                    <form>
                        <input type="text" value="Type Your Keyword" onblur="if(this.value == '') { this.value ='Type Your Keyword'; }" onfocus="if(this.value =='Type Your Keyword') { this.value = ''; }">
                        <input type="submit" value="">
                        <i class="fa fa-search"></i>
                    </form>
                </div>
                
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="/resources/script/jquery.js"></script>
    <script src="/resources/script/popper.min.js"></script>
    <script src="/resources/script/bootstrap.min.js"></script>
    <script src="/resources/script/slick.slider.min.js"></script>
    <script src="/resources/script/progressbar.js"></script>
    <script src="/resources/script/fancybox.min.js"></script>
    <script src="/resources/script/jquery.countdown.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="/resources/script/jquery.jplayer.js"></script>
    <script src="/resources/script/jplayer.playlist.js"></script>
    <script src="/resources/script/functions.js"></script>
</body>

</html>