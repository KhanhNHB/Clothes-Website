/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import cart.CartObj;
import dao.OrderDetailsDAO;
import dao.OrdersDAO;
import dto.OrderDetailsDTO;
import dto.OrdersDTO;
import dto.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
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
@WebServlet(name = "PayCart", urlPatterns = {"/PayCart"})
public class PayCart extends HttpServlet {

    final private String homePage = "homeForCustomer.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException, SQLException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            HttpSession session = request.getSession(false);
            if (session != null) {
                CartObj cart = (CartObj) session.getAttribute("CART");

                if (cart != null) {
                    java.util.Date utilDate = new java.util.Date();
                    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

                    String customerID = request.getParameter("txtCustomerID");
                    String totalPrice = request.getParameter("txtTotalPrice");

                    OrdersDAO ordersDAO = new OrdersDAO();

                    OrdersDTO ordersDTO = new OrdersDTO(sqlDate, customerID, Float.parseFloat(totalPrice));

                    boolean result = ordersDAO.addOrders(ordersDTO);
                    if (result) {
                        String productID;
                        int quantity;
                        double price;
                        double total;
                        int ordersID = ordersDAO.getMaxIdOrder();
                        
                        OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
                        OrderDetailsDTO orderDetailsDTO;
                        for (ProductDTO item : cart.values()) {
                            productID = item.getId();
                            quantity = item.getQuantity();
                            price = item.getUnitPrice();
                            total = item.totalPrice();
                            
                            orderDetailsDTO = new OrderDetailsDTO(productID, quantity, price, total, ordersID);
                            orderDetailsDAO.addOrderDetails(orderDetailsDTO);
                        }
                        
                        cart = null;
                        session.setAttribute("CART", cart);
                        response.sendRedirect(homePage);
                    }
                }
            }
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
        } catch (ParseException | SQLException | NamingException ex) {
            Logger.getLogger(PayCart.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException | SQLException | NamingException ex) {
            Logger.getLogger(PayCart.class.getName()).log(Level.SEVERE, null, ex);
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
