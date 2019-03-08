/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CategoryDTO;
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
public class CategoryDAO {
    
    
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

    List<CategoryDTO> categorys;

    public List<CategoryDTO> getCategory() {
        return categorys;
    }
    
    public List<CategoryDTO> getListCategory() throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "EXEC USP_GetListCategory";
                
                ps = con.prepareStatement(sql);
                
                rs = ps.executeQuery();
                
                String id, name;
                while (rs.next()) {
                    id = rs.getString("id");
                    name = rs.getString("name");
                    
                    if (this.categorys == null) {
                        this.categorys = new ArrayList<>();
                    }
                    
                    CategoryDTO categoryDTO = new CategoryDTO(id, name);
                    this.categorys.add(categoryDTO);
                }
            }
        } finally {
            closeConnection();
        }
        return this.categorys;
    }

    public String getCategoryNameById(String id) throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();
            
            if (con != null) {
                String sql = "EXEC USP_GetCategoryNameById ?";
                
                ps = con.prepareStatement(sql);
                
                rs = ps.executeQuery();
                
                if (rs.next()) {
                   String name = rs.getString("name");
                   return name;
                }
                
            }
        } finally {
            closeConnection();
        }
        return null;
    }
    
      public String getCategoryIDByName(String name) throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();
            
            if (con != null) {
                String sql = "EXEC USP_GetCategoryIDByName ?";
                
                ps = con.prepareStatement(sql);
                
                ps.setString(1, name);
                
                rs = ps.executeQuery();
                
                if (rs.next()) {
                   String id = rs.getString("id");
                   return id;
                }
                
            }
        } finally {
            closeConnection();
        }
        return null;
    }
}
