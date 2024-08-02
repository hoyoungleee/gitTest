<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면입니다.</title>
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

    label {
        display: inline-block;
        width: 100px;
        font-weight: bold;
    }

    input[type="text"]{
        padding: 10px;
        font-size: 16px;
        border-radius: 4px;
        border: 1px solid #ccc;
        margin-bottom: 10px;
    }
    input[type="password"] {
        padding: 10px;
        font-size: 16px;
        border-radius: 4px;
        border: 1px solid #ccc;
        margin-bottom: 10px;
    }

    button {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #337ab7;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    button:hover {
        background-color: #23527c;
    }

    a {
        color: #337ab7;
        text-decoration: none;
        margin-left: 10px;
    }
</style>
</head>
<body>
<%@include file="./header.jsp" %>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" >
//카카오 SDK 초기화
Kakao.init('51170cde81df349ec4e9653882b01d01');
   function kakaoLogin() {
	
      // 카카오 로그인 요청
      Kakao.Auth.login({
        success: function(authObj) {
          // 로그인 성공 시 콜백 함수
          console.log('인증 코드:', authObj.code);

          // 사용자 정보 요청
          Kakao.API.request({
            url: '/v2/user/me',
            success: function(response) {
              // 사용자 정보 요청 성공 시 콜백 함수
              console.log('사용자 정보:', response);
              var userId = response.id;
              var userName = response.properties.nickname;
              // 여기서 사용자 정보를 활용하여 추가 작업 수행 가능
              console.log('사용자 id, 사용자 닉네임:', userId, userName);
            },
            fail: function(error) {
              // 사용자 정보 요청 실패 시 콜백 함수
              console.log('사용자 정보 요청 실패:', error);
            }
          });
        },
        fail: function(error) {
          // 로그인 실패 시 콜백 함수
          console.log('로그인 실패:', error);
        }
      });
    };
</script>
<h1>로그인을 위해 정보를 입력해주세요</h1>
<form id="loginInfo">
    <label for="id">아이디</label>
    <input id="id" autofocus="autofocus" required="required"/>
    <br>
    <label for="pw">비밀번호</label>
    <input id="pw" required="required" type="password"/>
    <button onclick="return loginForm()">로그인</button>
    <br>
    <a href="/findId.do">아이디찾기</a>&nbsp;&nbsp;<a href="/udtPass.do">비밀번호수정</a>
    <br>
    <a href="javascript:kakaoLogin()"><img alt="카카오로그인버튼" src="https://www.kefe.co.kr/m/image/sub/signup/signup_28.jpg" style="height:60px;width:auto;"></a>
</form>
</body>
</html>