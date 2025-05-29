package com.servlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/UpdateFeePaymentServlet")
public class UpdateFeePaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	int paymentID = Integer.parseInt(request.getParameter("paymentID"));

            int studentID = Integer.parseInt(request.getParameter("studentID"));
            String studentName = request.getParameter("studentName");
            Date paymentDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("paymentDate"));
            double amount = Double.parseDouble(request.getParameter("amount"));
            String status = request.getParameter("status");

            FeePayment payment = new FeePayment(paymentID, studentID, studentName, paymentDate, amount, status);
            FeePaymentDAO dao = new FeePaymentDAO();
            dao.updatePayment(payment);

            response.sendRedirect("DisplayFeePaymentsServlet");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
