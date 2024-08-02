<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 화면입니다.</title>
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

  form {
    margin-bottom: 20px;
  }

  input[type="text"],
  input[type="date"] {
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 200px;
    margin-bottom: 10px;
  }

  button {
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  button:hover {
    background-color: #0056b3;
  }

  #result {
    display: none;
    margin-top: 50px;
    text-align: center;
  }

  #result p {
    font-size: 18px;
    margin-bottom: 10px;
  }

  #result strong {
    font-size: 24px;
  }

  #result button {
    margin-top: 20px;
  }
</style>
</head>
<body>
<%@include file="./header.jsp" %>
<h1>아이디를 찾기 위해 이름과 생년월일을 입력해주세요.</h1>
  <form id="findInfo" name="findInfo">
    이름&nbsp;&nbsp;&nbsp;&nbsp;<input id ="name" name="name" autofocus="autofocus" required="required"/>
    <br>
    생년월일&nbsp;<input id ="birth" name="birth" required="required" type="date"/>
    <button onclick="return findIdForm()">아이디찾기</button>
    <br>
  </form>
  
  <div id="result">
  <br><br><br>
    <p>당신의 아이디는</p><strong><p id="resultId"></p></strong> <p>입니다.</p>
    <br>
    로그인 하시려면&nbsp;&nbsp;&nbsp;&nbsp;<a href="/login.do"><button>로그인</button></a>
    <br>
    비밀번호도 잊었다면&nbsp; <a href="/udtPass.do"><button>비밀번호수정</button></a>
  </div>
</body>
</html>