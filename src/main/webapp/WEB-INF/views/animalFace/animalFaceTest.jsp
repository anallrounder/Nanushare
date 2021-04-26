<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 헤더 안에 추가  -->
<!-- csrf 관련이슈 해결방법 : jsp에 meta 태그추가(csrf값 얻기위해) -->
<!-- js에서 csrf 토큰, 헤더등록 -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/fontawesome-all.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/slick-slider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/fancybox.css">
<link href="${pageContext.request.contextPath}/resources/charity/css/jplayer.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/color.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/charity/css/responsive.css">

	

 	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	
	<!-- header -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
	<!-- 웹페이지 탭 로고이미지 삽입  -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/nanulogo_ico_convert.ico">
	
	<!-- sweet alert cdn : https://sweetalert.js.org/guides/ -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<head>
    <meta charset="UTF-8">
    <title>동물상 테스트</title>
    



    <style type="text/css">
       

        .file-upload {
            background-color: #ffffff;
            width: 600px;
            margin: 0 auto;
            padding: 20px;
        }

        .file-upload-btn {
            width: 100%;
            margin: 0;
            color: #fff;
            background: #1FB264;
            border: none;
            padding: 10px;
            border-radius: 4px;
            border-bottom: 4px solid #15824B;
            transition: all .2s ease;
            outline: none;
            text-transform: uppercase;
            font-weight: 700;
        }

        .file-upload-btn:hover {
            background: #1AA059;
            color: #ffffff;
            transition: all .2s ease;
            cursor: pointer;
        }

        .file-upload-btn:active {
            border: 0;
            transition: all .2s ease;
        }

        .file-upload-content {
            display: none;
            text-align: center;
        }

        .file-upload-input {
            position: absolute;
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            outline: none;
            opacity: 0;
            cursor: pointer;
        }

        .image-upload-wrap {
            margin-top: 20px;
            border: 4px dashed #fd7e14;
            position: relative;
        }

        .image-dropping,
        .image-upload-wrap:hover {
            background-color: #ffc400;
            border: 4px dashed #fd7e14;
        }

        .image-title-wrap {
            padding: 0 15px 15px 15px;
            color: #222;
        }

        .drag-text {
            text-align: center;
        }

        .drag-text h3 {
            font-weight: 100;
            text-transform: uppercase;
            color: #fd7e14;
            padding: 60px 0;
        }

        .file-upload-image {
            max-height: 200px;
            max-width: 200px;
            margin: auto;
            padding: 20px;
        }

        .remove-image {
            width: 200px;
            margin: 0;
            color: #fff;
            background: #cd4535;
            border: none;
            padding: 10px;
            border-radius: 4px;
            border-bottom: 4px solid #b02818;
            transition: all .2s ease;
            outline: none;
            text-transform: uppercase;
            font-weight: 700;
        }

        .remove-image:hover {
            background: #c13b2a;
            color: #ffffff;
            transition: all .2s ease;
            cursor: pointer;
        }

        .remove-image:active {
            border: 0;
            transition: all .2s ease;
        }
        .animal-label {
	    	width: 20%;
	    	text-align: left;
	    	height: 2rem;
		}
		.animal-explain {
		    font-size: 1.5rem;
		}
		
		
		.deer-animal-title {
		    color: #3ba363;
		}
		
		.cat-animal-title {
		    color: #ff6c0a;
		}
		
		.dog-animal-title {
		    color: #548dd4;
		}
		
		.rabbit-animal-title {
		    color: #e56995;
		}
		
		.bear-animal-title {
		    color: #9b6b43;
		}
		
		.fox-animal-title {
		    color: #31849b;
		}
		
		
		.deer-box {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  width: 100%;
		  background-color: rgba(117, 204, 84, 0.2);
		}
		.deer-bar {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  background-color: rgba(117, 204, 84, 1);
		}
		.dog-box {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  width: 100%;
		  background-color: rgba(27, 175, 234, 0.2);
		}
		.dog-bar {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  background-color: rgba(27, 175, 234, 1);
		}
		.cat-box {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  width: 100%;
		  background-color: rgba(251, 176, 59, 0.2);
		}
		.cat-bar {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  background-color: rgba(251, 176, 59, 1);
		}
		.bear-box {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  width: 100%;
		  background-color: rgba(195, 140, 102, 0.2);
		}
		.bear-bar {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  background-color: rgba(195, 140, 102, 1);
		}
		.fox-box {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  width: 100%;
		  background-color: rgba(49, 132, 155, 0.2);
		}
		.fox-bar {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  background-color: rgba(49, 132, 155, 1);
		}
		.rabbit-box {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  width: 100%;
		  background-color: rgba(235, 166, 190, 0.2);
		}
		.rabbit-bar {
		  position: absolute;
		  top: 0;
		  left: 0;
		  height: 2rem;
		  border-radius: 10px;
		  background-color: rgba(235, 166, 190, 1);
		}
		
		.result-message {
		    font-size: 2rem;
		}
		
		label {
		  cursor: pointer;
		  display: inline-block;
		  width: 90px;
		  height: 41px;
		  box-shadow: 0 0 0 8px #e5e9ea inset;
		  border-radius: 30px;
		  position: relative;
		}
		
		#loading {
		  display: none;
		}
		
		a:hover { 
		 	text-decoration: none;
		}
		#forimg {
			background-color: #e4edfe;
			background-image: url('/resources/banner_imgs/animalFaceTest.png');
			background-repeat:no-repeat;
			background-position: center;"
		}
		.black-transparent {
			opacity:50%;
		}
				
    </style>
