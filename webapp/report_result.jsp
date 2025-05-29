<%@ page import="java.util.List, com.model.FeePayment" %>
<%
    List<FeePayment> report = (List<FeePayment>) request.getAttribute("report");
    Double totalCollection = (Double) request.getAttribute("totalCollection");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Report Results</title>

    <!-- Correct Font Awesome CDN for Icons -->
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
            background: linear-gradient(to right, #003366, #0080ff);
            margin: 0;
            padding: 20px;
            text-align: center;
            color: white;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        /* Table Styling */
        .table-container {
            width: 90%;
            margin: 0 auto;
            overflow-x: auto;
            border-radius: 12px;
            backdrop-filter: blur(12px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1.2s ease-in-out;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.2);
            overflow: hidden;
            border-radius: 12px;
        }

        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
        }

        th {
            background: rgba(255, 255, 255, 0.3);
            font-weight: 600;
            font-size: 16px;
        }

        tr:nth-child(even) {
            background: rgba(255, 255, 255, 0.1);
        }

        td {
            font-size: 14px;
            color: white;
        }

        p {
            text-align: center;
            font-size: 18px;
            font-weight: 400;
            margin-top: 40px;
        }

        @media screen and (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            th {
                display: none;
            }

            tr {
                margin-bottom: 20px;
                border-radius: 8px;
                padding: 10px;
                background: rgba(255, 255, 255, 0.2);
            }

            td {
                position: relative;
                padding-left: 50%;
                text-align: left;
            }

            td::before {
                position: absolute;
                top: 50%;
                left: 20px;
                transform: translateY(-50%);
                font-weight: bold;
            }

            td:nth-of-type(1)::before { content: "Payment ID"; }
            td:nth-of-type(2)::before { content: "Student ID"; }
            td:nth-of-type(3)::before { content: "Name"; }
            td:nth-of-type(4)::before { content: "Date"; }
            td:nth-of-type(5)::before { content: "Amount"; }
            td:nth-of-type(6)::before { content: "Status"; }
        }

    </style>
</head>
<body>
    <h2>Report Results</h2>

    <div class="table-container">
        <% if (report != null) { %>
        <table>
            <thead>
                <tr>
                    <th><i class="fa-solid fa-receipt"></i> Payment ID</th>
                    <th><i class="fa-solid fa-id-card"></i> Student ID</th>
                    <th><i class="fa-solid fa-user"></i> Student Name</th>
                    <th><i class="fa-solid fa-calendar-alt"></i> Payment Date</th>
                    <th><i class="fa-solid fa-dollar-sign"></i> Amount</th>
                    <th><i class="fa-solid fa-circle-check"></i> Status</th>
                </tr>
            </thead>
            <tbody>
                <% for(FeePayment fp : report) { %>
                <tr>
                    <td><%= fp.getPaymentID() %></td>
                    <td><%= fp.getStudentID() %></td>
                    <td><%= fp.getStudentName() %></td>
                    <td><%= fp.getPaymentDate() %></td>
                    <td><%= fp.getAmount() %></td>
                    <td><%= fp.getStatus() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else if (totalCollection != null) { %>
            <h3> Total Collection</h3>
            <p><strong><%= totalCollection %></strong></p>
        <% } else { %>
            <p> No data available for the selected report.</p>
        <% } %>
    </div>
</body>
</html>
