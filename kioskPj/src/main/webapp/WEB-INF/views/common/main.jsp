<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>키오스크 첫 화면</title>
    <style>
    	#t { text-decoration:none }
    	
        .touch-screen {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 700px;
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .touch-screen h1 {
            font-size: 2em;
            color: #333;
        }
    </style>
</head>
<body>
		    <div class="touch-screen">
		        <a id="t" href="sList.do"><h1>주문하실 분은 화면을 터치해주세요</h1></a>
		    </div>
</body>
</html>
