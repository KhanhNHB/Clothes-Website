<%-- 
    Document   : home
    Created on : Mar 8, 2019, 7:01:54 PM
    Author     : Hello
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="css/home.css"/>
        <link rel="stylesheet" href="fontawesome-free-5.7.2-web/css/all.css"/>
        <style>
            * {
                margin: 0;
                padding: 0;
            }
            /* -----------------------------  DIsplay for staff --------------------------------------------- */
            .table-wrapper-product {
                width: 90%;
                margin: 60px auto;
                text-align: center;
            }
            .table-wrapper-product table {
                width: 100%;
                border-collapse: collapse;
                box-shadow: 0 5px 15px #333333;
            }
            .table-wrapper-product table thead {
                background: #333333;
                color: #ffffff;
                line-height: 50px;
            }
            #product-picture {
                width: 204px;
            }
            .table-wrapper-product table tbody tr {
                line-height: 0px;
            }
            th {
                width: 204px;
            }
            tr:nth-child(even) {
                background: lightblue;
            }
            .wrapper-create-new-product {
                width: 90%;
                display: block;
                margin: 0 auto;
            }
            .wrapper-create-new-product ul li {
                display: inline-block;
            }
            .wrapper-create-new-product #createNewProduct {
                width: 120px;
                height: 48px;
                border: none;
                transition: all .2s ease-in-out;
            }
            .wrapper-create-new-product #createNewProduct:hover {
                background: lightblue;
                color: #ffffff;
            }
        </style>
    </head>
    <body>

        <c:set var="customerDTO" value="${CUSTOMER}"/>
        <c:set var="accountDTO" value="${ACCOUNT}"/>
        <c:set var="products" value="${PRODUCTS}"/>

        <h1>
            <font color="red">
            Welcome ${customerDTO.lastName} ${customerDTO.middleName} ${customerDTO.firstName}
            </font>
        </h1>

                <c:if test="${not empty products}">
                    <div class="table-wrapper-product">
                        <table>
                            <thead>
                                <tr>
                                    <th id="No">#</th>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Picture</th>
                                    <th>Details</th>
                                    <th>Category ID</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="productDTO" items="${products}" varStatus="counter">
                                    <tr>
                                        <td>
                                            ${counter.count}
                                        </td>
                                        <td>
                                            ${productDTO.id}
                                        </td>
                                        <td>
                                            ${productDTO.name}
                                        </td>
                                        <td>
                                            ${productDTO.unitPrice}
                                        </td>
                                        <td>
                                            <img src="${productDTO.image}" alt="img" id="product-picture"/>
                                        </td>
                                        <td>
                                            ${productDTO.details}
                                        </td>
                                        <td>
                                            ${productDTO.categoryId}
                                        </td>
                                        <td>
                                            <a href="#"><i class="fas fa-edit fa-lg"></i></a>
                                        </td>
                                        <td>
                                            <c:url var="delLink" value="ProceServlet">
                                                <c:param name="btAction" value="DeleteProduct"/>
                                            </c:url>
                                            <a href="#"><i class="far fa-trash-alt fa-lg"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
                <c:if test="${empty products}">
                    <h1>
                        <font color="red">
                        List product is empty!!
                        </font>
                    </h1>
                </c:if>

                <div class="wrapper-create-new-product">
                    <ul>
                        <li> <a href="createNewProduct.jsp" id="createNewProduct">Create Product</a> </li>
                    </ul>
                </div>
        <script>

            document.addEventListener("DOMContentLoaded", function () {
                var lazyloadImages = document.querySelectorAll("img.lazy");
                var lazyloadThrottleTimeout;

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
                    }, 20);
                }

                document.addEventListener("scroll", lazyload);
                window.addEventListener("resize", lazyload);
                window.addEventListener("orientationChange", lazyload);
            });
            //# sourceURL=pen.js

        </script>
    </body>
</html>
