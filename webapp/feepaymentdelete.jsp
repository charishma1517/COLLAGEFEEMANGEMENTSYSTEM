<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Fee Payment</title>

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        /* General Styling */
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #c40018, #ff4d4d);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Container */
        .container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            padding: 30px 25px;
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 450px;
            text-align: center;
            animation: fadeIn 1.2s ease-in-out;
        }

        h2 {
            font-size: 26px;
            font-weight: 600;
            color: white;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group i {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            color: white;
            font-size: 18px;
            transition: transform 0.3s ease;
        }

        .form-group input {
            width: 100%;
            padding: 14px 14px 14px 50px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.3);
            color: white;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            background: rgba(255, 255, 255, 0.5);
            outline: none;
            transform: scale(1.02);
        }

        label {
            font-size: 16px;
            font-weight: 500;
            display: block;
            text-align: left;
            margin-bottom: 6px;
        }

        input[type="submit"] {
            background: #b30000;
            color: white;
            padding: 16px;
            border: none;
            width: 100%;
            font-size: 18px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background: #990000;
            transform: translateY(-2px);
        }

        /* Mobile */
        @media (max-width: 480px) {
            .container {
                padding: 25px 20px;
            }

            h2 {
                font-size: 22px;
            }

            .form-group i {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>❌ Delete Fee Payment</h2>
        <form action="DeleteFeePaymentServlet" method="get">

            <label for="studentId">Student ID</label>
            <div class="form-group">
                <input type="text" id="studentId" name="studentId" required />
                <i class="fa-solid fa-user-xmark"></i>
            </div>

            <input type="submit" value="Delete Payment" />
        </form>
    </div>
</body>
</html>
