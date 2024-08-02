<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" ></script>
<script type="text/javascript" src="../JS/member.js"></script>
<title>Insert title here</title>
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

    input[type="text"] {
        padding: 10px;
        font-size: 16px;
        border-radius: 4px;
        border: 1px solid #ccc;
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
</style>
</head>
<body>
<h1>중복확인을 위해 쓰고자 하시는 아이디를 입력하세요.</h1>
<input autofocus="autofocus" type="text" id="idCheck"><button onclick="return idCheck()">중복확인</button>
</body>
</html>