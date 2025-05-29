package com.dao;

import com.model.FeePayment;
import com.util.DatabaseConnection;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class FeePaymentDAO {

    public void insertPayment(FeePayment payment) throws SQLException {
        String sql = "INSERT INTO FeePayments (StudentID, StudentName, PaymentDate, Amount, Status) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, payment.getStudentID());
            ps.setString(2, payment.getStudentName());
            ps.setDate(3, new java.sql.Date(payment.getPaymentDate().getTime()));
            ps.setDouble(4, payment.getAmount());
            ps.setString(5, payment.getStatus());
            ps.executeUpdate();
        }
    }

    public List<FeePayment> selectAllPayments() {
        List<FeePayment> payments = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM feepayments");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                FeePayment fp = new FeePayment();
                fp.setPaymentID(rs.getInt("PaymentID"));
                fp.setStudentID(rs.getInt("StudentID"));
                fp.setStudentName(rs.getString("StudentName"));
                fp.setPaymentDate(rs.getDate("PaymentDate"));
                fp.setAmount(rs.getDouble("Amount"));
                fp.setStatus(rs.getString("Status"));
                payments.add(fp);
            }

            // Debug print: how many records fetched?
            System.out.println("Fetched records: " + payments.size());

        } catch (Exception e) {
            e.printStackTrace(); // Keep this for troubleshooting exceptions
        }
        return payments;
    }



    public FeePayment selectPayment(int id) {
        String sql = "SELECT * FROM FeePayments WHERE PaymentID = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updatePayment(FeePayment payment) throws SQLException {
        String sql = "UPDATE FeePayments SET StudentID=?, StudentName=?, PaymentDate=?, Amount=?, Status=? WHERE PaymentID=?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, payment.getStudentID());
            ps.setString(2, payment.getStudentName());
            ps.setDate(3, new java.sql.Date(payment.getPaymentDate().getTime()));
            ps.setDouble(4, payment.getAmount());
            ps.setString(5, payment.getStatus());
            ps.setInt(6, payment.getPaymentID());
            return ps.executeUpdate() > 0;
        }
    }

    public void deletePaymentByStudentId(int studentId) throws SQLException {
        String sql = "DELETE FROM FeePayments WHERE StudentID = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, studentId);
            stmt.executeUpdate();
        }
    }


    public List<FeePayment> getPaymentsByPeriod(Date start, Date end) {
        List<FeePayment> payments = new ArrayList<>();
        String sql = "SELECT * FROM FeePayments WHERE PaymentDate BETWEEN ? AND ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDate(1, new java.sql.Date(start.getTime()));
            ps.setDate(2, new java.sql.Date(end.getTime()));
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    payments.add(mapRow(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }

    public List<FeePayment> getOverduePayments() {
        List<FeePayment> payments = new ArrayList<>();
        String sql = "SELECT * FROM FeePayments WHERE Status = 'Overdue'";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                payments.add(mapRow(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }

    public List<FeePayment> getStudentsNotPaid(java.util.Date cutoffDate) {
        List<FeePayment> unpaid = new ArrayList<>();
        String sql = "SELECT DISTINCT StudentID, StudentName FROM FeePayments WHERE PaymentDate > ? OR Status != 'Paid'";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDate(1, new java.sql.Date(cutoffDate.getTime()));
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    FeePayment p = new FeePayment();
                    p.setStudentID(rs.getInt("StudentID"));
                    p.setStudentName(rs.getString("StudentName"));
                    p.setStatus("Not Paid");
                    unpaid.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return unpaid;
    }

    public Double getTotalCollection(java.util.Date start, java.util.Date end) {
        String sql = "SELECT SUM(Amount) FROM FeePayments WHERE PaymentDate BETWEEN ? AND ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDate(1, new java.sql.Date(start.getTime()));
            ps.setDate(2, new java.sql.Date(end.getTime()));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }

    private FeePayment mapRow(ResultSet rs) throws SQLException {
        return new FeePayment(
            rs.getInt("PaymentID"),
            rs.getInt("StudentID"),
            rs.getString("StudentName"),
            rs.getDate("PaymentDate"),
            rs.getDouble("Amount"),
            rs.getString("Status")
        );
    }
}
