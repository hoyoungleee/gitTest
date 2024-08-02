<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문을 환영합니다.</title>
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

    hr {
        border: 0;
        border-top: 1px solid #ccc;
        margin: 20px 0;
    }

    strong {
        font-weight: bold;
    }

    a {
        color: #337ab7;
        text-decoration: none;
    }
</style>
</head>
<body>
<%@include file="./header.jsp" %>
    <h1>회원제 문의게시판입니다..</h1>
    <br>
    <hr>
    <strong>문의를 남기시려면 로그인을 해주시기 바랍니다.</strong><a href="/login.do">로그인하기</a>
    <hr>
    <br>
    <strong>아직 회원이 아니시라면</strong> <a href="/reg.do">회원가입하기</a>
</body>
</html>