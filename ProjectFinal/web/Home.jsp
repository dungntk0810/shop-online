<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css?version=5123"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <form name="f" action="" method="post">
                <div class="container">
                    
                    <div class="row"style="margin-top: 110px">
                    <jsp:include page="Left.jsp"></jsp:include>
                        <div class="col-sm-9">
                            <div class="row" >
                                <input style="text-align: center; display: none" type="number" name="num" value="1"/>
                            <c:forEach items="${listP}" var="o">
                                <c:set var="id" value="${o.id}"/>
                                <div style="margin-bottom: 20px" class="col-12 col-md-6 col-lg-4">
                                    <div class="card">
                                        <img class="card-img-top" style="height: 180px" src="img/${o.image}" alt="Card image cap">

                                        <div class="card-body">
                                            <h4 class="card-title show_txt"><a href="detail?pid=${id}" title="View Product">${o.name}</a></h4>
                                            <p class="card-text show_txt">${o.title}</p>
                                            <div class="row">
                                                <div class="col">
                                                    <p class="btn btn-danger btn-block"><fmt:formatNumber pattern="##.#" value="${o.price}"/>$</p>
                                                </div>
                                                <div class="col">

                                                    <input class="btn btn-success btn-block" type="button" onclick="buy('${id}')" value="Buy item"/>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>
            </div>
        </form>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
crossorigin="anonymous"></script>
<script type="text/javascript">
                                                        function buy(id) {
                                                            var m = document.f.num.value;
                                                            document.f.action = "buy?id=" + id + "&num=" + m;
                                                            document.f.submit();
                                                        }
</script> 