</head>

<body>
    <!-- Header -->
	<%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
	<!-- Header -->
    
    <div id="forimg" class="charity-subheader">
       <span class="black-transparent"></span>
        <div class="container">
            <div class="row">
                <div class="col-md-12"> 
                <p style="text-align:right; margin:0; padding:0;" ></p>
                   <!--  <h1>1:1 문의</h1> -->
                   <!--  <p>show your support</p> -->
                </div>
            </div>
        </div>
    </div>
    
   	<div class="charity-main-content">
   			<div>
		        <h1 align="center" >동물상 테스트</h1>
		        <h2 align="center">얼굴로 보는 인공지능 동물상 테스트</h2>
		        <h2 align="center">나는 어떤 동물과 닮았을까? 나의 동물상 찾기를 해보세요!</h2>
	       </div>
	       <br>
	   	<div class="charity-main-section"  style="background-color:lightgrey;">
	     	
	    <br>
	
	    <div class="file-upload">
	        
	        <div class="image-upload-wrap">
	            <input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" />
	            <div class="drag-text">
	                <h3>얼굴 사진을 올려놓거나 업로드하세요.</h3>
	            </div>
	        </div>
	        <div class="file-upload-content">
	            <img class="file-upload-image" id="face-image" src="#" alt="your image" />
	            <div id="loading" class="animated bounce">
	                <div class="spinner-border" role="status">
	                    <span class="sr-only">Loading...</span>
	                </div>
	                <p class="text-center">AI가 당신의 동물상을 분석중입니다.</p>
	            </div>
	            <p class = "result-message"> </p>
	            <div id="label-container" class="d-flex flex-column justify-content-around"></div>
	            <div class="image-title-wrap">
	                <button type="button" onclick="window.location.reload();" class="remove-image">재시도 </button>
	            </div>
	        </div>
	    </div>
	    <br>
	    </div>
	    
	    <div id="webcam-container"></div>
  </div>
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/mainMap/mainFooter.jsp"%>
    <!-- Footer -->

    <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
   <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    
    <script type="text/javascript">
        // More API functions here:
        // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

        // the link to your model provided by Teachable Machine export panel
        //const URL = "https://teachablemachine.withgoogle.com/models/TmYPne-E3/";
        const URL = "https://teachablemachine.withgoogle.com/models/NsR3oXmaT/";

         let model, webcam, labelContainer, maxPredictions; 

        // Load the image model and setup the webcam
        async function init() {
            const modelURL = URL + "model.json";
            const metadataURL = URL + "metadata.json";     
            model = await tmImage.load(modelURL, metadataURL);
            maxPredictions = model.getTotalClasses();   
            labelContainer = document.getElementById("label-container");
            for (let i = 0; i < maxPredictions; i++) { // and class labels
            	var element = document.createElement("div")
                element.classList.add("d-flex");
                labelContainer.appendChild(element);
            	
               /*  labelContainer.appendChild(document.createElement("div")); */
            }
        }
     
        async function predict() {
            
            var image = document.getElementById("face-image");            
            const prediction = await model.predict(image,false);
            prediction.sort((a,b)=>parseFloat(b.probability) - parseFloat(a.probability));
            console.log(prediction[0].className)
            var resultTitle, resultExplain;
            switch (prediction[0].className){
            	case "cat":
            		resultTitle =  "츤데레 매력쟁이 고양이상"
            		resultExplain = "무뚝뚝한 당신의 첫인상은 차가워 보이지만 묘한 매력을 풍겨 언제나 인기가 넘친다. 자존심이 세계 1등과 맞먹지만 관심 받는 것을 좋아하고 연인에게는 은근히 애교쟁이다. 시크한 츤데레로 연인에게 끊임없이 설렘을 안겨주는 당신은 고양이와 닮았다!"
            		break;
            	case "dog":
            		resultTitle = "귀여운 순둥이 강아지상"
            		resultExplain = "다정다감하고 귀여운 당신은 모든 사람들에게 즐거움을 주는 호감형이다! 친절하고 활발한 성격으로 어디에서도 인기폭발이며 애교와 웃음이 많아 연인에게 특히나 사랑스럽다. 당신은 애인바라기로 애인의 관심이 부족하면 시무룩해지고 외로움을 타는 모습이 마치 강아지와 똑 닮았다!"
            		break;
            	case "rabbit":
            		resultTitle = "천진난만한 매력의 토끼상"
                    resultExplain = "천진난만하고 귀여운 당신은 주변 사람들에게 기쁨을 주는 행복바이러스다! 호기심이 많아 활발하며 귀엽고 순수한 외모로 연인의 보호본능을 자극한다. 존재 자체가 상큼한 당신은 특별한 애교 없이도 연인에게 너무나도 사랑스럽다!"
            		break;
            	case "bear":
            		resultTitle = "포근한 매력의 곰상"
                    resultExplain = "첫 인상은 무서워 보이지만 알고 보면 귀여운 매력의 당신! 꼼꼼하고 섬세한 성격으로 연인을 헌신적으로 챙겨주는 당신은 연인에게 듬직한 존재! 포근한 매력에 듬직함까지 갖춘 최고의 사람!"
            		break;
            		
            	case "fox" :
            		resultTitle ="여우상"
            		resultExplain ="여우상은 고양이상과 강아지상이 적절히 융합되어 있는 듯함이 특징이며, 눈빛이 능글맞고 사소한 행동으로도 사람을 홀리는 재주가 있어 도화살이 끼는 경우가 많은 유형이다."
            		break;
            		
            	case "deer" :
            		resultTitle ="온순하고 우아한 사슴상"
                	resultExplain ="맑고 영롱한 분위기의 당신은 사슴처럼 차분한 성격의 소유자다. 초롱초롱한 눈망울이 당신의 가장 큰 트레이드마크며 따스하고 온순한 눈빛을 가져 사랑스러움을 항상 머금고 있다! 부끄러움이 많아 애정표현이 낯설은 당신은 연인에게조차 신비한 존재지만 따뜻한 성격으로 연인의 마음을 사로잡는 능력을 가졌다."
                	break;
                    
                    
            	default :
            		resultTitle = "알수없음"
            		resultExplain=""

            }
            
            var title = "<div class='" + prediction[0].className + "-animal-title'>" + resultTitle + "</div>"
            var explain = "<div class='animal-explain pt-2'>" + resultExplain + "</div>"
            
            /* var title = "<div>" + resultTitle + "</div>"
            var explain = "<div>" + resultExplain + "</div>" */
           
            $('.result-message').html(title + explain );
            
            var barWidth;
            
            for (let i = 0; i < maxPredictions; i++) {
            	if(prediction[i].probability.toFixed(2) > 0.1){
            		barWidth = Math.round(prediction[i].probability.toFixed(2)*100) + "%";
            	}else if(prediction[i].probability.toFixed(2) >=0.01){
            		barWidth = "4%"
            	}else {
            		barWidth = "2%"
            	}
            	
            	var labelTitle;
            	switch(prediction[i].className){
            		case  "cat" : 
	            		labelTitle = "고양이"
	            		break;
	            		
            		case  "dog" : 
	            		labelTitle = "강아지"
	            		break;
	            		
            		case  "bear" : 
	            		labelTitle = "곰"
	            		break;
	            		
            		case  "fox" : 
	            		labelTitle = "여우"
	            		break;
	            		
            		case  "deer" : 
	            		labelTitle = "사슴"
	            		break;
	            		
            		case  "rabbit" : 
	            		labelTitle = "토끼"
	            		break;
	            	
	            	default :
	            		labelTitle = "알수없음"
            		
            	}
            		
            	  var label = "<div class='animal-label d-flex align-items-center'>" + labelTitle + "</div>"
                  var bar = "<div class='bar-container position-relative container'><div class='" + prediction[i].className + "-box'></div><div class='d-flex justify-content-center align-items-center " + prediction[i].className + "-bar' style='width: " + barWidth + "'><span class='d-block percent-text'>" + Math.round(prediction[i].probability.toFixed(2) * 100) + "%</span></div></div>"
                  labelContainer.childNodes[i].innerHTML = label + bar;
            		
            		
            		
            		
               /*  const classPrediction =
                    prediction[i].className + ": " + prediction[i].probability.toFixed(2);
                labelContainer.childNodes[i].innerHTML = classPrediction; */
            }
        }
        
        function readURL(input) {
            if (input.files && input.files[0]) {

                var reader = new FileReader();

                reader.onload = function(e) {
                    $('.image-upload-wrap').hide();
                    $('#loading').show();
                    $('.file-upload-image').attr('src', e.target.result);
                    $('.file-upload-content').show();
                    $('.image-title').html(input.files[0].name);
                };

                reader.readAsDataURL(input.files[0]);
                init().then(function(){//함수가 호출 될때까지 시간이 조금 걸림 , then은 async 를 사용 하면 사용가능, init이 끝난후 predit가 실행    	
                	//console.log("test");
                	predict();
                	$('#loading').hide();
                	
                	var token = $("meta[name='_csrf']").attr("content");
              		var header = $("meta[name='_csrf_header']").attr("content");
              		$(document).ajaxSend(function(e, xhr, options) {
              			xhr.setRequestHeader(header, token);
              		});
                	
                	
                	$.ajax({
                		//포인트 추가, 하루한번
                		 type :"post",
                	     url :"/my/event/test/animalFacePoint",
                	     contentType: 'application/json',               	     
                	     async: "false",
                   	     datatype : 'json',
                   	     success: function(result) {
							if(result == "SUCCESS"){
								//alert("10포인트 적립하셨습니다.")
								swal({
									title : "10포인트 적립하셨습니다." , 
									icon : "success" , 
									button : true 
								});
								
								
							}else{
								//alert("오늘은 이미 포인트를 적립하셨습니다.")
								swal({
									title : "오늘은 이미 포인트를 적립하셨습니다." , 
									icon : "success" , 
									button : true 
								});
							}
						},
						error : function (e) {
							console.log(e);
						}
                		
                	});
                }); 
                
            } else {
                removeUpload();
            }
        }

        function removeUpload() {
            $('.file-upload-input').replaceWith($('.file-upload-input').clone());
            $('.file-upload-content').hide();
            $('.image-upload-wrap').show();
        }
        $('.image-upload-wrap').bind('dragover', function() {
            $('.image-upload-wrap').addClass('image-dropping');
        });
        $('.image-upload-wrap').bind('dragleave', function() {
            $('.image-upload-wrap').removeClass('image-dropping');
        });
    </script>


    

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/slick.slider.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/progressbar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.countdown.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jquery.jplayer.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/jplayer.playlist.js"></script>
    <script src="${pageContext.request.contextPath}/resources/charity/script/functions-main.js"></script>


</body>

</html>