<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .login-form {
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      width: 400px;
      padding: 20px;
      box-sizing: border-box;
    }

    .login-form h2 {
      margin-top: 0;
      font-size: 24px;
      text-align: center;
      color: #333;
    }

    .login-form p {
      text-align: center;
      color: #666;
      margin-bottom: 20px;
    }

    .login-form label {
      display: block;
      margin-bottom: 8px;
      font-weight: bold;
      color: #333;
    }

    .login-form input {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      font-size: 14px;
    }

    .login-form input::placeholder {
      font-size: 12px;
      color: #aaa;
    }

    .login-form button {
      width: 100%;
      padding: 10px;
      background-color: #888;
      color: white;
      border: none;
      border-radius: 4px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .login-form button:hover {
      background-color: #666;
    }

    .login-form .required {
      color: red;
    }
  </style>
</head>
<body>
  <div class="login-form">
    <h2>Login</h2>
    <p>Enter your credentials to access your account</p>
    <form action="loginForm" method="POST">
      <label for="email">E-mail <span class="required">*</span></label>
      <input type="email" id="email" name="email" placeholder="example@example.com" required>

      <label for="password">Password <span class="required">*</span></label>
      <input type="password" id="password" name="password" placeholder="Your Password" required>

      <button type="submit">LOGIN</button>
    </form>
  </div>
</body>
</html>
