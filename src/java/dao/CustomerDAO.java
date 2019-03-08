package dao;

import dto.CustomerDTO;
import java.io.Serializable;
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
 * @author hello
 */
public class CustomerDAO implements Serializable {

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

    List<CustomerDTO> customers;

    public List<CustomerDTO> getCustomers() {
        return customers;
    }

    public void loadCustomers() throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "SELECT id, firstName, lastName, middleName, address, phone, cusLevel, sex, avatar FROM dbo.Customer";
                ps = con.prepareStatement(sql);

                rs = ps.executeQuery();

                while (rs.next()) {
                    String id = rs.getString("id");
                    String firstName = rs.getString("firstName");
                    String lastName = rs.getString("lastName");
                    String middleName = rs.getString("middleName");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    int cusLevel = rs.getInt("cusLevel");
                    boolean sex = rs.getBoolean("sex");
                    String avatar = rs.getString("avatar");

                    if (this.customers == null) {
                        customers = new ArrayList();
                    }

                    CustomerDTO customerDTO = new CustomerDTO(id, firstName, lastName, middleName, address, phone, sex, avatar, cusLevel);
                    this.customers.add(customerDTO);
                }
            }
        } finally {
            closeConnection();
        }
    }

    public List<CustomerDTO> searchCustomer(String searchValue, int option) throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "";
                if (option == 0) { // search first name
                    sql = "Select id, firstName, lastName, middleName, address, phone, cusLevel, sex, avatar "
                            + "From dbo.Customer Where firstName LIKE ?";

                    ps = con.prepareStatement(sql);
                    ps.setString(1, "%" + searchValue + "%");

                    rs = ps.executeQuery();

                    while (rs.next()) {
                        String id = rs.getString("id");
                        String firstName = rs.getString("firstName");
                        String lastName = rs.getString("lastName");
                        String middleName = rs.getString("middleName");
                        String address = rs.getString("address");
                        String phone = rs.getString("phone");
                        int cusLevel = rs.getInt("cusLevel");
                        boolean sex = rs.getBoolean("sex");
                        String avatar = rs.getString("avatar");

                        if (this.customers == null) {
                            customers = new ArrayList();
                        }

                        CustomerDTO customerDTO = new CustomerDTO(id, firstName, lastName, middleName, address, phone, sex, avatar, cusLevel);
                        this.customers.add(customerDTO);
                    }
                } else if (option == 1) { // search address
                    sql = "Select id, firstName, lastName, middleName, address, phone, cusLevel, sex, avatar "
                            + "From dbo.Customer Where address LIKE ?";

                    ps = con.prepareStatement(sql);
                    ps.setString(1, "%" + searchValue + "%");

                    rs = ps.executeQuery();

                    while (rs.next()) {
                        String id = rs.getString("id");
                        String firstName = rs.getString("firstName");
                        String lastName = rs.getString("lastName");
                        String middleName = rs.getString("middleName");
                        String address = rs.getString("address");
                        String phone = rs.getString("phone");
                        int cusLevel = rs.getInt("cusLevel");
                        boolean sex = rs.getBoolean("sex");
                        String avatar = rs.getString("avatar");

                        if (this.customers == null) {
                            customers = new ArrayList();
                        }

                        CustomerDTO customerDTO = new CustomerDTO(id, firstName, lastName, middleName, address, phone, sex, avatar, cusLevel);
                        this.customers.add(customerDTO);
                    }
                } else if (option == 2) { // search phone
                    sql = "Select id, firstName, lastName, middleName, address, phone, cusLevel, sex, avatar "
                            + "From dbo.Customer Where phone LIKE ?";

                    ps = con.prepareStatement(sql);
                    ps.setString(1, "%" + searchValue + "%");

                    rs = ps.executeQuery();

                    while (rs.next()) {
                        String id = rs.getString("id");
                        String firstName = rs.getString("firstName");
                        String lastName = rs.getString("lastName");
                        String middleName = rs.getString("middleName");
                        String address = rs.getString("address");
                        String phone = rs.getString("phone");
                        int cusLevel = rs.getInt("cusLevel");
                        boolean sex = rs.getBoolean("sex");
                        String avatar = rs.getString("avatar");

                        if (this.customers == null) {
                            customers = new ArrayList();
                        }

                        CustomerDTO customerDTO = new CustomerDTO(id, firstName, lastName, middleName, address, phone, sex, avatar, cusLevel);
                        this.customers.add(customerDTO);
                    }
                }
            }
        } finally {
            closeConnection();
        }
        return this.customers;
    }

    public CustomerDTO getCustomer(String idCustomer) throws SQLException, NamingException {
        CustomerDTO customerDTO = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "EXEC USP_GetCustomerById ?";

                ps = con.prepareStatement(sql);

                ps.setString(1, idCustomer);

                rs = ps.executeQuery();

                if (rs.next()) {
                    String id = rs.getString("id");
                    String firstName = rs.getString("firstName");
                    String lastName = rs.getString("lastName");
                    String middleName = rs.getString("middleName");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    int cusLevel = rs.getInt("cusLevel");
                    boolean sex = rs.getBoolean("sex");
                    String avatar = rs.getString("avatar");

                    if (this.customers == null) {
                        customers = new ArrayList();
                    }

                    customerDTO = new CustomerDTO(id, firstName, lastName, middleName, address, phone, sex, avatar, cusLevel);
                    return customerDTO;
                }
            }
        } finally {
            closeConnection();
        }
        return customerDTO;
    }

    public boolean deleteCustomer(String id) throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "Delete Customer Where id = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, id);

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
