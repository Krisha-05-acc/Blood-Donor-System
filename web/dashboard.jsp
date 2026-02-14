<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.Donor_registration.model.Donor" %>
<%
    // Check if user is logged in
    Donor donor = (Donor) session.getAttribute("donor");
    if (donor == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donor Dashboard - Blood Donation System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f5f5f5;
            color: #333;
        }
        
        .navbar {
            background-color: #c00;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .navbar h1 {
            font-size: 1.5rem;
        }
        
        .navbar-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: white;
            color: #c00;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 1.2rem;
        }
        
        .logout-btn {
            background-color: white;
            color: #c00;
            border: none;
            padding: 8px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .logout-btn:hover {
            background-color: #f0f0f0;
        }
        
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }
        
        .welcome-card {
            background: linear-gradient(135deg, #c00 0%, #a00 100%);
            color: white;
            padding: 30px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(204, 0, 0, 0.2);
        }
        
        .welcome-card h2 {
            margin-bottom: 10px;
        }
        
        .welcome-card p {
            opacity: 0.9;
            font-size: 1.1rem;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
            gap: 20px;
            transition: transform 0.3s;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
        }
        
        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
        }
        
        .stat-icon.red { background-color: #ffe0e0; color: #c00; }
        .stat-icon.green { background-color: #e0f7e0; color: #28a745; }
        .stat-icon.blue { background-color: #e0f0ff; color: #007bff; }
        .stat-icon.orange { background-color: #fff3e0; color: #ff9800; }
        
        .stat-info h3 {
            color: #666;
            font-size: 0.9rem;
            font-weight: 500;
            margin-bottom: 5px;
        }
        
        .stat-info p {
            font-size: 1.8rem;
            font-weight: 700;
            color: #333;
        }
        
        .info-section {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }
        
        .info-section h3 {
            color: #c00;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #f0f0f0;
        }
        
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 15px;
        }
        
        .info-item {
            display: flex;
            padding: 10px 0;
            border-bottom: 1px dashed #eee;
        }
        
        .info-label {
            font-weight: 600;
            width: 40%;
            color: #555;
        }
        
        .info-value {
            width: 60%;
            color: #333;
        }
        
        .blood-type-badge {
            display: inline-block;
            background-color: #c00;
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 1.1rem;
        }
        
        .action-buttons {
            display: flex;
            gap: 15px;
            margin-top: 20px;
            flex-wrap: wrap;
        }
        
        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        
        .btn-primary {
            background-color: #c00;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #a00;
        }
        
        .btn-secondary {
            background-color: #f0f0f0;
            color: #333;
        }
        
        .btn-secondary:hover {
            background-color: #e0e0e0;
        }
        
        .alert {
            padding: 15px 20px;
            border-radius: 5px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .alert-info {
            background-color: #d9edf7;
            color: #31708f;
            border-left: 4px solid #31708f;
        }
        
        .alert-success {
            background-color: #dff0d8;
            color: #3c763d;
            border-left: 4px solid #3c763d;
        }
        
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                gap: 15px;
            }
            
            .info-grid {
                grid-template-columns: 1fr;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <h1><i class="fas fa-hand-holding-heart"></i> Blood Donor Dashboard</h1>
        <div class="navbar-right">
            <div class="user-info">
                <div class="user-avatar">
                    <%= donor.getFirstName().substring(0, 1).toUpperCase() %>
                </div>
                <span><%= donor.getFirstName() %> <%= donor.getLastName() %></span>
            </div>
            <form action="LogoutServlet" method="post" style="display: inline;">
                <button type="submit" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </button>
            </form>
        </div>
    </nav>
    
    <!-- Main Container -->
    <div class="container">
        <!-- Welcome Card -->
        <div class="welcome-card">
            <h2>Welcome back, <%= donor.getFirstName() %>!</h2>
            <p>Thank you for being a registered blood donor. Your generosity saves lives.</p>
        </div>
        
        <!-- Success Message if Registration Just Completed -->
        <% if (request.getParameter("registered") != null) { %>
        <div class="alert alert-success">
            <i class="fas fa-check-circle"></i>
            <span>Registration completed successfully! Welcome to our blood donor community.</span>
        </div>
        <% } %>
        
        <!-- Statistics Cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon red">
                    <i class="fas fa-tint"></i>
                </div>
                <div class="stat-info">
                    <h3>Blood Type</h3>
                    <p><%= donor.getBloodType() %></p>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon green">
                    <i class="fas fa-heartbeat"></i>
                </div>
                <div class="stat-info">
                    <h3>Donor Status</h3>
                    <p>Active</p>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon blue">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <div class="stat-info">
                    <h3>Total Donations</h3>
                    <p><%= donor.isDonatedBefore() ? "1+" : "0" %></p>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon orange">
                    <i class="fas fa-id-card"></i>
                </div>
                <div class="stat-info">
                    <h3>Donor ID</h3>
                    <p><%= donor.getDonorId() %></p>
                </div>
            </div>
        </div>
        
        <!-- Personal Information Section -->
        <div class="info-section">
            <h3><i class="fas fa-user"></i> Personal Information</h3>
            <div class="info-grid">
                <div>
                    <div class="info-item">
                        <div class="info-label">Full Name:</div>
                        <div class="info-value"><%= donor.getFirstName() %> <%= donor.getLastName() %></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Date of Birth:</div>
                        <div class="info-value"><%= donor.getDob() %></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Gender:</div>
                        <div class="info-value"><%= donor.getGender() %></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">ID Number:</div>
                        <div class="info-value"><%= donor.getIdNumber() %></div>
                    </div>
                </div>
                
                <div>
                    <div class="info-item">
                        <div class="info-label">Email:</div>
                        <div class="info-value"><%= donor.getEmail() %></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Phone:</div>
                        <div class="info-value"><%= donor.getPhone() %></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Address:</div>
                        <div class="info-value"><%= donor.getAddress() %>, <%= donor.getCity() %></div>
                    </div>
                    <% if (donor.getEmergencyContact() != null && !donor.getEmergencyContact().isEmpty()) { %>
                    <div class="info-item">
                        <div class="info-label">Emergency Contact:</div>
                        <div class="info-value"><%= donor.getEmergencyContact() %></div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        
        <!-- Health Information Section -->
        <div class="info-section">
            <h3><i class="fas fa-heartbeat"></i> Health Information</h3>
            <div class="info-grid">
                <div>
                    <div class="info-item">
                        <div class="info-label">Blood Type:</div>
                        <div class="info-value">
                            <span class="blood-type-badge"><%= donor.getBloodType() %></span>
                        </div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Weight:</div>
                        <div class="info-value"><%= donor.getWeight() %> kg</div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Previous Donor:</div>
                        <div class="info-value"><%= donor.isDonatedBefore() ? "Yes" : "No" %></div>
                    </div>
                    <% if (donor.getLastDonation() != null && !donor.getLastDonation().isEmpty()) { %>
                    <div class="info-item">
                        <div class="info-label">Last Donation:</div>
                        <div class="info-value"><%= donor.getLastDonation() %></div>
                    </div>
                    <% } %>
                </div>
                
                <div>
                    <div class="info-item">
                        <div class="info-label">Medical Conditions:</div>
                        <div class="info-value"><%= donor.isMedicalConditions() ? "Yes" : "No" %></div>
                    </div>
                    <% if (donor.getConditionsDetails() != null && !donor.getConditionsDetails().isEmpty()) { %>
                    <div class="info-item">
                        <div class="info-label">Details:</div>
                        <div class="info-value"><%= donor.getConditionsDetails() %></div>
                    </div>
                    <% } %>
                    <div class="info-item">
                        <div class="info-label">Registration Date:</div>
                        <div class="info-value"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(new java.util.Date()) %></div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Information Alert -->
        <div class="alert alert-info">
            <i class="fas fa-info-circle"></i>
            <span>Our team will contact you within 2-3 business days to schedule your donation appointment. Please ensure you are well-hydrated before donation.</span>
        </div>
        
        <!-- Action Buttons -->
        <div class="action-buttons">
            <button class="btn btn-primary" onclick="window.print()">
                <i class="fas fa-print"></i> Print Details
            </button>
            <button class="btn btn-secondary" onclick="alert('Update profile feature coming soon!')">
                <i class="fas fa-edit"></i> Update Profile
            </button>
            <button class="btn btn-secondary" onclick="alert('Schedule appointment feature coming soon!')">
                <i class="fas fa-calendar-plus"></i> Schedule Donation
            </button>
        </div>
    </div>
</body>
</html>

