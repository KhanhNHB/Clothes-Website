<%-- 
    Document   : viewProduct
    Created on : Mar 9, 2019, 7:05:35 PM
    Author     : Hello
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="fontawesome-free-5.7.2-web/css/all.css"/>
        <title>Details Product Page</title>
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
        </style>
    </head>
    <body>
        <c:set var="accountDTO" value="${ACCOUNT}"/>
        <c:set var="customerDTO" value="${CUSTOMER}"/>
        <c:set var="product" value="${PRODUCT}"/>
        <c:set var="listSize" value="${SIZES}"/>
        <c:set var="categgory" value="${CATEGORY}"/>
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
                        
        <form action="ProcessServlet" method="POST">
            <div class="wrapper-product-details">
                <div class="wrapper-product-image">
                    <img src="${product.image}" alt="img"/>
                </div>
                <div class="wrapper-product-info">
                    <div class="wrapper-product-name">
                        ${product.name}
                    </div>
                    <div class="wrapper-product-price">
                        ${product.unitPrice}
                    </div>
                    <div class="wrapper-product-country">
                        ${product.country}
                    </div>
                    <div class="wrapper-product-category">
                        ${category.name}
                    </div>
                    <div class="wrapper-product-size">
                        <select name="cboSize">
                            <c:forEach var="sizesDTO" items="${listSize}" varStatus="counter">
                                <c:if test="${counter.count == 0}">
                                    <option selected="true">${sizesDTO.sizes}</option>
                                </c:if>
                                <c:if test="${counter.count != 0}">
                                    <option>${sizesDTO.sizes}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="wrapper-prouct-quantity">
                        <select name="cboQuantity">
                            <c:forEach var="counter" begin="1" end="10" step="1">
                                <c:if test="${counter == 1}">
                                    <option selected="true">${counter}</option>
                                </c:if>
                                <c:if test="${counter != 1}">
                                    <option>${counter}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="wrapper-btnBuy">
                    <input type="hidden" name="productId" value="${product.id}" />
                    <input type="hidden" name="productName" value="${product.name}" />
                    <input type="hidden" name="productImage" value="${product.image}" />
                    <input type="hidden" name="productPrice" value="${product.unitPrice}" />
                    <input type="submit" value="Buy" name="btAction"/>
                </div>
            </div>
        </form>
    </body>
</html>
