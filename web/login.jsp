<%-- 
    Document   : login
    Created on : Mar 8, 2019, 6:31:20 PM
    Author     : Hello
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Login Page</title>
            <style>
                @import url('https://fonts.googleapis.com/css?family=Rubik:400,700');

                *{
                    font-family: 'Rubik', sans-serif;
                    box-sizing: border-box;
                }
                body {
                    overflow-y: hidden;
                }
                #form {
                    margin: 50px auto;
                    width: 450px;
                    padding:45px 30px 15px;
                    position: relative;
                    box-shadow: 5px 5px 25px rgba(0,0,0,.2);
                    border-radius: 3px;
                    background-color: #2c3e50;
                    height: 600px;
                    overflow: hidden;
                }

                #form #toggle-forms{
                    position: absolute;
                    padding: 10px;
                    top: 15px;
                    right: 30px;
                    border-radius: 20px;
                    overflow: hidden;
                    z-index: 99;
                }

                #form #toggle-forms > button {
                    border:none;
                    background-color: #34495e;
                    border: 1px solid #22303e;
                    color: #fff;
                    float:left;
                    border-bottom-right-radius: 20px;
                    border-top-right-radius: 20px;
                    padding:2px 10px;
                    cursor: pointer;
                    outline: none;
                }

                #form #toggle-forms > button:first-of-type{
                    border-right: 0;
                    border-bottom-right-radius: 0;
                    border-top-right-radius: 0;
                    border-top-left-radius: 20px;
                    border-bottom-left-radius: 20px;
                }

                #form #toggle-forms > button.active {
                    background-color: #dfb400;
                }

                #form form input:focus {
                    border-bottom-color: dodgerblue !important;
                }

                #form .row > button{
                    background-color: dodgerblue;
                }

                .left {
                    color: #fff;
                    margin-bottom: 20px;
                }

                .right {
                    text-align: left;
                    color: #000;
                    width: 100%;
                }
                .right input {
                    width: 100%;
                    padding: 10px;
                    border: none;
                    margin-bottom: 20px;
                }

                p {
                    color: #fff;
                    line-height: 31px;
                    display: inline-block;
                    width: 150px;
                    margin-top: 25px;
                    margin-bottom: -40px;
                }
                input {
                    height: 35px;
                    width: 230px;
                }
                .wrapper-form-login {
                    position: absolute;
                    width: 80%;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                }
                .wrapper-button-login-reset {
                    margin-top: 40px;
                    margin-bottom: 40px;
                }
                .right .wrapper-button-login-reset .right > input {
                    background: #444753;
                    color: #fff;
                    margin-right: 20px;
                    outline: none;
                    transition:  all 2s ease;
                }
                .wrapper-button-login-reset .right > input:hover {
                    background: #444753;
                    color: #fff;
                    cursor: pointer;
                }
                #form form {
                    padding:45px 30px 15px;
                    position: absolute;
                    top:0;
                    left: 0;
                    height: 100%;
                    width: 100%;
                    background-color: #2c3e50;
                    transition: all .3s linear;
                    z-index: 2;
                }

                #form form:last-of-type {
                    left: 100%
                }

                #form.active form:first-of-type {
                    left: -100% !important
                }

                #form.active form:last-of-type{
                    left:0 !important
                }

                @media (max-width: 767px) {
                    #form {
                        width: 290px !important;
                    }
                }
                .animate {
                    height: 100%;
                    display: block;
                    margin: 0;
                    padding: 0;
                    width: 100%
                }

                .animate > li {
                    position: absolute;
                    height: 50px;
                    width: 50px;
                    top: 100%;
                    left: 10px;
                    background-color:  rgba(255,255,255,.1);
                    z-index: -1;
                    overflow: hidden;
                    animation: move 10s linear infinite
                }

                .animate > li:nth-last-of-type(2) {
                    left: 70px;
                    animation-delay: 3.5s;
                    height: 15px;
                    width: 15px;
                }

                .animate > li:nth-last-of-type(3) {
                    left: 140px;
                    animation-delay: 3s
                }

                .animate > li:nth-last-of-type(4) {
                    left: 210px;
                    animation-delay: 5.5s
                }

                .animate > li:nth-last-of-type(5) {
                    left: 280px;
                    animation-delay: 1.8s;
                    height: 65px;
                    width: 65px
                }

                .animate > li:nth-last-of-type(6) {
                    left: 140px;
                    animation-delay: 6.8s;
                    height: 25px;
                    width: 25px
                }

                .animate > li:nth-last-of-type(7) {
                    left: 280px;
                    animation-delay: 5s;
                    height: 35px;
                    width: 35px
                }


                @keyframes move {
                    to {top: -50px;transform: rotate(360deg)}
                }

                .forgot{
                    color: dodgerblue
                }

                .forgot:hover {
                    text-decoration: underline;
                    cursor: pointer
                }

                a:link, a:visited {
                    color: #2087eb;
                }
                #btnLogin {
                    outline: none;
                }
                #btnReset {
                    outline: none;
                }
            </style>
    </head>
    <body>
        <c:set var="loginFail" value="${LOGINFAIL}"/>
        <c:set var="errors" value="${ERRORS}"/>

        <section id="form">
            <div id="toggle-forms">
                <button class="waves-effect waves-light active" id="login">Login</button>
                <button class="waves-effect waves-light" id="register">Register</button>
            </div>
            <form action="ProcessServlet" method="POST">
                <c:if test="${not empty loginFail}">
                    <h4>
                        <font color="red">${loginFail}</font>
                    </h4>
                </c:if>
                <div class="wrapper-form-login">
                    <div class="left">
                        Username
                    </div>
                    <div class="right">
                        <input type="text" name="txtUsername" value="" />
                    </div>

                    <div class="left">
                        Password
                    </div>
                    <div class="right">
                        <input type="password" name="txtPassword" value="" />
                    </div>

                    <div class="wrapper-button-login-reset">
                        <div class="right">
                            <input type="submit" value="Login" name="btAction" id="btnLogin" />
                        </div>
                        <div class="right">
                            <input type="reset" value="Reset" id="btnReset" />
                        </div>
                    </div>
                    <a href="#" class="forgot">Forgot Password?</a>
                    <ul class="animate">
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </form>

            <form action="ProcessServlet" method="POST">
                <p>
                    Username
                </p>
                <input name="txtUsername" type="text" value="${param.txtUsername}"/>
                <c:if test="${not empty errors.usernameLengthError}">
                    <h5>
                        <font color="red">
                            ${errors.usernameLengthError}
                        </font>
                    </h5>
                </c:if>

                <p>Email</p>
                <input name="txtEmail" value="${param.txtEmail}"/>
                <c:if test="${not empty errors.emailLengthError}">
                    <h5>
                        <font color="red">
                            ${errors.emailLengthError}
                        </font>
                    </h5>
                </c:if>

                <p>Password</p>
                <input name="txPassword" type="password" value="${param.txPassword}"/>
                <c:if test="${not empty errors.passwordLengthError}">
                    <h5>
                        <font color="red">
                            ${errors.passwordLengthError}
                        </font>
                    </h5>
                </c:if>

                <p>Confirm password</p>
                <input name="txtConfirmPassword" type="password" value="${param.txtConfirmPassword}"/>
                <c:if test="${not empty errors.confirmNotMatchPassword}">
                    <h5>
                        <font color="red">
                            ${errors.confirmNotMatchPassword}
                        </font>
                    </h5    >
                </c:if>

                <div class="wrapper-button-login-reset">
                    <div class="right">
                        <input type="submit" value="Register" name="btAction" />
                    </div>
                    <div class="right">
                        <input type="reset" value="Reset" />
                    </div>
                </div>
                <ul class="animate">
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </form>
            <c:if test="${not empty errors.confirmNotMatchPassword}">
                <h6>
                    <font color="red">
                        ${errors.usernameIsExisted}
                    </font>
                </h6>
            </c:if>
        </section>
    </body>
    <script>
        let $id = (id) => document.getElementById(id);
        var [login, register, form] = ['login', 'register', 'form'].map(id => $id(id));
        [login, register].map(element => {
            element.onclick = function () {
                [login, register].map($ele => {
                    $ele.classList.remove("active");
                });
                this.classList.add("active");
                this.getAttribute("id") === "register" ? form.classList.add("active") : form.classList.remove("active");
            }
        });
    </script>

    <script>
        history.pushState(null, null, location.href);
        window.onpopstate = function () {
            history.go(1);
        };
    </script>

</html>
