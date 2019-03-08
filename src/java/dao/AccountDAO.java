package dao;

import dto.AccountDTO;
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
public class AccountDAO implements Serializable {

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

    public AccountDTO checkLogin(String username, String password) throws NamingException, SQLException {
        AccountDTO accountDTO = null;
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "EXEC USP_CheckLogin ?, ?";

                ps = con.prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, password);

                rs = ps.executeQuery();

                if (rs.next()) {
                    String user = rs.getString("username");
                    int role = rs.getInt("role");

                    accountDTO = new AccountDTO(user, "", role);
                    return accountDTO;
                }
            }
        } finally {
            closeConnection();
        }
        return accountDTO;
    }

    private List<AccountDTO> accounts;

    public List<AccountDTO> getAccounts() {
        return accounts;
    }

    public void loadAccounts() throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "select username, password, role from Account";

                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();

                while (rs.next()) {
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    int role = rs.getInt("role");

                    if (this.accounts == null) {
                        this.accounts = new ArrayList<>();
                    }

                    AccountDTO accountDTO = new AccountDTO(username, password, role);
                    this.accounts.add(accountDTO);
                }
            }
        } finally {
            closeConnection();
        }
    }

    public List<AccountDTO> searchAccountsByUsername(String searchValue) throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select username, password, role from Account WHERE username LIKE ?";

                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + searchValue + "%");

                rs = ps.executeQuery();

                while (rs.next()) {
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    int role = rs.getInt("role");

                    if (this.accounts == null) {
                        this.accounts = new ArrayList<>();
                    }

                    AccountDTO accountDTO = new AccountDTO(username, password, role);
                    this.accounts.add(accountDTO);

                }
            }
        } finally {
            closeConnection();
        }
        return this.accounts;
    }

    public boolean deleteAccount(String username) throws SQLException, NamingException {
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "delete account where username = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, username);

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

    public AccountDTO getAccount(String pk) throws SQLException, NamingException {
        AccountDTO accountDTO = null;
        try {
            con = DBUtils.getConnection();

            if (con != null) {
                String sql = "Select username, password, role From Account Where username = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, pk);

                rs = ps.executeQuery();

                if (rs.next()) {
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    int role = rs.getInt("role");

                    if (this.accounts == null) {
                        this.accounts = new ArrayList<>();
                    }

                    accountDTO = new AccountDTO(username, password, role);
                    return accountDTO;
                }
            }
        } finally {
            closeConnection();
        }
        return accountDTO;
    }
}
