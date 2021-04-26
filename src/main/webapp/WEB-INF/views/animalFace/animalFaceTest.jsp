<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


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

<head>
    <meta charset="UTF-8">
    <title>동물상 테스트</title>
    



    <style type="text/css">
        body {
            font-family: sans-serif;
            background-color: #eeeeee;
        }

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
            border: 4px dashed #1FB264;
            position: relative;
        }

        .image-dropping,
        .image-upload-wrap:hover {
            background-color: #1FB264;
            border: 4px dashed #ffffff;
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
            color: #15824B;
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
    </style>
</head>

<body>
    <!-- Header -->
    <%@ include file="/WEB-INF/views/mainMap/mainHeader.jsp"%>
    <!-- Header -->
    
   
     
        <h1>동물상 테스트</h1>
        <h2>얼굴로 보는 인공지능 동물상 테스트</h2>
        <h2>나는 어떤 동물과 닮았을까? 나의 동물상 찾기를 해보세요!</h2>
       
    

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
            <p class = "resultMessage"> </p>
            <div id="label-container" class="d-flex flex-column justify-content-around"></div>
            <div class="image-title-wrap">
                <button type="button" onclick="window.location.reload();" class="remove-image">재시도 </button>
            </div>
        </div>
    </div>
    
    
    <div id="webcam-container"></div>
  
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
        const URL = "https://teachablemachine.withgoogle.com/models/TmYPne-E3/";

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
            
            var resultMessage;
            switch (prediction[0].className){
            	case "고양이":
            		resultMessage = "고양이상"
            		break;
            	case "강아지":
            		resultMessage = "강아지상"
            		break;
            	case "판다":
            		resultMessage = "판다상"
            		break;
            	case "레서판다":
            		resultMessage = "레서판다상"
            		break;
            	default :
            		resultMessage = "알수없음"

            }
            $('.resultMessage').html(resultMessage);
            
            
            for (let i = 0; i < maxPredictions; i++) {
                const classPrediction =
                    prediction[i].className + ": " + prediction[i].probability.toFixed(2);
                labelContainer.childNodes[i].innerHTML = classPrediction;
            }
        }
        
        function readURL(input) {
            if (input.files && input.files[0]) {

                var reader = new FileReader();

                reader.onload = function(e) {
                    $('.image-upload-wrap').hide();

                    $('.file-upload-image').attr('src', e.target.result);
                    $('.file-upload-content').show();

                    $('.image-title').html(input.files[0].name);
                };

                reader.readAsDataURL(input.files[0]);
                init().then(function(){//함수가 호출 될때까지 시간이 조금 걸림 , then은 async 를 사용 하면 사용가능, init이 끝난후 predit가 실행    	
                	//console.log("test");
                	predict();
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