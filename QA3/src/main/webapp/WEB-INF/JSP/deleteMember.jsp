<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f1f1f1;
    margin: 0;
    padding: 0;
  }

  h1 {
    color: #333;
    font-size: 24px;
  }

  a {
    color: #007bff;
    text-decoration: none;
  }

  a:hover {
    text-decoration: underline;
  }

  .container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
  }

  .login-message {
    margin-bottom: 20px;
  }

  .button {
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  .button:hover {
    background-color: #0056b3;
  }
</style>
<script type="text/javascript" src="../common/member.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<%@include file="./header.jsp" %>
<div class="container">
  <c:if test="${sessionScope.id == null }">
    <h1 class="login-message">로그인 후 이용하세요.</h1>
    <a href="/login.do" class="button">로그인하기</a>
    <br>
    <a href="/" class="button">홈으로</a>
  </c:if>
  <c:if test="${sessionScope.id != null }">
    <h1>정말 탈퇴하시겠습니까?</h1>
    <input type="hidden" value="${sessionScope.id}" id="id">
    <button id="delBtn" class="button" onclick="return delMember()">탈퇴하기</button>
  </c:if>
</div>
</body>
</html>