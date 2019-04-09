/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import dao.AccountDAO;
import dao.CreateNewAccountErrDAO;
import dto.AccountDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hello
 */
@WebServlet(name = "RegistrationAccountServlet", urlPatterns = {"/RegistrationAccountServlet"})
public class RegistrationAccountServlet extends HttpServlet {

    final private String loginPage = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String url = loginPage;
        String username = request.getParameter("txtUsername");
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txPassword");
        String confirmPassword = request.getParameter("txtConfirmPassword");
        CreateNewAccountErrDAO errors = new CreateNewAccountErrDAO();
        HttpSession session = request.getSession();

        try {

            boolean checkError = false;

            if (username.trim().length() < 3 || username.trim().length() > 20) {
                checkError = true;
                errors.setUsernameLengthError("Username is be range 3 - 20 character");
            }

            if (email.trim().length() < 1) {
                checkError = true;
                errors.setEmailLengthError("Email is not empty!");
            } else {
                if (!email.matches("\\w+@\\w+[.]\\w+([.]\\w+)?")) {
                    checkError = true;
                    errors.setEmailLengthError("Email is incorrect format!");
                }
            }

            if (password.trim().length() < 1) {
                checkError = true;
                errors.setPasswordLengthError("Password is not empty!");
            } else if (!confirmPassword.trim().equals(password)) {
                checkError = true;
                errors.setConfirmNotMatchPassword("Confirm not match password!");
            }

            if (checkError) {
                session.setAttribute("ERRORS", errors);
            } else {
                AccountDAO accountDAO = new AccountDAO();
                AccountDTO accountDTO = new AccountDTO(username, password, 3);

                boolean result = accountDAO.addAccount(accountDTO);
                if (result) {
                    
                }

            }
            
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);

        } catch (SQLException exception) {
            errors.setUsernameIsExisted("Username is existed!");
            session.setAttribute("ERRORS", errors);
        } catch (NamingException exception) {

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NamingException ex) {
            Logger.getLogger(RegistrationAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (NamingException ex) {
            Logger.getLogger(RegistrationAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
