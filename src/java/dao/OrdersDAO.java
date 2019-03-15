/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.OrdersDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import utils.DBUtils;

/**
 *
 * @author Hello
 */
public class OrdersDAO {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (con != null) {
            con.close();
        }
    }

    public int getMaxIdOrder() throws SQLException, NamingException {
        int row = 0;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Select MAX(id) as maxID From Orders";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();

                if (rs.next()) {
                    row = rs.getInt("maxID");
                    return row;
                }
            }
        } finally {
            closeConnection();
        }
        return row;
    }

    public boolean addOrders(OrdersDTO ordersDTO) throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Insert into Orders(orderDate, customerID, total) values(?, ?, ?)";
                ps = con.prepareStatement(sql);
                
                ps.setDate(1, ordersDTO.getOrderDate());
                ps.setString(2, ordersDTO.getCustomerID());
                ps.setDouble(3, ordersDTO.getTotal());
                int row = ps.executeUpdate();
                
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            closeConnection();
        }
        return false;
    }
}
