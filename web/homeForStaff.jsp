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
        <link rel="stylesheet" href="fontawesome-free-5.7.2-web/css/all.css"/>
        <style>
            body {

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
            }
            .wrapper-nav .wrapper-welcome li  {
                float: right;
            }
            .wrapper-welcome li #btnLogout {
                border: none;
                background: transparent;
            }
            /* ------------------------------------------------------------------- */
            /* -------------------------  Display for staff -----------------------*/
            .table-wrapper-product {
                width: 90%;
                margin: 0 auto;
                margin-top: 90px;
                text-align: center;
            }
            .table-wrapper-product table {
                width: 100%;
                border-collapse: collapse;
                box-shadow: 0 5px 15px #333333;
            }
            .table-wrapper-product table thead,  
            .table-wrapper-product table tfoot {
                background: #444753;
                color: #ffffff;
                line-height: 50px;
            }
            #product-picture {
                width: 204px;
            }
            .table-wrapper-product table tbody tr {
                line-height: 0px;
            }
            .table-wrapper-product table thead th {
                width: 90px;
            }
            a:link, a:visited
            button:link, button:visited {
                color: #000;
            }
            /*--------------------------- WRAPPER PAGING BUTTON CREATE PRODUCT ------------------------------*/
            .wrapper-option-paging {
                width: 90%;
                display: block;
                margin: 0 auto;
                text-align: center;
            }
            /*---------------------- PAGINATION -----------------------------*/
            .wrapper-pagination {
                width: 100%;
                margin: 0 auto;
                text-align: center;
            }
            .wrapper-pagination ul li {
                list-style: none;
                display: inline-block;
                width: 80px;
                cursor: pointer;
            }
            .wrapper-pagination ul li a {
                text-decoration: none;
                display: inline-block;
                width: 50px;
                height: 20px;
                background: #444753;
                color: #fff;
                transition: all .2s ease;
            }
            .wrapper-pagination ul li a:hover {
                background: #dfb400;
            }
            /*------------------------ BUTTON CREATE ---------------------------------------*/
            .wrapper-create-new-product {
                width: 100%;
                margin: 0 auto;
            }
            .wrapper-create-new-product ul li {
                display: inline-block;
            }
            .wrapper-create-new-product #btnCreateNewProduct {
                display: inline-block;
                width: 120px;
                height: 38px;
                border: none;
                transition: all .2s ease-in-out;
                background: #007be8;
                color: #ffffff;
            }
            .wrapper-create-new-product #btnCreateNewProduct:hover {
                color: #3395ed;
            }
            #btnUpdate {
                width: 133px;
                height: 48px;
                text-align: center;
                background: #dfb400;
                border: none;
                color: #fff;
                cursor: pointer;
                float: right;
                margin-top: -1px;
                margin-right: -1px;
                margin-bottom: -1px;
                outline: none;
            }
            button {
                outline: none;
                cursor: pointer;
            }

        </style>
    </head>
    <body>
        <c:set var="customerDTO" value="${CUSTOMER}"/>
        <c:set var="accountDTO" value="${ACCOUNT}"/>
        <c:set var="products" value="${PRODUCTS}"/>
        <c:set var="pages" value="${PAGES}"/>
        <c:set var="currButton" value="${CURRENTBUTTON}"/>

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
                            <li>
                                <button type="submit" name="btAction" value="Home">Home</button>
                            </li>
                            <li>
                                <button type="submit" name="btAction" value="Home">Product</button>
                            </li>
                            <li>
                                <button type="submit" name="btAction" value="btnCreateProduct" id="btnCreateNewProduct">Create Product</button>
                            </li>
                            <li>
                                <button type="submit" name="btAction" value="Home">About</button>
                            </li>
                        </ul>
                        <ul class="wrapper-welcome">
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

                        </ul>
                        <ul class="wrapper-welcome">

                        </ul>
                    </c:when>
                    <c:otherwise></c:otherwise>
                </c:choose>
                </div>
            </form>
        </nav>

        <c:if test="${not empty products}">
            <div class="table-wrapper-product">
                <form action="ProcessServlet" method="POST">
                    <table>
                        <thead>
                            <tr>
                                <th id="No">
                                    #
                                </th>
                                <th>
                                    ID
                                </th>
                                <th>
                                    Name
                                </th>
                                <th>
                                    Price
                                </th>
                                <th>
                                    Picture
                                </th>
                                <th>
                                    Details
                                </th>
                                <th>
                                    Category ID
                                </th>
                                <th>
                                    Edit
                                </th>
                                <th>
                                    Status
                                </th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <td colspan="9">
                                    <button type="submit" value="DeleteProduct" id="btnUpdate" name="btAction">Delete</button>
                                </td>
                            </tr>
                        </tfoot>
                        <tbody>
                            <c:forEach var="productDTO" items="${products}" varStatus="counter">
                                <tr style="height: 80px;">
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
                                        <img src="${productDTO.image}" alt="img" id="product-picture" style="width: 90px; height: 100px;"/>
                                    </td>
                                    <td>
                                        ${productDTO.details}
                                    </td>
                                    <td>
                                        ${productDTO.categoryId}
                                    </td>
                                    <td>
                                        <c:url var="updateLink" value="ProcessServlet">
                                            <c:param name="btAction" value="UpdateProduct"/>
                                            <c:param name="productID" value="${productDTO.id}"/>
                                        </c:url>
                                        <a href="${updateLink}">
                                            <i class="fas fa-edit fa-lg"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="status" value="${productDTO.id}" 
                                               <c:if test="${productDTO.status}"> checked</c:if>
                                                   />
                                        </td>
                                    </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
        </c:if>
        <c:if test="${empty products}">
            <h1>
                <font color="red">
                List product is empty!!
                </font>
            </h1>
        </c:if>

        <div class="wrapper-option-paging">
            <div class="wrapper-pagination">
                <ul>
                    <c:forEach var="page" items="${pages}" varStatus="counter">
                        <li>
                            <c:url var="pageLink" value="ProcessPageServlet">
                                <c:param name="currentButton" value="${page}"/>
                            </c:url>
                            <a href="${pageLink}" id="${counter.count}"
                               <c:if test="${page eq currButton.get(0)}">
                                   style="background:#dfb400; pointer-events: none"
                               </c:if>
                               >${page}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </body>
</html>
