/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import dao.CategoryDAO;
import dao.CustomerDAO;
import dao.ProductDAO;
import dto.AccountDTO;
import dto.CategoryDTO;
import dto.CustomerDTO;
import dto.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "DisplayServlet", urlPatterns = {"/DisplayServlet"})
public class DisplayServlet extends HttpServlet {

    final private String homeForAdmin = "homeForAdmin.jsp";
    final private String homeForStaff = "homeForStaff.jsp";
    final private String homeForCustomer = "homeForCustomer.jsp";
    final private String homeForGuest = "home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String url = homeForAdmin;
            HttpSession session = request.getSession();

            AccountDTO accountDTO = (AccountDTO) session.getAttribute("ACCOUNT");

            CustomerDAO customerDAO = new CustomerDAO();
            CustomerDTO customerDTO = customerDAO.getCustomer(accountDTO.getUsername());
            session.setAttribute("CUSTOMER", customerDTO);

            ProductDAO productDAO = new ProductDAO();
            CategoryDAO categoryDAO = new CategoryDAO();

            List<ProductDTO> listProduct;
            List<CategoryDTO> listCategory;

            switch (accountDTO.getRole()) {
                case 1: // admin
                    break;
                case 2: // staff
                    int first = 0;
                    int last = 4;
                    int pages = 1;

                    // Get number of project in db
                    int totalProduct = productDAO.getCountProductsTotal();

                    if (totalProduct <= 5) {
                        last = totalProduct;
                    } else {
                        pages = totalProduct / 4;
                        if (totalProduct % 4 > 0) {
                            pages++;
                        }
                    }

                    // Get current button 
                    List<Integer> currentButton = (List<Integer>) session.getAttribute("CURRENTBUTTON");
                    // Get current page number
                    int currButton = 1; 
                    if (currentButton != null) {
                        currButton = currentButton.get(0);
                        if (currButton == 1) {
                            first = 0;
                        } else {
                            last = (currButton - 1) * 4;
                            first = last;
                        }
                        last = 4;
                    }

                    listProduct = productDAO.getListProductFromTo(first, last);
                    session.setAttribute("PRODUCTS", listProduct);

                    // Add number of button page at listPageTemp
                    List<Integer> listPageTemp = new ArrayList<>();
                    for (int i = 0; i < pages; i++) {
                        listPageTemp.add(i + 1);
                    }

                    // Check if number of pages greater 5
                    // just show 5 button pages
                    List<Integer> listPage = new ArrayList<>();
                    if (listPageTemp.size() > 5) {
                        int currPos = 0;
                        int start = 0;
                        // Middle button
                        final int middle = 5 / 2;
                        int end = last;
                        
                        if (currButton != 0) {
                            // Get position current button by value subtraction 1
                            currPos = currButton - 1;
                        }

                        if (currPos > middle) {
                            start = currPos - middle;
                            end = currPos + 2;
                            if (end >= listPageTemp.size()) {
                                end = listPageTemp.size() - 1;
                            }
                        }

                        for (int i = start; i <= end; i++) {
                            listPage.add(listPageTemp.get(i));
                        }
                        session.setAttribute("PAGES", listPage);
                    } else {
                        session.setAttribute("PAGES", listPageTemp);
                    }

                    listCategory = categoryDAO.getListCategory();
                    session.setAttribute("CATEGORYS", listCategory);

                    url = homeForStaff;
                    break;
                case 3: // customer
                    listProduct = productDAO.getListProduct();
                    listCategory = categoryDAO.getListCategory();

                    session.setAttribute("PRODUCTS", listProduct);
                    session.setAttribute("CATEGORYS", listCategory);

                    url = homeForCustomer;
                    break;
                default: // guest
            }

            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);

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
        } catch (SQLException | NamingException ex) {
            Logger.getLogger(DisplayServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException | NamingException ex) {
            Logger.getLogger(DisplayServlet.class.getName()).log(Level.SEVERE, null, ex);
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
