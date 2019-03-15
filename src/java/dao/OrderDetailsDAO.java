/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.OrderDetailsDTO;
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
public class OrderDetailsDAO {

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
    
    public boolean addOrderDetails(OrderDetailsDTO orderDetailsDTO) throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Insert into OrderDetails(productID, quantity, unitPrice, total, orderID) "
                        + "values(?, ?, ?, ?, ?)";
                
                ps = con.prepareStatement(sql);
                
                ps.setString(1, orderDetailsDTO.getProductID());
                ps.setInt(2, orderDetailsDTO.getQuantity());
                ps.setDouble(3, orderDetailsDTO.getUnitPrice());
                ps.setDouble(4, orderDetailsDTO.getTotal());
                ps.setInt(5, orderDetailsDTO.getOrderID());
                
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
