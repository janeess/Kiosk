<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>키오스크 첫 화면</title>
    <style>
        .touch-screen {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 700px;
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
            text-decoration: none; 
            text-align: center;
        }
        .touch-screen hover{
        	  text-decoration: none; 
        }
        .touch-screen h1 {
            font-size: 2em;
            color: #333;
        }
    </style>
</head>
<body>
        <a href="sList.do">
		    <div class="touch-screen">
		            <h1>주문하실 분은 화면을 터치해주세요</h1>
		    </div>
        </a>
</body>
</html>
