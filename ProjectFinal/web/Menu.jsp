<%-- 
    Document   : Menu
    Created on : Oct 27, 2022, 11:24:01 PM
    Author     : mylov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--begin of menu-->
<html>
    <head>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css?version=523"/>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="home">SHOP</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">


                    <form action="search" method="post" class="form-inline my-2 my-lg-0">
                        <div  class="input-group input-group-sm">
                            <input value="${txts}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                        <a class="btn btn-success btn-sm ml-3" href="show">
                            <i class="fa fa-shopping-cart"></i> Cart
                        </a>
                        <ul class="navbar-nav m-auto">

                            <c:if test="${sessionScope.account==null}">
                                <div class="nav-item__login" >
                                    <a href="Login.jsp">Login</a>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.account != null}">
                                <li>
                                    <a class="fa fa-user" style="margin-left: 20px; font-size: 30px" href="#"></a>

                                    <ul class="nav__menu">
                                        <li class="nav-item">
                                            <a href="profile.jsp">Profile</a>
                                        </li>
                                        <c:if test="${sessionScope.account.isAdmin == 9}">
                                            <li class="nav-item">
                                                <a href="manager">Manage Product</a>
                                            </li>
                                        </c:if>
                                        <li class="nav-item">
                                            <a href="change.jsp">Change Password</a>
                                        </li>
                                        <c:if test="${sessionScope.account.isAdmin == 0}">
                                            <li class="nav-item">
                                                <a href="orderd">Hóa đơn</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.account.isAdmin == 1}">
                                            <li class="nav-item">
                                                <a href="selldetail">Hóa đơn</a>
                                            </li>
                                        </c:if>
                                        <li class="nav-item">
                                            <a href="logout">Logout</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>

                        </ul>
                    </form>
                </div>
            </div>
        </nav>

        <!--end of menu-->
    </body>