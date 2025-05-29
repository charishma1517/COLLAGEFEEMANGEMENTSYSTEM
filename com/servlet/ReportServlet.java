package com.servlet;

import com.dao.FeePaymentDAO;
import com.model.FeePayment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String type = request.getParameter("reportType");
            FeePaymentDAO dao = new FeePaymentDAO();

            if ("overdue".equals(type)) {
                List<FeePayment> list = dao.getOverduePayments();
                request.setAttribute("report", list);
            } else if ("paid".equals(type)) {
                Date cutoffDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("cutoffDate"));
                List<FeePayment> list = dao.getStudentsNotPaid(cutoffDate);
                request.setAttribute("report", list);
            } else if ("total".equals(type)) {
                Date start = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("startDate"));
                Date end = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("endDate"));
                Double total = dao.getTotalCollection(start, end);
                request.setAttribute("totalCollection", total);
            }

            request.getRequestDispatcher("report_result.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}

