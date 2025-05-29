package com.servlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/AddFeePaymentServlet")
public class AddFeePaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	String studentIDStr = request.getParameter("studentID");
        	if (studentIDStr == null || studentIDStr.trim().isEmpty()) {
        	    throw new ServletException("Student ID is missing.");
        	}
        	int studentID = Integer.parseInt(studentIDStr);
            String studentName = request.getParameter("studentName");
            Date paymentDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("paymentDate"));
            double amount = Double.parseDouble(request.getParameter("amount"));
            String status = request.getParameter("status");

            FeePayment payment = new FeePayment(0, studentID, studentName, paymentDate, amount, status);
            FeePaymentDAO dao = new FeePaymentDAO();
            dao.insertPayment(payment);

            response.sendRedirect("DisplayFeePaymentsServlet");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
