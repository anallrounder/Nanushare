<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>로또 추첨기</title>
    <link rel="stylesheet" href="/resources/lotto/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
</head>

<body>
    <div id="wrapper">
        <h1 id="title">Lotto</h1>
        <div id="numbers">
            <div class="ball blue">?</div>
            <div class="ball blue">?</div>
            <div class="ball blue">?</div>
            <div class="ball red">?</div>
            <div class="ball red">?</div>
            <div class="ball grey">?</div>
            <div class="plus">+</div>
            <div class="ball bonus">?</div>
        </div>
        <button id="btn">시작!</button>
    </div>
    <script src="/resources/lotto/plz.js"></script>
</body>

</html>
