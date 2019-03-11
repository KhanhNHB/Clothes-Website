/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProductDTO;
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
public class ProductDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

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

    private List<ProductDTO> products;

    public List<ProductDTO> getProducts() {
        return products;
    }

    public List<ProductDTO> getListProduct() throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "EXEC USP_GetListProduct";

                ps = con.prepareStatement(sql);

                rs = ps.executeQuery();

                String id, name, image, details, categoryId, country;
                double unitPrice;
                while (rs.next()) {
                    id = rs.getString("id");
                    name = rs.getString("name");
                    unitPrice = rs.getDouble("unitPrice");
                    image = rs.getString("image");
                    details = rs.getString("details");
                    categoryId = rs.getString("categoryId");
                    country = rs.getString("country");

                    if (this.products == null) {
                        this.products = new ArrayList<>();
                    }

                    ProductDTO productDTO = new ProductDTO(id, name, unitPrice, image, details, categoryId, country);

                    this.products.add(productDTO);

                }
            }
        } finally {
            closeConnection();
        }

        return this.products;
    }

    public boolean createProduct(ProductDTO productDTO) throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();

            if (con != null) {

                String sql = "EXEC USP_CreateProduct ?, ?, ?, ?, ?, ?";

                ps = con.prepareStatement(sql);

                ps.setString(1, productDTO.getId());
                ps.setString(2, productDTO.getName());
                ps.setDouble(3, productDTO.getUnitPrice());
                ps.setString(4, productDTO.getImage());
                ps.setString(5, productDTO.getDetails());
                ps.setString(6, productDTO.getCategoryId());
                int row = ps.executeUpdate();

                for (int i = 12; i <= 99; i++) {
                    sql = "EXEC USP_CreateProduct ?, ?, ?, ?, ?, ?";
                    ps = con.prepareStatement(sql);
                    
                    String id = "P0" + i;
                    ps.setString(1, id);
                    ps.setString(2, productDTO.getName());
                    ps.setDouble(3, productDTO.getUnitPrice());
                    ps.setString(4, productDTO.getImage());
                    ps.setString(5, productDTO.getDetails());
                    ps.setString(6, productDTO.getCategoryId());
                    ps.executeUpdate();
                }

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
