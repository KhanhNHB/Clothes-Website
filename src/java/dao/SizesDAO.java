/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.SizesDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import utils.DBUtils;

/**
 *
 * @author Hello
 */
public class SizesDAO {

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

    private List<SizesDTO> sizes;

    public List<SizesDTO> getSizes() {
        return sizes;
    }

    public List<SizesDTO> getListSize() throws NamingException, SQLException {
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "EXEC USP_GetListSize";

                ps = con.prepareStatement(sql);

                rs = ps.executeQuery();

                while (rs.next()) {
                    String id = rs.getString("id");
                    String size = rs.getString("sizes");
                    int quantity = rs.getInt("quantity");

                    if (this.sizes == null) {
                        this.sizes = new ArrayList<>();
                    }
                    SizesDTO sizesDTO = new SizesDTO(id, size, quantity);
                    this.sizes.add(sizesDTO);
                }
            }
        } finally {
            closeConnection();
        }
        return this.sizes;
    }

    public List<SizesDTO> getListSizeByProductID(String productID) throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "EXEC USP_GetSizeByProductID ?";

                ps = con.prepareStatement(sql);

                ps.setString(1, productID);

                rs = ps.executeQuery();

                while (rs.next()) {
                    String id = rs.getString("id");
                    String size = rs.getString("sizes");
                    int quantity = rs.getInt("quantity");

                    if (this.sizes == null) {
                        this.sizes = new ArrayList<>();
                    }
                    SizesDTO sizesDTO = new SizesDTO(id, size, quantity);
                    this.sizes.add(sizesDTO);
                }
            }
        } finally {
            closeConnection();
        }
        return this.sizes;
    }

}
