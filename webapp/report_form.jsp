<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Generate Report</title>

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
            background: linear-gradient(to right, #00695c, #26a69a);
            margin: 0;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            color: white;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Container */
        .container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
            text-align: center;
            animation: fadeIn 1.2s ease-in-out;
        }

        h2 {
            font-size: 26px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group label {
            display: block;
            font-size: 16px;
            font-weight: 500;
            text-align: left;
            margin-bottom: 6px;
        }

        .form-group select, 
        .form-group input {
            width: 100%;
            padding: 12px;
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

        input[type="submit"] {
            background: #004d40;
            color: white;
            padding: 14px;
            border: none;
            width: 100%;
            font-size: 18px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background: #00332a;
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

            .form-group select, 
            .form-group input {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>📊 Generate Fee Payment Reports</h2>
        <form method="post" action="ReportServlet">

            <div class="form-group">
                <label>Report Type:</label>
                <select name="reportType">
                    <option value="overdue">⚠️ Overdue Payments</option>
                    <option value="paid">❌ Students Not Paid by Date</option>
                    <option value="total">💰 Total Collection in Date Range</option>
                </select>
            </div>

            <div class="form-group" id="cutoffDateDiv">
                <label>📅 Cutoff Date:</label>
                <input type="date" name="cutoffDate" />
            </div>

            <div class="form-group" id="dateRangeDiv">
                <label>🔹 Start Date:</label>
                <input type="date" name="startDate" />
            </div>

            <div class="form-group">
                <label>🔹 End Date:</label>
                <input type="date" name="endDate" />
            </div>

            <input type="submit" value="Generate Report" />
        </form>
    </div>
</body>
</html>
