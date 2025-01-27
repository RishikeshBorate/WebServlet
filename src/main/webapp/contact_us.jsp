<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact Us</title>
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

    .contact-form {
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      width: 400px;
      padding: 20px;
      box-sizing: border-box;
    }

    .contact-form h2 {
      margin-top: 0;
      font-size: 24px;
      text-align: center;
      color: #333;
    }

    .contact-form p {
      text-align: center;
      color: #666;
      margin-bottom: 20px;
    }

    .contact-form label {
      display: block;
      margin-bottom: 8px;
      font-weight: bold;
      color: #333;
    }

    .contact-form input,
    .contact-form textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      font-size: 14px;
    }

    .contact-form input::placeholder,
    .contact-form textarea::placeholder {
      font-size: 12px;
      color: #aaa;
    }

    .contact-form button {
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

    .contact-form button:hover {
      background-color: #666;
    }

    .contact-form .required {
      color: red;
    }
  </style>
</head>
<body>
  <div class="contact-form" >
    <h2>Contact Us</h2>
    <p>Please fill this form in a decent manner</p>
    <form action="contactusform" method="POST">
      <label for="full-name">Full Name <span class="required">*</span></label>
      <input type="text" id="full-name" name="full-name" placeholder="Your Full Name" required>

      <label for="email">E-mail <span class="required">*</span></label>
      <input type="email" id="email" name="email" placeholder="example@example.com" required>

      <label for="message">Message <span class="required">*</span></label>
      <textarea id="message" name="message" placeholder="Your Message" rows="4" required></textarea>

      <button type="submit">SUBMIT</button>
    </form>
  </div>
</body>
</html>
