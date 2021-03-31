jQuery(document).ready(function($) {  //https://programmer93.tistory.com/34

    // Banner Slider Function
    $('.charity-banner').slick({
      dots: true, //스크롤바 아래 점으로 페이지네이션 여부
      infinite: true, //무한반복 옵션
      prevArrow: "<span class='slick-arrow-left'><i class='fa fa-angle-left'></i></span>", //이전화살표 모양 설정
      nextArrow: "<span class='slick-arrow-right'><i class='fa fa-angle-right'></i></span>", //다음화살표 모양 설정
      speed: 1000, //다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간
      autoplay: true, //자동 스크롤 사용 여부 
      autoplaySpeed: 2000, //자동 스크롤시 다음으로 넘어가는데 걸리는 시간
      slidesToShow: 1, //한 화면에 보여질 컨텐츠 개수
      slidesToScroll: 1, //스크롤 한번에 움직일 컨텐츠 개수
      dotClass: "slick-dots", //아래 나오는 페이지네이션(점) css class 지정
      
      responsive: [ //반응형 웹 구현
        {
          	breakpoint: 1024, //화면 사이즈 1024px
          	settings: { //위에 옵션이 디폴트, 여기에 추가하면 추가되는걸로 변경
            slidesToShow: 1,
            slidesToScroll: 1,
            infinite: true,
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
      ]
    });
    // Partner Slider Function
    $('.charity-partner-slider').slick({
      dots: false,
      infinite: true,
      prevArrow: "<span class='slick-arrow-left'><i class='fa fa-angle-left'></i></span>",
      nextArrow: "<span class='slick-arrow-right'><i class='fa fa-angle-right'></i></span>",
      speed: 1000,
      autoplay: true,
      autoplaySpeed: 2000,
      slidesToShow: 4,
      slidesToScroll: 1,
      responsive: [
        {
          breakpoint: 1024,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1,
            infinite: true,
          }
        },
        {
          breakpoint: 600,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 1
          }
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
      ]
    });

    //***************************
    // Click to Top Button
    //***************************
    jQuery('.back-top').on("click", function() {
        jQuery('html, body').animate({
            scrollTop: 0
        }, 800);
        return false;
    });
    
        // 나눔함 안내 메뉴 탭 누르면 map위치로 스크롤(main 탭)
     jQuery('.mainMap-top').on("click", function() {
         
        jQuery('html, body').animate({
            scrollTop: $('.charity-event-map').offset().top
        }, 600);
        return false;
    });
    
     // 나눔함 안내 메뉴 탭 누르면 map위치로 스크롤(footer 나눔함 링크)
     jQuery('.footerMap').on("click", function() {
         
        jQuery('html, body').animate({
            scrollTop: $('.charity-event-map').offset().top
        }, 600);
        return false;
    });
    
    
    
    //***************************
    // Countdown Function
    //***************************
      var austDay = new Date();
      austDay = new Date(austDay.getFullYear() + 2, 1 - 1, -308);
      jQuery('#charity-countdown').countdown({
          until: austDay
      });
      jQuery('#year').text(austDay.getFullYear());
    //***************************
    // CartToggle Function
    //***************************
    jQuery('.charity-header-options i.fa-opencart').on("click", function(){
          jQuery('.charity-cart-box').fadeToggle('slow');
          return false;
      });
    jQuery('html').on("click", function() { jQuery(".charity-cart-box").fadeOut(); });

    //***************************
    // Jplayer Function
    //***************************
    var myPlayer = new jPlayerPlaylist({
        jPlayer: "#jquery_jplayer_16",
        cssSelectorAncestor: "#jp_container_16"
    }, [
        //php writePlaylist('Y',' (!!duration!!)'); 
        //php writePlaylist('Y',"<span style='color:#828282'> (!!duration!!)</span>");
        {
            title: "Dj kozak-promo mix soundwave <span>05:30</span>",
            mp3: "http://www.jplayer.org/audio/mp3/Miaow-03-Lentement.mp3",
            oga: "http://www.jplayer.org/audio/ogg/Miaow-02-Hidden.ogg",
            album_buy_mp3: "sdas",
            url: "sdas",
            layrics: "sdas",
        }, {
            title: "Shot me Down (feat. Skylar Grey) <span>04:00</span>",
            mp3: "http://www.jplayer.org/audio/mp3/Miaow-03-Lentement.mp3",
            oga: "http://www.jplayer.org/audio/ogg/Miaow-02-Hidden.ogg",
            album_buy_mp3: "sdas",
            url: "sdas",
            layrics: "sdas",
        }, {
            title: "I'll Keep Loving you (feat. Birdy) <span>03:00</span>",
            mp3: "http://www.jplayer.org/audio/mp3/Miaow-03-Lentement.mp3",
            oga: "http://www.jplayer.org/audio/ogg/Miaow-02-Hidden.ogg",
            album_buy_mp3: "sdas",
            url: "sdas",
            layrics: "sdas",
        }, {
            title: "The Hum (Short Edit) <span>04:30</span>",
            mp3: "http://www.jplayer.org/audio/mp3/Miaow-03-Lentement.mp3",
            oga: "http://www.jplayer.org/audio/ogg/Miaow-02-Hidden.ogg",
            album_buy_mp3: "sdas",
            url: "sdas",
            layrics: "sdas",
        },
    ],
     {
       
        playlistOptions: { loopOnPrevious: true, },
        loop: true,
        swfPath: "images/jplayer.swf",
        supplied: "mp3, oga",
        wmode: "window",
        useStateClassSkin: true,
        autoBlur: false,
        preload: 'auto',
        preload: 'metadata',
        smoothPlayBar: true,
        audioFullScreen: true,
        keyEnabled: true,
    });


});

// Multi-Toggle Navigation
jQuery(function ($) {
    'use strict';

    $('body').addClass('js');
    var $menu = $('#menu'),
            $menulink = $('.menu-link');
    $(".charity-navigation li").each(function () {
        var each_li = $(this);
        if (each_li.find('ul').length > 0) {
            each_li.append("<span class='has-subnav'><i class='fa fa-angle-down'></i></span>");
        }
    });
    var $menuTrigger = $('.has-subnav');

    $menulink.on("click", function (e) {
        e.preventDefault();
        $menulink.toggleClass('active');
        $menu.toggleClass('active');
    });

    $menuTrigger.on("click", function (e) {
        e.preventDefault();
        var $this = $(this);
        $this.parent('li').find('ul').toggleClass('active');
    });

});
jQuery(window).resize(function(){
    'use strict';
    var $ = jQuery;
    var $menu = $('#menu'),
    $menulink = $('.menu-link');
    $menu.removeClass('active');
    $menulink.removeClass('active');
});

jQuery('.charity-cause-progressbar').progressBar({
    shadow : false,
    percentage : true,
    animation : true,
});

// Counter
var a = 0;
$(document).ready(function() {

  var oTop = $('#counter').offset().top - window.innerHeight;
  if (a == 0 && $(window).scrollTop() > oTop) {
    $('.counter-value').each(function() {
      var $this = $(this),
        countTo = $this.attr('data-count');
      $({
        countNum: $this.text()
      }).animate({
          countNum: countTo
        },

        {

          duration: 3000,
          easing: 'swing',
          step: function() {
            $this.text(Math.floor(this.countNum));
          },
          complete: function() {
            $this.text(this.countNum);
            //alert('finished');
          }

        });
    });
    a = 1;
  }

});

// When the window has finished loading create our google map below
/*google.maps.event.addDomListener(window, 'load', init);

function init() {
    // Basic options for a simple Google Map
    // For more options see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
    var mapOptions = {
        // How zoomed in you want the map to start at (always required)
        zoom: 11,

        // The latitude and longitude to center the map (always required)
        center: new google.maps.LatLng(40.6700, -73.9400), // New York

        // How you would like to style the map. 
        // This is where you would paste any style found on Snazzy Maps.
        styles: [{"featureType":"administrative","elementType":"labels.text.fill","stylers":[{"color":"#444444"}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#f2f2f2"}]},{"featureType":"poi","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"all","stylers":[{"saturation":-100},{"lightness":45}]},{"featureType":"road.highway","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"road.arterial","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"all","stylers":[{"color":"#46bcec"},{"visibility":"on"}]}]
    };

    // Get the HTML DOM element that will contain your map 
    // We are using a div with id="map" seen below in the <body>
    var mapElement = document.getElementById('map');

    // Create the Google Map using our element and options defined above
    var map = new google.maps.Map(mapElement, mapOptions);

    // Let's also add a marker while we're at it
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(40.6700, -73.9400),
        map: map,
        title: 'Snazzy!'
    });
}*/