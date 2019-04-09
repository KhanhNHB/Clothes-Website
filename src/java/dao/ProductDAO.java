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
                boolean checkState;
                int status;

                while (rs.next()) {
                    id = rs.getString("id");
                    name = rs.getString("name");
                    unitPrice = rs.getDouble("unitPrice");
                    image = rs.getString("image");
                    details = rs.getString("details");
                    categoryId = rs.getString("categoryId");
                    country = rs.getString("country");
                    status = rs.getInt("status");

                    checkState = status == 1;

                    if (this.products == null) {
                        this.products = new ArrayList<>();
                    }

                    ProductDTO productDTO = new ProductDTO(id, name, unitPrice, image, details, categoryId, country, checkState);

                    this.products.add(productDTO);
                }
            }
        } finally {
            closeConnection();
        }

        return this.products;
    }

    public List<ProductDTO> getListProductFromTo(int from, int to) throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select * from Product order by id ASC offset ? rows fetch first ? rows only";

                ps = con.prepareStatement(sql);
                ps.setInt(1, from);
                ps.setInt(2, to);

                rs = ps.executeQuery();

                String id, name, image, details, categoryId, country;
                double unitPrice;
                boolean checkState;
                int status;
                while (rs.next()) {
                    id = rs.getString("id");
                    name = rs.getString("name");
                    unitPrice = rs.getDouble("unitPrice");
                    image = rs.getString("image");
                    details = rs.getString("details");
                    categoryId = rs.getString("categoryId");
                    country = rs.getString("country");
                    status = rs.getInt("status");

                    checkState = status == 1;

                    if (this.products == null) {
                        this.products = new ArrayList<>();
                    }

                    ProductDTO productDTO = new ProductDTO(id, name, unitPrice, image, details, categoryId, country, checkState);

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

                String sql = "EXEC USP_CreateProduct ?, ?, ?, ?, ?, ?, ?";

                ps = con.prepareStatement(sql);

                ps.setString(1, productDTO.getId());
                ps.setString(2, productDTO.getName());
                ps.setDouble(3, productDTO.getUnitPrice());
                ps.setString(4, productDTO.getImage());
                ps.setString(5, productDTO.getDetails());
                ps.setString(6, productDTO.getCategoryId());

                int state = 0;
                if (productDTO.isStatus()) {
                    state = 1;
                }
                ps.setInt(7, state);

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

    public int getCountProductsTotal() throws SQLException, NamingException {
        int count = 0;
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "EXEC USP_GetCountProductsTotal";

                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();

                if (rs.next()) {
                    count = rs.getInt(1);
                    return count;
                }
            }
        } finally {
            closeConnection();
        }
        return count;
    }

    public boolean deleteProduct(String productID) throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "EXEC USP_DeleteProduct ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, productID);

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

      public boolean setStatusProduct(String productID) throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "EXEC USP_SetStatusProduct ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, productID);

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
    
    public ProductDTO getProductByID(String productID) throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "EXEC USP_getProductByID ?";
                ps = con.prepareStatement(sql);

                ps.setString(1, productID);

                rs = ps.executeQuery();

                if (rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    String image = rs.getString("image");
                    String details = rs.getString("details");
                    String categoryId = rs.getString("categoryId");
                    String country = rs.getString("country");
                    double unitPrice = rs.getDouble("unitPrice");
                    boolean checkState;
                    int status;

                    status = rs.getInt("status");
                    checkState = status == 1;
                    
                    ProductDTO productDTO = new ProductDTO(id, name, unitPrice,
                            image, details, categoryId, country, checkState);
                    return productDTO;
                }
            }
        } finally {
            closeConnection();
        }
        return null;
    }
}
