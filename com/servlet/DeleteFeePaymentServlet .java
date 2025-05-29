package com.servlet;

import com.dao.FeePaymentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteFeePaymentServlet")
public class DeleteFeePaymentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentIdParam = request.getParameter("studentId");

        if (studentIdParam == null || studentIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing or invalid student ID");
            return;
        }

        try {
            int studentId = Integer.parseInt(studentIdParam);
            FeePaymentDAO dao = new FeePaymentDAO();
            dao.deletePaymentByStudentId(studentId);  // Ensure DAO method matches
            response.sendRedirect("DisplayFeePaymentsServlet");
        } catch (NumberFormatException e) {
            throw new ServletException("Invalid student ID format", e);
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}




