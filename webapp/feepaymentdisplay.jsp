<%@ page import="java.util.List, com.model.FeePayment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fee Payments</title>

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
            background: linear-gradient(to right, #004080, #0080ff);
            margin: 0;
            padding: 20px;
            color: white;
            text-align: center;
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

        /* Print Button */
        .print-btn {
            padding: 12px 24px;
            background-color: #004080;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .print-btn:hover {
            background-color: #003060;
            transform: translateY(-2px);
        }

        /* Table Styling */
        .table-container {
            width: 95%;
            margin: 0 auto;
            overflow-x: auto;
            border-radius: 12px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1.2s ease-in-out;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.15);
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

        /* Responsive Design */
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

        @media print {
            .print-btn {
                display: none;
            }
        }
    </style>
</head>
<body>
    <h2>All Fee Payments</h2>
    <button class="print-btn" onclick="window.print()">Print</button>

    <div class="table-container">
        <%
            List<FeePayment> list = (List<FeePayment>) request.getAttribute("payments");
            if (list != null && !list.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th> Payment ID</th>
                    <th> Student ID</th>
                    <th> Name</th>
                    <th> Date</th>
                    <th> Amount</th>
                    <th> Status</th>
                </tr>
            </thead>
            <tbody>
                <% for(FeePayment fp : list) { %>
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
        <% } else { %>
            <p> No payments found.</p>
        <% } %>
    </div>
</body>
</html>
