

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Bootshop online Shopping cart</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <!--Less styles -->
        <!-- Other Less css file //different less files has different color scheam
             <link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
             <link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
             <link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
        -->
        <!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
        <script src="themes/js/less.js" type="text/javascript"></script> -->

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
        <div id="mainBody">
            <div class="container">
                <div class="row">
                    <div class="span9">
                        <ul class="breadcrumb">
                            <li><a href="home">Home</a> <span class="divider">/</span></li>
                            <li class="active"> SHOPPING CART</li>
                        </ul>
                        <hr class="soft"/>	
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Description</th>
                                    <th>Quantity/Update</th>
                                    <th>Price</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td> <img width="60" src="themes/images/products/4.jpg" alt=""/></td>
                                    <td>MASSA AST<br/>Color : black, Material : metal</td>
                                    <td>
                                        <div class="input-append">
                                            <input class="span1" style="max-width:34px" placeholder="1" id="appendedInputButtons" size="16" type="text">
                                            <button class="btn" type="button">-</button><button class="btn" type="button">+</button><button class="btn btn-danger" type="button">
                                                x</button>				
                                        </div>
                                    </td>
                                    <td>$120.00</td>                                
                                    <td>$110.00</td>
                                </tr>

                                <tr>
                                    <td colspan="6" style="text-align:right">Total Price:	</td>
                                    <td> $228.00</td>
                                </tr>
                            </tbody>
                        </table>
                        <table class="table table-bordered">
                            <tr><th>ESTIMATE YOUR SHIPPING </th></tr>
                            <tr> 
                                <td>
                                    <form class="form-horizontal">
                                        <div class="control-group">
                                            <label class="control-label" for="inputCountry">Name </label>
                                            <div class="controls">
                                                <input type="text" id="inputCountry" placeholder="Name">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="inputCountry">Country </label>
                                            <div class="controls">
                                                <input type="text" id="inputCountry" placeholder="Country">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label class="control-label" for="inputPost">Address</label>
                                            <div class="controls">
                                                <input type="text" id="inputPost" placeholder="Address">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <div class="controls">
                                                <button type="submit" class="btn">ESTIMATE </button>
                                            </div>
                                        </div>
                                    </form>				  
                                </td>
                            </tr>
                        </table>		
                        <a href="products.html" class="btn btn-large">Continue Shopping </a>
                        <a href="login.html" class="btn btn-large pull-right">Next</a>

                    </div>
                </div></div>
        </div>

    </body>
</html>
