<%-- 
    Document   : viewCart
    Created on : Mar 10, 2019, 3:02:35 PM
    Author     : Hello
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="fontawesome-free-5.7.2-web/css/all.css"/>
        <title>View</title>
        <style>
            /* ------------------- Nav ----------------- */
            .wrapper-nav {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 50px;
                background-color: #007be8;
                box-shadow: 0 2px 20px rgba(0, 0, 0, 0.2);
                display: block;
                z-index: 999;
            }
            .wrapper-nav ul {
                margin-left: 60px;
            }
            .wrapper-nav ul li {
                list-style: none;
                display: inline-block;
                float: left;
            }
            .wrapper-nav ul li a {
                text-decoration: none;
                text-align: center;
                font-size: 14px;
                font-family: arial;
                color: #ffffff;
                padding: 0 20px;
                transition: all .25s ease;
            }
            .wrapper-nav ul li a:hover {
                color: #3395ed;
            }
            .wrapper-nav .wrapper-welcome {
                margin-right: 60px;
            }
            .wrapper-nav .wrapper-welcome li  {
                float: right;
            }
            .wrapper-welcome li #btnLogout {
                border: none;
                background: inherit;
            }
            /* -------------------------------------- */
            section {
                display: block;
                width: 90%;
                margin: 140px auto;
            }
            section .wrapper-product-details {
                display: grid;
                grid-template-columns: repeat(2, 4fr);
                width: 1190px;
                margin: 0 auto;
            }
            section table {
                line-height: 0;
                display: table;
                border-spacing: 0;
                border-collapse: 0;
                width: 100%;
                text-align: center;
                border: none;
            }
            section table tbody tr:nth-child(odd) {
                background: #f9f9f9;
            }
            section table tbody tr td {
                display: table-cell;
            }
            section table tbody tr td div {
                padding: 15px;

            }
            section table tbody tr td img {
                width: 70px;
                height: 100px;
            }
            section .wrapper-right {
                margin: 0 0 0 30px;
            }
        </style>
    </head>
    <body>
        <c:set var="customerDTO" value="${CUSTOMER}"/>
        <c:set var="accountDTO" value="${ACCOUNT}"/>
        <c:set var="cart" value="${CART}"/>

        <nav class="wrapper-nav">
            <form action="ProcessServlet" method="POST">
                <c:choose>
                    <c:when test="${accountDTO.role == 1}"> 
                        <ul>
                            <li> <a href="">Home</a>
                            </li>
                            <li>
                                <a href="#">Product</a>
                            </li>
                            <li>
                                <a href="#">Contact</a>
                            </li>
                            <li>
                                <a href="#">About</a>
                            </li>
                        </ul>
                        <ul class="wrapper-welcome">
                            <li>
                                <c:url var="viewYourCart" value="ProcessServlet">
                                    <c:param name="btAction" value="View Your Cart"/>
                                </c:url>       
                                <a href="${viewYourCart}">
                                    <i class="fas fa-shopping-cart"></i>
                                </a>

                                <c:if test="${not empty cart}">
                                    ${cart.size()}
                                </c:if>
                                <c:if test="${empty cart}">
                                    0
                                </c:if>
                            </li>
                            <li>
                                <c:url var="logoutLink" value="ProcessServlet">
                                    <c:param name="btAction" value="Logout"/>
                                </c:url>
                                <a href="${logoutLink}" id="btLogout">Log out</a>
                            </li>
                            <li>
                                <a href="#" alt="img">${customerDTO.lastName} ${customerDTO.middleName} ${customerDTO.firstName}</a>
                            </li>
                        </ul>
                    </c:when>
                    <c:when test="${accountDTO.role == 2}"> 
                        <ul>
                            <li> <a href="">Home</a>
                            </li>
                            <li>
                                <a href="#">Product</a>
                            </li>
                            <li>
                                <a href="#">Contact</a>
                            </li>
                            <li>
                                <a href="#">About</a>
                            </li>
                        </ul>
                        <ul class="wrapper-welcome">
                            <li>
                                <c:url var="viewYourCart" value="ProcessServlet">
                                    <c:param name="btAction" value="View Your Cart"/>
                                </c:url>       
                                <a href="${viewYourCart}">
                                    <i class="fas fa-shopping-cart"></i>
                                </a>

                                <c:if test="${not empty cart}">
                                    ${cart.size()}
                                </c:if>
                                <c:if test="${empty cart}">
                                    0
                                </c:if>
                            </li>
                            <li>
                                <c:url var="logoutLink" value="ProcessServlet">
                                    <c:param name="btAction" value="Logout"/>
                                </c:url>
                                <a href="${logoutLink}" id="btLogout">Log out</a>
                            </li>
                            <li>
                                <a href="#" alt="img">${customerDTO.lastName} ${customerDTO.middleName} ${customerDTO.firstName}</a>
                            </li>
                        </ul>
                    </c:when>
                    <c:when test="${accountDTO.role == 3}"> 
                        <ul>
                            <li> <a href="homeForCustomer.jsp">Home</a>
                            </li>
                            <li>
                                <a href="#">Product</a>
                            </li>
                            <li>
                                <a href="#">Contact</a>
                            </li>
                            <li>
                                <a href="#">About</a>
                            </li>
                        </ul>
                        <ul class="wrapper-welcome">
                            <li>
                                <c:url var="viewYourCart" value="ProcessServlet">
                                    <c:param name="btAction" value="View Your Cart"/>
                                </c:url>       
                                <a href="${viewYourCart}">
                                    <i class="fas fa-shopping-cart"></i>
                                </a>

                                <c:if test="${not empty cart}">
                                    ${cart.size()}
                                </c:if>
                                <c:if test="${empty cart}">
                                    0
                                </c:if>
                            </li>
                            <li>
                                <c:url var="logoutLink" value="ProcessServlet">
                                    <c:param name="btAction" value="Logout"/>
                                </c:url>
                                <a href="${logoutLink}" id="btLogout">Log out</a>
                            </li>
                            <li>
                                <a href="#" alt="img">${customerDTO.lastName} ${customerDTO.middleName} ${customerDTO.firstName}</a>
                            </li>
                        </ul>
                    </c:when>
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>
                </div>
            </form>
        </nav>

        <section>
            <c:if test="${not empty cart}">
                <div class="wrapper-product-details">
                    <div class="wrapper-left">
                        <table border="1">
                            <tbody>
                                <c:forEach var="rows" items="${cart}" varStatus="counter">
                                    <tr>
                                        <td>
                                            <img src="${rows.value.image}"/>
                                        </td>
                                        <td>
                                            <div class="product-name">${rows.value.name}</div>
                                            <div class="product-size">${rows.value.size}</div>
                                        </td>
                                        <td>
                                            <div>${rows.value.unitPrice}</div>
                                            <div>
                                                <select name="cboQuantity">
                                                    <c:forEach  var="counter" begin="1" end="10" step="1">
                                                        <c:if test="${counter == rows.value.quantity}">
                                                            <option selected="true">${counter}</option>
                                                        </c:if>
                                                        <c:if test="${counter != rows.value.quantity}">
                                                            <option>${counter}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                                <input type="submit" name="btAction" value="Update" />
                                            </div>
                                            <div> = ${rows.value.totalPrice()}</div>
                                        </td>
                                        <td>
                                            <div> <a href="#"><i class="far fa-trash-alt fa-lg"></i></a></div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <c:if test="${not empty customerDTO}">
                        <div class="wrapper-right">
                            <form action="ProcessSerlvet" method="POST">
                                <h4>Your Information</h4>
                                <div class="">
                                    <label for="txtFullname">Full Name </label>
                                    <input type="text" name="nameBuyer" value="" placeholder="Your full name" />
                                </div>
                                <div class="">
                                    <label for="txtPhone">Phone </label>
                                    <input type="text" name="txtPhoneBuyer" value="" placeholder="Your phone" />
                                </div>
                                <h4>Address</h4>
                                <div class="">
                                    <label for="txtProvince">Province </label>
                                    <input type="text" name="txtProvince" value="" placeholder="Your name" />
                                </div>
                                <div class="">
                                    <label for="txtDistric">District </label>
                                    <input type="text" name="txtDistrict" value="" placeholder="Your name" />
                                </div>
                                <div class="">
                                    <input type="submit" value="Buy" />
                                </div>
                        </div>
                    </c:if>
                </div>
            </c:if>
            <c:if test="${empty cart}">
                List cart is empty!
            </c:if>
        </section>
    </body>
</html>
