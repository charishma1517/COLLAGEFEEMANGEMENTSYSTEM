<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Fee Payment</title>

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
            background: linear-gradient(to right, #003366, #00509e);
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
            max-width: 500px;
            text-align: center;
            animation: fadeIn 1.2s ease-in-out;
        }

        h2 {
            font-size: 26px;
            font-weight: 600;
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
            color: #ffffff;
            font-size: 18px;
            transition: transform 0.3s ease;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 14px 14px 14px 50px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.3);
            color: white;
            transition: all 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus {
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
            background: #0066cc;
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
            background: #004a99;
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
        <h2>💳 Add Fee Payment</h2>
        <form method="post" action="AddFeePaymentServlet">

            <label for="studentID">Student ID</label>
            <div class="form-group">
                <input type="text" id="studentID" name="studentID" required />
                <i class="fa-solid fa-id-card"></i>
            </div>

            <label for="studentName">Student Name</label>
            <div class="form-group">
                <input type="text" id="studentName" name="studentName" required />
                <i class="fa-solid fa-user"></i>
            </div>

            <label for="paymentDate">Payment Date</label>
            <div class="form-group">
                <input type="date" id="paymentDate" name="paymentDate" required />
                <i class="fa-solid fa-calendar-days"></i>
            </div>

            <label for="amount">Amount</label>
            <div class="form-group">
                <input type="text" id="amount" name="amount" required />
                <i class="fa-solid fa-dollar-sign"></i>
            </div>

            <label for="status">Status</label>
            <div class="form-group">
                <select id="status" name="status" required>
                    <option value="Paid">✅ Paid</option>
                    <option value="Overdue">⚠️ Overdue</option>
                </select>
                <i class="fa-solid fa-check-circle"></i>
            </div>

            <input type="submit" value="Add Payment" />
        </form>
    </div>
</body>
</html>
