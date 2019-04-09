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
            body {
                overflow-y: hidden;
            }
            /* ------------------- Nav ----------------- */
            .wrapper-nav {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 50px;
                background-color: #444753;
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
            .wrapper-nav ul li a,
            .wrapper-nav ul li button {
                text-decoration: none;
                text-align: center;
                font-size: 14px;
                font-family: arial;
                background: transparent;
                border: none;
                color: #ffffff;
                padding: 0 20px;
                cursor: pointer;
                margin: 0 10px;
                outline: none;
                position: relative;
            }
            .wrapper-nav ul li a:after,
            .wrapper-nav ul li button:after {
                display: block;
                content: "";
                width: 00%;
                height: 2px;
                background: #dfb400;
                transition: all 0.3s;
                position: absolute;
                transform: translateX(50%);
                right: 50%;
            }

            .wrapper-nav ul li a:hover:after, 
            .wrapper-nav ul li button:hover:after {
                opacity: 1;
                background: #dfb400;
                width: 100%;
            }
            .wrapper-nav .wrapper-welcome {
                margin-right: 60px;
                color: #fff;
            }
            .wrapper-nav .wrapper-welcome li  {
                float: right;
            }
            .wrapper-welcome li #btnLogout {
                border: none;
                background: inherit;
            }
            /* ------------------------------------------------------- */
            /* ---------------------Details Product------------------- */
            .wrapper-product-details {
                width: 50%;
                margin: 100px auto;
                line-height: 0;
                box-shadow: 0 2px 12px #333333;
                background: #f8f8f8;
            }
            .wrapper-product-image {
                display: inline-block;
            }
            .wrapper-product-image img {
                width: 387px;
                height: 529px;
            }
            .wrapper-product-info {
                width: 40%;
                display: inline-block;
                float: right;
                margin-right: 10px;
                line-height: 15px;
            }
            .product-info-left {
                display: inline-block;
            }
            .product-info-right {
                display: inline-block;
                text-align: right;
                float: right;
            }
            .wrapper-product-name, 
            .wrapper-product-price, 
            .wrapper-product-country,
            .wrapper-product-category, 
            .wrapper-product-size,
            .wrapper-prouct-quantity {
                padding: 14px;
                border-bottom: 1px solid #dddddd;
            }
            .wrapper-btnBuy #btnBuy {
                width: 98px;
                height: 48px;
                text-align: center;
                background: #444753;
                border: none;
                margin: 10px 0px;
                color: #ffffff;
                cursor: pointer;
                transition: all .2s ease-in-out;
            }
            #btnBuy:hover {
                background: #040404;
            }
        </style>
    </head>
    <body>
        <c:set var="accountDTO" value="${ACCOUNT}"/>
        <c:set var="customerDTO" value="${CUSTOMER}"/>
        <c:set var="product" value="${PRODUCT}"/>
        <c:set var="listSize" value="${SIZES}"/>
        <c:set var="category" value="${CATEGORY}"/>
        <c:set var="cart" value="${CART}"/>

        <nav class="wrapper-nav">
            <form action="ProcessServlet" method="POST">
                <c:choose>
                    <c:when test="${accountDTO.role == 1}"> 
                        <ul>

                        </ul>
                        <ul class="wrapper-welcome">

                        </ul>
                    </c:when>
                    <c:when test="${accountDTO.role == 2}"> 
                        <ul>

                        </ul>
                        <ul class="wrapper-welcome">

                        </ul>
                    </c:when>
                    <c:when test="${accountDTO.role == 3}"> 
                        <ul>
                            <li>
                                <button type="submit" name="btAction" value="Home">Home</button>
                            </li>
                            <li>
                                <button type="submit" name="btAction" value="Home">Product</button>
                            </li>
                            <li>
                                <button type="submit" name="btAction" value="Home">Contact</button>
                            </li>
                            <li>
                                <button type="submit" name="btAction" value="Home">About</button>
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
                    <c:otherwise></c:otherwise>
                </c:choose>
                </div>
            </form>
        </nav>

        <section>
            <form action="ProcessServlet" method="POST">
                <div class="wrapper-product-details">
                    <div class="wrapper-product-image">
                        <img src="${product.image}" alt="img"/>
                    </div>
                    <div class="wrapper-product-info">
                        <div class="wrapper-product-name">
                            <p class="product-info-left">Name:</p> 
                            <p class="product-info-right">${product.name}</p>
                        </div>
                        <div class="wrapper-product-country">
                            <p class="product-info-left">Country:</p> 
                            <p class="product-info-right">${product.country}</p>
                        </div>
                        <div class="wrapper-product-category">
                            <p class="product-info-left">Category:</p> 
                            <p class="product-info-right">${category.name}</p>
                        </div>
                        <div class="wrapper-prouct-quantity">
                            <p class="product-info-left">Quantity:</p> 
                            <p class="product-info-right"><select name="cboQuantity">
                                    <c:forEach var="counter" begin="1" end="10" step="1">
                                        <c:if test="${counter == 1}">
                                            <option selected="true">${counter}</option>
                                        </c:if>
                                        <c:if test="${counter != 1}">
                                            <option>${counter}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </p>
                        </div>
                        <div class="wrapper-product-price">
                            <p class="product-info-left">Price:</p> 
                            <p class="product-info-right">${product.unitPrice}</p>
                        </div>
                        <div class="wrapper-product-size">
                            <p class="product-info-left">Size:</p> 
                            <p class="product-info-right"><select name="cboSize">
                                    <c:forEach var="sizesDTO" items="${listSize}" varStatus="counter">
                                        <c:if test="${counter.count == 0}">
                                            <option selected="true">${sizesDTO.sizes}</option>
                                        </c:if>
                                        <c:if test="${counter.count != 0}">
                                            <option>${sizesDTO.sizes}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </p>
                        </div>
                        <div class="wrapper-btnBuy">
                            <input type="hidden" name="productId" value="${product.id}" />
                            <input type="hidden" name="productName" value="${product.name}" />
                            <input type="hidden" name="productImage" value="${product.image}" />
                            <input type="hidden" name="productPrice" value="${product.unitPrice}" />
                            <input type="submit" value="Buy" name="btAction" id="btnBuy"/>
                        </div>
                    </div>
                </div>
            </form>
        </section>
    </body>
</html>
