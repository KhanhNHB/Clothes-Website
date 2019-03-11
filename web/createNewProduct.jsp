<%-- 
    Document   : createNewProduct
    Created on : Mar 8, 2019, 11:00:57 PM
    Author     : Hello
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Product Page</title>
    </head>
    <body>
        <c:set var="categorys" value="${CATEGORYS}"/>

        <div class="wrapper-create-product">
            <form action="ProcessServlet" method="POST">
                <div class="wrapper-detail-product">ID:</div> 
                <div class="wrapper-info-product"><input type="text" name="txtProductID" value="" /></div>

                <div class="wrapper-detail-product">Name:</div>          
                <div class="wrapper-info-product"><input type="text" name="txtProductName" value="" /></div>

                <div class="wrapper-detail-product">Price:</div>
                <div class="wrapper-info-product"><input type="text" name="txtProductPrice" value="" /></div>

                <div class="wrapper-detail-product">Image:</div>
                <div class="wrapper-info-product"><input type="text" name="txtProductImage" value="" /></div>

                <div class="wrapper-detail-product">Details:</div>
                <div class="wrapper-info-product"><input type="text" name="txtProductDetails" value="" /></div>

                <div class="wrapper-detail-product">Category ID:</div>
                <div class="wrapper-info-product">
                    <select name="cboCategory">
                        <c:forEach var="categoryDTO" items="${categorys}" varStatus="counter">
                            <c:if test="${counter.count == 0}" >
                                <option selected="true">${categoryDTO.name}</option>
                            </c:if>
                            <c:if test="${counter.count != 0}">
                                <option>${categoryDTO.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>

                <div class="wrapper-detail-product">Country:</div>
                <div class="wrapper-info-product"><input type="text" name="txtCountry" value="" /></div>

                <div class="wrapper-detail-product"> <input type="submit" value="Create Product" name="btAction"/> </div>
                <div class="wrapper-info-product"> <input type="reset" value="Reset" /> </div>
            </form>
        </div>
    </body>
</html>
