

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/Newfolder/ckeditor/ckeditor.js"></script>


        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
        </style>
    </head>
    <body>

        <jsp:include page="Menu.jsp"></jsp:include>

            <div class="container">

                <div class="row">
                <jsp:include page="Left.jsp"></jsp:include>
                <c:set var="id" value="${detail.id}"/>
                <div class="col-sm-9">
                    <div class="container">
                        <div class="card">
                            <div class="row">
                                <aside class="col-sm-5 border-right">
                                    <article class="gallery-wrap"> 
                                        <div class="img-big-wrap">
                                            <div> <a href="#"><img src="img/${detail.image}"></a></div>
                                        </div> <!-- slider-product.// -->
                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3">${detail.name}</h3>

                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="currency">US $</span><span class="num">${detail.price}</span>
                                            </span> 
                                            <!--<span>/per kg</span>--> 
                                        </p> <!-- price-detail-wrap .// -->
                                        <dl class="item-property">
                                            <dt>Description</dt>
                                            <dd><p>${detail.description} </p></dd>
                                        </dl>
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <dl class="param param-inline">
                                                    <dt>Quantity: </dt>
                                                    <dd>
                                                        ${detail.quantity}
                                                    </dd>
                                                </dl>  <!-- item-property .// -->
                                            </div> <!-- col.// -->

                                        </div> <!-- row.// -->
                                        <hr>
                                        <form name="f" action="" method="post">
                                            <input class="btn btn-lg btn-outline-primary text-uppercase" type="button" 
                                                   onclick="buy('${id}')" value="Buy item"/>
                                        </form>
                                    </article> <!-- card-body.// -->
                                </aside> <!-- col.// -->
                            </div> <!-- row.// -->
                        </div> <!-- card.// -->


                    </div>
                </div>
            </div>

            <form action="addcomment" method="get">

                <H1 style="margin-left: 50px;margin-top: 50px; color: red;margin-bottom: 20px;">Đánh giá sản phẩm</h1>
                <div class="container_comment">
                    <input type="hidden" name="pid" value="${id}">
                    <textarea style="resize: none;width: 1020px;height: 175px; margin-left: 100px"   class="container_comment-info" 
                              name="comment"  id="ckeditor1" placeholder="Đánh giá sản phẩm"></textarea>
                    <input type="submit" value="submit">
                </div>



                <h1 style="margin-left: 50px;margin-top: 50px; color: red;margin-bottom: 20px;">Comment</h1>

                <c:forEach items="${requestScope.listComment}" var="d">
                    <br>
                    <div class="container_comment" style="border: 1px solid black; padding: 5px 30px">    
                        (ID${d.uid}) đã bình luận:${d.comment}
                    </div>
                </c:forEach>
            </form>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>

<script type="text/javascript">


    CKEDITOR.replace('ckeditor1');




</script> 