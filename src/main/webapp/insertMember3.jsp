<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
    <style>
    
    		/* CSS 스타일 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 12px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .error-message {
            color: red;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <form id="signupForm" action="#" method="post">
        <label for="username">사용자 이름:</label>
        <input type="text" id="username" name="username" required>

        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required>

        <label for="confirmPassword">비밀번호 확인:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>

        <button type="button" onclick="validateForm()">가입하기</button>

        <div id="errorMessages" class="error-message"></div>
    </form>

    <script>
        function validateForm() {
            var username = document.getElementById('username').value;
            var email = document.getElementById('email').value;
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;
            var errorMessages = document.getElementById('errorMessages');

            // 간단한 유효성 체크
            if (!username || !email || !password || !confirmPassword) {
                errorMessages.innerHTML = '모든 필드를 입력하세요.';
                return;
            }

            if (password !== confirmPassword) {
                errorMessages.innerHTML = '비밀번호가 일치하지 않습니다.';
                return;
            }

            // 여기에서 서버로 데이터를 전송하거나 다른 작업을 수행할 수 있습니다.

            // 유효성 체크가 성공하면 폼을 서버로 제출합니다.
            document.getElementById('signupForm').submit();
        }
    </script>
</body>
</html>