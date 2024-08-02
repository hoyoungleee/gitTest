<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 발급 화면입니다.</title>
<style>
    /* CSS styling */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
        background-color: #f5f5f5;
    }

    h1 {
        color: #333;
    }

    form {
        margin-top: 20px;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    h2 {
        margin-top: 20px;
        font-size: 18px;
    }

    input[type="text"],
    input[type="password"] {
        padding: 10px;
        font-size: 16px;
        border-radius: 4px;
        border: 1px solid #ccc;
        margin-bottom: 10px;
    }

    input[type="button"],
    button {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #337ab7;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type="button"]:hover,
    button:hover {
        background-color: #23527c;
    }

    #checkingForm,
    #updPassForm {
        margin-top: 20px;
    }
</style>
</head>
<body>
<%@include file="./header.jsp" %>
<div id="checkingForm">
    <h1>비밀번호를 수정하기 위해 회원 정보를 인증해주세요.</h1>
    <form id="userInfo" name="userInfo">
        아이디&nbsp;&nbsp;<input id="id" name="id" autofocus="autofocus" required="required">
        <br>
        이 름&nbsp;<input id="name" name="name" required="required" type="text">
        <button onclick="return userForm()">사용자인증하기</button>
        <br>
        <br>
        아이디부터 찾으시려면 <a href="/findId.do">아이디찾기</a>
    </form>
</div>
<div id="updPassForm" style="display: none;">
    <h1>회원정보가 인증되었습니다. 새 비밀번호를 입력해주세요.</h1>
    <form id="passForm">
        <br>
        <input type="hidden" id="hiddenID" name="hiddenID">
        <h2>비밀번호</h2>
        <input required="required" id="pw" name="pw" type="password">
        <br>
        <h2>비밀번호 확인</h2>
        <input required="required" id="confirmPw" name="confirmPw" type="password" onkeyup="passCheck()">
        <p id="passStatus"></p>
        <button id="udtBtn" onclick="updatePass()">비밀번호 수정하기</button>
        <br>
    </form>
</div>
</body>
</html>