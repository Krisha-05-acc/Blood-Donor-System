<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Blood Donor System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #c00 0%, #a00 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .login-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            max-width: 900px;
            width: 100%;
            display: flex;
        }
        
        .login-left {
            background: linear-gradient(135deg, #c00 0%, #a00 100%);
            color: white;
            padding: 50px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .login-left h1 {
            font-size: 2rem;
            margin-bottom: 20px;
        }
        
        .login-left p {
            font-size: 1.1rem;
            opacity: 0.9;
            line-height: 1.6;
            margin-bottom: 30px;
        }
        
        .login-left .icon {
            font-size: 4rem;
            margin-bottom: 20px;
        }
        
        .login-right {
            padding: 50px;
            flex: 1;
        }
        
        .login-right h2 {
            color: #333;
            margin-bottom: 10px;
            font-size: 1.8rem;
        }
        
        .login-right .subtitle {
            color: #666;
            margin-bottom: 30px;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #444;
        }
        
        .input-wrapper {
            position: relative;
        }
        
        .input-wrapper i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
        }
        
        .form-group input:focus {
            border-color: #c00;
            outline: none;
            box-shadow: 0 0 0 3px rgba(204, 0, 0, 0.1);
        }
        
        .error-message {
            background-color: #ffe0e0;
            color: #c00;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            border-left: 4px solid #c00;
        }
        
        .btn-login {
            width: 100%;
            padding: 14px;
            background-color: #c00;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .btn-login:hover {
            background-color: #a00;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(204, 0, 0, 0.3);
        }
        
        .register-link {
            text-align: center;
            margin-top: 25px;
            color: #666;
        }
        
        .register-link a {
            color: #c00;
            text-decoration: none;
            font-weight: 600;
        }
        
        .register-link a:hover {
            text-decoration: underline;
        }
        
        .divider {
            display: flex;
            align-items: center;
            margin: 25px 0;
            color: #999;
        }
        
        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background-color: #e0e0e0;
        }
        
        .divider span {
            padding: 0 15px;
        }
        
        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
            }
            
            .login-left {
                padding: 30px;
            }
            
            .login-right {
                padding: 30px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <!-- Left Side - Branding -->
        <div class="login-left">
            <div class="icon">
                <i class="fas fa-hand-holding-heart"></i>
            </div>
            <h1>Blood Donor Portal</h1>
            <p>Join our lifesaving community. Every donation makes a difference in someone's life.</p>
            <p><i class="fas fa-quote-left"></i> "The gift of blood is the gift of life. Thank you for being a hero!" <i class="fas fa-quote-right"></i></p>
        </div>
        
        <!-- Right Side - Login Form -->
        <div class="login-right">
            <h2>Welcome Back</h2>
            <p class="subtitle">Login to access your donor account</p>
            
            <!-- Display error message if login failed -->
            <% 
                String error = request.getParameter("error");
                if (error != null) {
            %>
                <div class="error-message">
                    <i class="fas fa-exclamation-circle"></i>
                    <span>
                        <% 
                            if (error.equals("invalid")) {
                                out.print("Invalid email or password. Please try again.");
                            } else if (error.equals("required")) {
                                out.print("Please fill in all required fields.");
                            } else {
                                out.print("An error occurred. Please try again.");
                            }
                        %>
                    </span>
                </div>
            <% } %>
            
            <!-- Display logout message if user just logged out -->
            <% if (request.getParameter("logout") != null) { %>
                <div style="background-color: #e0f7e0; color: #28a745; padding: 12px; border-radius: 5px; margin-bottom: 20px; display: flex; align-items: center; gap: 10px; border-left: 4px solid #28a745;">
                    <i class="fas fa-check-circle"></i>
                    <span>You have been successfully logged out.</span>
                </div>
            <% } %>
            
            <form action="LoginServlet" method="post">
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <div class="input-wrapper">
                        <i class="fas fa-envelope"></i>
                        <input type="email" id="email" name="email" placeholder="Enter your email" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-wrapper">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="password" name="password" placeholder="Enter your password" required>
                    </div>
                </div>
                
                <button type="submit" class="btn-login">
                    <i class="fas fa-sign-in-alt"></i>
                    Login to Dashboard
                </button>
            </form>
            
            <div class="divider">
                <span>OR</span>
            </div>
            
            <div class="register-link">
                Don't have an account? <a href="index.jsp">Register as a donor</a>
            </div>
        </div>
    </div>
</body>
</html>
