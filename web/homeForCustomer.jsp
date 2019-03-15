<%-- 
    Document   : homeForCustomer
    Created on : Mar 9, 2019, 8:25:41 AM
    Author     : Hello
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="fontawesome-free-5.7.2-web/css/all.css"/>
        <title>Home Page</title>
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
            .wrapper-products {
                display: grid;
                grid-gap: 5px;
                grid-template-columns: repeat(3, 1fr);
                width: 80%;
                margin: 140px auto;
            }
            .product {
                text-align: center;
                margin: 10px;
            }
            .product img {
                width: 100%;
                height: 407px;
                min-height: 100px;
                transition: all .3s ease-in-out;
            }
            .product img:hover {
                transform: scale(1.1);
            }
            .product a {
                cursor: pointer;
            }
            a:link, a:visited {

            }
            .product .product-info {
                padding: 20px;
            }
            .img-top {
                width: 100%;
                height: 407px;
            }
        </style>
    </head>
    <body>
        <c:set var="customerDTO" value="${CUSTOMER}"/>
        <c:set var="accountDTO" value="${ACCOUNT}"/>
        <c:set var="products" value="${PRODUCTS}"/>
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
            <c:if test="${not empty products}">
                <div class="wrapper-products">
                    <div class="product">
                        <div class="product-image">
                            <c:url var="viewLink" value="ProcessServlet">
                                <c:param name="btAction" value="View"/>
                                <c:param name="id" value="${products.get(0).id}"/>
                                <c:param name="name" value="${products.get(0).name}"/>
                                <c:param name="price" value="${products.get(0).unitPrice}"/>
                                <c:param name="image" value="${products.get(0).image}"/>
                                <c:param name="details" value="${products.get(0).details}"/>
                                <c:param name="categoryId" value="${products.get(0).categoryId}"/>
                                <c:param name="country" value="${products.get(0).country}"/>
                            </c:url>

                            <a href="${viewLink}" class="img-top"><img src="${products.get(0).image}" alt="img"/></a>
                        </div>
                        <div class="product-info">
                            <h3>${products.get(0).unitPrice}</h3>
                        </div>
                    </div>
                    <div class="product">
                        <div class="product-image">
                            <c:url var="viewLink" value="ProcessServlet">
                                <c:param name="btAction" value="View"/>
                                <c:param name="id" value="${products.get(1).id}"/>
                                <c:param name="name" value="${products.get(1).name}"/>
                                <c:param name="price" value="${products.get(1).unitPrice}"/>
                                <c:param name="image" value="${products.get(1).image}"/>
                                <c:param name="details" value="${products.get(1).details}"/>
                                <c:param name="categoryId" value="${products.get(1).categoryId}"/>
                                <c:param name="country" value="${products.get(1).country}" />
                            </c:url>
                            <a href="${viewLink}" class="img-top"><img src="${products.get(1).image}" alt="img"/></a>
                        </div>
                        <div class="product-info">
                            <h3>${products.get(1).unitPrice}</h3>
                        </div>
                    </div>
                    <div class="product">
                        <div class="product-image">
                            <c:url var="viewLink" value="ProcessServlet">
                                <c:param name="btAction" value="View"/>
                                <c:param name="id" value="${products.get(2).id}"/>
                                <c:param name="name" value="${products.get(2).name}"/>
                                <c:param name="price" value="${products.get(2).unitPrice}"/>
                                <c:param name="image" value="${products.get(2).image}"/>
                                <c:param name="details" value="${products.get(2).details}"/>
                                <c:param name="categoryId" value="${products.get(2).categoryId}"/>
                                <c:param name="country" value="${products.get(2).country}" />
                            </c:url>
                            <a href="${viewLink}" class="img-top"><img src="${products.get(2).image}" alt="img"/></a>
                        </div>
                        <div class="product-info">
                            <h3>${products.get(2).unitPrice}</h3>
                        </div>
                    </div>
                    <c:forEach begin="3" var="index" end="${products.size() - 1}" step="1">
                        <div class="product">
                            <div class="product-image">
                                <c:url var="viewLink" value="ProcessServlet">
                                    <c:param name="btAction" value="View"/>
                                    <c:param name="id" value="${products.get(index).id}"/>
                                    <c:param name="name" value="${products.get(index).name}"/>
                                    <c:param name="price" value="${products.get(index).unitPrice}"/>
                                    <c:param name="image" value="${products.get(index).image}"/>
                                    <c:param name="details" value="${products.get(index).details}"/>
                                    <c:param name="categoryId" value="${products.get(index).categoryId}"/>
                                    <c:param name="country" value="${products.get(index).country}" />
                                </c:url>
                                <a href="${viewLink}"><img class="lazy" data-src="${products.get(index).image}" alt="img"/></a>
                            </div>
                            <div class="product-info">
                                <h3>${products.get(index).unitPrice}</h3>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${empty products}">
                <h1>
                    <font color="red">
                    List product is empty!!
                    </font>
                </h1>
            </c:if>
        </section>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var lazyloadImages = document.querySelectorAll("img.lazy");
                var lazyloadThrottleTimeout;

                var lazy = [];
                lazy = document.getElementsByClassName('lazy');
                console.log(lazy.length);

                function lazyload() {
                    if (lazyloadThrottleTimeout) {
                        clearTimeout(lazyloadThrottleTimeout);
                    }

                    lazyloadThrottleTimeout = setTimeout(function () {
                        var scrollTop = window.pageYOffset;
                        lazyloadImages.forEach(function (img) {
                            if (img.offsetTop < window.innerHeight + scrollTop) {
                                img.src = img.dataset.src;
                                img.classList.remove('lazy');
                            }
                        });
                        if (lazyloadImages.length === 0) {
                            document.removeEventListener("scroll", lazyload);
                            window.removeEventListener("resize", lazyload);
                            window.removeEventListener("orientationChange", lazyload);
                        }
                    }, 15);
                }

                document.addEventListener("scroll", lazyload);
                window.addEventListener("resize", lazyload);
                window.addEventListener("orientationChange", lazyload);
            });
            //# sourceURL=pen.js
        </script>
    </body>
</html>
