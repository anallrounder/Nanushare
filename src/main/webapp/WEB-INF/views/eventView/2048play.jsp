<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="utf-8" />
        <title>2048</title>
        <style></style>
    </head>
    <link rel="stylesheet" type="text/css" href="/resources/2048/2048.css">
    <body>
        <table id="titleBar" border=0>
            <tr>
                <td id="titlePad">
                    <p id="title">2048</p>
                </td>
                <td id="scorePad">
                    <p id="scoreType">Score</p>
                    <p id="score"></p>
            </tr>
        </table>
        <table id="board" border=0>
            <tr>
                <td id="00"></td>
                <td id="01"></td>
                <td id="02"></td>
                <td id="03"></td>
            </tr>
            <tr>
                <td id="10"></td>
                <td id="11"></td>
                <td id="12"></td>
                <td id="13"></td>
            </tr>
            <tr>
                <td id="20"></td>
                <td id="21"></td>
                <td id="22"></td>
                <td id="23"></td>
            </tr>
            <tr>
                <td id="30"></td>
                <td id="31"></td>
                <td id="32"></td>
                <td id="33"></td>
            </tr>
        </table>
        <p id="info">2048 Copyright (c) YJYOON All rights reserved.</p>
    </body>
    <script type="text/javascript" src="/resources/2048/2048.js"></script>
</html>