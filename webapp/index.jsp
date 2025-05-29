<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>College Fee Payment System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        /* General Styling */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            background: linear-gradient(to right, #003366, #00509e);
            color: white;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            height: 100vh;
            padding: 20px;
            position: fixed;
            transition: transform 0.4s ease-in-out;
            animation: slideIn 1s ease-in-out;
        }

        .sidebar h2 {
            text-align: center;
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar li {
            margin: 20px 0;
        }

        .sidebar a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            display: flex;
            align-items: center;
            padding: 12px;
            border-radius: 8px;
            transition: all 0.3s ease-in-out;
        }

        .sidebar a:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: scale(1.05);
        }

        .sidebar a i {
            margin-right: 12px;
        }

        /* Content */
        .content {
            margin-left: 280px;
            padding: 60px;
            width: 100%;
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        .content h1 {
            font-size: 32px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .content p {
            font-size: 18px;
            font-weight: 300;
        }

        /* Animations */
        @keyframes slideIn {
            from { transform: translateX(-50px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Fee Payment System</h2>
        <ul>
            <li><a href="feepaymentadd.jsp"><i class="fa-solid fa-plus"></i> Add Fee Payment</a></li>
            <li><a href="feepaymentupdate.jsp"><i class="fa-solid fa-pen"></i> Update Fee Payment</a></li>
            <li><a href="feepaymentdelete.jsp"><i class="fa-solid fa-trash"></i> Delete Fee Payment</a></li>
            <li><a href="DisplayFeePaymentsServlet"><i class="fa-solid fa-file-alt"></i> Display All Payments</a></li>
            <li><a href="reports.jsp"><i class="fa-solid fa-chart-bar"></i> Reports</a></li>
        </ul>
    </div>

    <div class="content">
        <h1>Welcome to College Fee Payment System</h1>
        <p>Select an option from the sidebar to proceed.</p>
    </div>
</body>
</html>
