<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Test Form</title>
</head>
<body>
    <h1>Simple Test Form</h1>
    <form action="RegisterServlet" method="post">
        <input type="text" name="firstName" value="John"><br>
        <input type="text" name="lastName" value="Doe"><br>
        <input type="email" name="email" value="john@test.com"><br>
        <input type="password" name="password" value="test123"><br>
        <input type="text" name="bloodType" value="O+"><br>
        <input type="number" name="weight" value="65"><br>
        <input type="text" name="phone" value="1234567890"><br>
        <input type="text" name="address" value="Test Address"><br>
        <input type="text" name="city" value="Test City"><br>
        <input type="hidden" name="consent" value="true">
        <input type="hidden" name="privacy" value="true">
        <input type="submit" value="Test Submit">
    </form>
</body>
</html>