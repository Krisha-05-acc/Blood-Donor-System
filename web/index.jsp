<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blood Donor Registration</title>
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
        
        .register-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
            max-width: 800px;
            width: 100%;
            padding: 40px;
        }
        
        h1 {
            color: #c00;
            margin-bottom: 10px;
            text-align: center;
        }
        
        .subtitle {
            color: #666;
            text-align: center;
            margin-bottom: 30px;
        }
        
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group.full-width {
            grid-column: span 2;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            color: #444;
        }
        
        input, select, textarea {
            width: 100%;
            padding: 10px 12px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
        }
        
        input:focus, select:focus, textarea:focus {
            border-color: #c00;
            outline: none;
            box-shadow: 0 0 0 3px rgba(204, 0, 0, 0.1);
        }
        
        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .checkbox-group input {
            width: auto;
        }
        
        .error-message {
            background-color: #ffe0e0;
            color: #c00;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 20px;
            border-left: 4px solid #c00;
        }
        
        .btn-register {
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
            margin-top: 20px;
        }
        
        .btn-register:hover {
            background-color: #a00;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(204, 0, 0, 0.3);
        }
        
        .login-link {
            text-align: center;
            margin-top: 20px;
            color: #666;
        }
        
        .login-link a {
            color: #c00;
            text-decoration: none;
            font-weight: 600;
        }
        
        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
            
            .form-group.full-width {
                grid-column: span 1;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h1><i class="fas fa-hand-holding-heart"></i> Become a Blood Donor</h1>
        <p class="subtitle">Join our lifesaving community by registering today</p>
        
        <% if (request.getParameter("error") != null) { %>
            <div class="error-message">
                <i class="fas fa-exclamation-circle"></i>
                <span>
                    <% 
                        String error = request.getParameter("error");
                        if (error.equals("required")) {
                            out.print("Please fill in all required fields.");
                        } else if (error.equals("email_exists")) {
                            out.print("Email already registered. Please use a different email or login.");
                        } else if (error.equals("registration_failed")) {
                            out.print("Registration failed. Please try again.");
                        } else if (error.equals("server_error")) {
                            out.print("Server error. Please try again later.");
                        } else {
                            out.print("An error occurred. Please try again.");
                        }
                    %>
                </span>
            </div>
        <% } %>
        
        <form action="RegisterServlet" method="post">
            <div class="form-grid">
                <div class="form-group">
                    <label for="firstName">First Name *</label>
                    <input type="text" id="firstName" name="firstName" required>
                </div>
                
                <div class="form-group">
                    <label for="lastName">Last Name *</label>
                    <input type="text" id="lastName" name="lastName" required>
                </div>
                
                <div class="form-group">
                    <label for="dob">Date of Birth *</label>
                    <input type="date" id="dob" name="dob" required>
                </div>
                
                <div class="form-group">
                    <label for="gender">Gender *</label>
                    <select id="gender" name="gender" required>
                        <option value="">Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="idNumber">ID Number *</label>
                    <input type="text" id="idNumber" name="idNumber" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number *</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>
                
                <div class="form-group full-width">
                    <label for="email">Email Address *</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group full-width">
                    <label for="password">Password *</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <div class="form-group">
                    <label for="bloodType">Blood Type *</label>
                    <select id="bloodType" name="bloodType" required>
                        <option value="">Select Blood Type</option>
                        <option value="A+">A+</option>
                        <option value="A-">A-</option>
                        <option value="B+">B+</option>
                        <option value="B-">B-</option>
                        <option value="AB+">AB+</option>
                        <option value="AB-">AB-</option>
                        <option value="O+">O+</option>
                        <option value="O-">O-</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="weight">Weight (kg) *</label>
                    <input type="number" id="weight" name="weight" min="30" max="200" required>
                </div>
                
                <div class="form-group">
                    <label for="address">Address *</label>
                    <input type="text" id="address" name="address" required>
                </div>
                
                <div class="form-group">
                    <label for="city">City *</label>
                    <input type="text" id="city" name="city" required>
                </div>
                
                <div class="form-group full-width">
                    <label for="emergencyContact">Emergency Contact (Name and Phone)</label>
                    <input type="text" id="emergencyContact" name="emergencyContact" placeholder="e.g., John Doe: 1234567890">
                </div>
                
                <div class="form-group full-width checkbox-group">
                    <input type="checkbox" id="donatedBefore" name="donatedBefore" value="true">
                    <label for="donatedBefore">I have donated blood before</label>
                </div>
                
                <div class="form-group full-width" id="lastDonationGroup" style="display: none;">
                    <label for="lastDonation">Last Donation Date</label>
                    <input type="date" id="lastDonation" name="lastDonation">
                </div>
                
                <div class="form-group full-width checkbox-group">
                    <input type="checkbox" id="medicalConditions" name="medicalConditions" value="true">
                    <label for="medicalConditions">I have medical conditions</label>
                </div>
                
                <div class="form-group full-width" id="conditionsDetailsGroup" style="display: none;">
                    <label for="conditionsDetails">Please specify medical conditions</label>
                    <textarea id="conditionsDetails" name="conditionsDetails" rows="3"></textarea>
                </div>
            </div>
            
            <button type="submit" class="btn-register">
                <i class="fas fa-user-plus"></i> Register as Donor
            </button>
        </form>
        
        <div class="login-link">
            Already have an account? <a href="login.jsp">Login here</a>
        </div>
    </div>
    
    <script>
        // Show/hide last donation field based on checkbox
        document.getElementById('donatedBefore').addEventListener('change', function() {
            document.getElementById('lastDonationGroup').style.display = this.checked ? 'block' : 'none';
        });
        
        // Show/hide medical conditions details based on checkbox
        document.getElementById('medicalConditions').addEventListener('change', function() {
            document.getElementById('conditionsDetailsGroup').style.display = this.checked ? 'block' : 'none';
        });
    </script>
</body>
</html>