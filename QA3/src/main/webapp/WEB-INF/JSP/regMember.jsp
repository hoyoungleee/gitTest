<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면입니다.</title>
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
    input[type="password"],
    input[type="date"],
    select {
        padding: 10px;
        font-size: 16px;
        border-radius: 4px;
        border: 1px solid #ccc;
        margin-bottom: 10px;
    }

    input[type="button"] {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #337ab7;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type="button"]:hover {
        background-color: #23527c;
    }

    label {
        display: inline-block;
        width: 150px;
        font-weight: bold;
    }

    .form_group {
        margin-bottom: 10px;
    }

    .email_form {
        display: inline-block;
        margin-right: 10px;
    }

    #passStatus {
        margin: 5px 0;
        font-size: 14px;
        color: #555;
    }
</style>
</head>
<body>
<%@include file="./header.jsp" %>
<h1>회원가입을 위해 정보를 입력하세요.</h1>
<form name="member_info" id="member_info">
    <h2>아이디</h2>
    <input readonly="readonly" required="required" id="id" name="id" type="text" placeholder="중복확인을 눌러주세요">
    <input type="button" onclick="return checkPop()" value="중복확인">
    <h2>비밀번호</h2>
    <input required="required" id="pw" name="pw" type="password">
    <h2>비밀번호 확인</h2>
    <input required="required" id="confirmPw" name="confirmPw" type="password" onkeyup="passCheck()">
    <p id="passStatus"></p>
    <h2>이름</h2>
    <input required="required" id="name" name="name" type="text">
    <h2>생년월일</h2>
    <input required="required" id="birth" name="birth" type="date">
    <h2>성별선택</h2>
    <input type="radio" name="gender" value="M" checked="checked">남자
    <input type="radio" name="gender" value="W">여자
    <h2>주소입력</h2>
    도로명주소&nbsp;<input type="text" id="address" name="address" placeholder="주소검색 버튼클릭바람" readonly="readonly">
    <input type="button" onclick="addrSearch()" value="주소 검색"><br>
    상세주소&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="dtlAddress" name="dtlAddress" required="required" placeholder="상세주소 입력하기">
    <div class="form_group">
        <label for="email1">이메일 아이디</label>
        <input type="text" id="email1" name="email1" required="required">
    </div>
    <div class="email_form"> @ </div>
    <div class="email_form">
        <label for="email2">이메일 주소</label>
        <input type="text" id="email2" name="email2" required="required">
    </div>
    <div class="email_form">
        <label for="email3">이메일 선택</label>
        <select id="email3" name="email3" title="이메일 주소 선택" onchange="selectMail()">
            <option value="">이메일주소 직접입력</option>
            <option value="naver.com">naver.com</option>
            <option value="nate.com">nate.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="yahoo.com">yahoo.com</option>
            <option value="hanmail.net">hanmail.net</option>
        </select>
    </div>
    <br>
    <input type="button" id="btn" onclick="return regForm()" value="회원가입신청">
</form>
</body>
</html>