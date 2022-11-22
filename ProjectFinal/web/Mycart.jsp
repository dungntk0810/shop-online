<%-- 
    Document   : mycart
    Created on : Mar 4, 2022, 11:43:18 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table{
                border-collapse: collapse;
                max-width: 2000px;
            }
            #bag{
                text-align: right;
                margin-right: 30px;
                margin-top: 30px;
            }
            .tr{
                text-align: right;
            }
            .table_css-td{
                text-align: center;
                margin-right:   50px;
            }
            .table_css{


                padding: 0px 50px;
            }
            .table_info{
                margin-left: 20px;
            }
            .mainBody{
                margin-left: 200px;
            }
        </style>

        <meta charset="utf-8">
        <title>Bootshop online Shopping cart</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Bootstrap style --> 
        <link id="callCss" rel="stylesheet" href="css/bootstrap.min.css" media="screen"/>
        <link href="css/base.css" rel="stylesheet" media="screen"/>
        <!-- Bootstrap style responsive -->	
        <link href="css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css">
        <!-- Google-code-prettify -->	
        <link href="css/prettify.css" rel="stylesheet" type="text/css"/>
        <!-- fav and touch icons -->
        <link rel="shortcut icon" href="themes/images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="themes/images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="themes/images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="themes/images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="themes/images/ico/apple-touch-icon-57-precomposed.png">
        <style type="text/css" id="enject"></style>

    </head>
    <body>
        <div class  ="mainBody">
            <div class="container">
                <div class="row">
                    <div class="span9">
                        <ul class="breadcrumb">
                            <li><a href="home">Home</a> <span class="divider">/</span></li>
                            <li class="active"> SHOPPING CART</li>
                        </ul>
                    </div>
                </div>
            </div>

            <h1>Shopping cart online</h1>
            <div class="table_info">
                <table border="1px" width="40%">
                    <tr>
                        <th class="table_css">No</th>
                        <th class="table_css">Name</th>
                        <th class="table_css">Image</th>
                        <th class="table_css">Quantity</th>
                        <th class="table_css">Price</th>
                        <th class="table_css">Total money</th>
                        <th class="table_css">Action</th>
                    </tr>
                    <c:set var="o" value="${requestScope.cart}"/>

                    <c:set var="tt" value="0"/>
                    <c:forEach items="${o.items}" var="i">
                        <c:set var="tt" value="${tt+1}"/>
                        <tr>
                            <td class="table_css-td">${tt}</td>
                            <td class="table_css-td">${i.product.name}</td>
                            <td class="table_css-td"><img src="img/${i.product.image}" alt="alt"/></td>
                            <td class="table_css-td" style="text-align: center">
                                <button><a href="process?num=-1&id=${i.product.id}">-</a></button>
                                ${i.quantity}
                                <button><a href="process?num=1&id=${i.product.id}">+</a></button>
                            </td>
                            <td  class="table_css-td">
                                $<fmt:formatNumber pattern="##.#" value="${i.price}"/>
                            </td>
                            <td  class="table_css-td">
                                $<fmt:formatNumber pattern="##.#" value="${(i.price*i.quantity)}"/>
                            </td>
                            <td class="table_css-td" style="text-align: center">
                                <form action="process" method="post">
                                    <input type="hidden" name="id" value="${i.product.id}"/>
                                    <input type="submit" value="Return item"/>   
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <h3>Total money:$ ${o.totalMoney} </h3>
            <form action="process" method="post">
                    <h1>${ow}</h1>
                    </form>
            <hr/>
            <form action="checkout" method="post">
                <input type="submit" value="Check out"/>
            </form>
            <hr/>		
            <a style="font-size: 1.8rem; color: orange; margin-top: 20px;" href="shop">CLICK ME TO CONTINUE SHOPPING</a>
        </div>


    </body>
</html>
