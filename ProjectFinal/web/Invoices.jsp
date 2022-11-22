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
        <script type="text/javascript" src="http://www.google.com/jsapi"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

        <script type="text/javascript">
            //load the Google Visualization API and the chart
            google.load('visualization', '1', {'packages': ['columnchart']});

            //set callback
            google.setOnLoadCallback(createChart);

            //callback function
            function createChart() {

                //create data table object
                var dataTable = new google.visualization.DataTable();

                //define columns
                dataTable.addColumn('string', '');
                dataTable.addColumn('number', 'Số tiền chi tiêu');
            <c:forEach items="${requestScope.listD}" var="i">
                //define rows of data

                dataTable.addRows([['${i.date}', ${i.amount}]]);
            </c:forEach>
//                dataTable.addRows([['Tổng', ${total}], ['${i.date}', ${i.price}]]);
                //instantiate our chart object
                var chart = new google.visualization.ColumnChart(document.getElementById('chart'));

                //define options for visualization
                var options = {width: 700, height: 300, is3D: true, title: 'Java Technologies for Web Applications'};

                //draw our chart
                chart.draw(dataTable, options);


            }
        </script>
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
        <form  action="orderd" method="">
            <div class  ="mainBody">
                <div class="container">
                    <div class="row">
                        <div class="span9">
                            <ul class="breadcrumb">
                                <li><a href="home">Home</a> <span class="divider">/</span></li>
                                <li class="active"> Hóa Đơn</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <h1>Hóa đơn</h1>
                <div class="table_info">
                    <table border="1px" width="40%">
                        <tr>
                            <th class="table_css">No</th>
                            <th class="table_css">Name</th>
                            <th class="table_css">Image</th>
                            <th class="table_css">Quantity</th>
                            <th class="table_css">Price</th>
                            <th class="table_css">Date</th>
                            <th class="table_css">Total money</th>


                        </tr>

                        <c:set var="tt" value="0"/>


                        <c:forEach items="${requestScope.listP}" var="i">
                            <c:set var="tt" value="${tt+1}"/>
                            <c:set var="total" value="${total+(i.price*i.quantity)}"/>
                            <tr>
                                <td class="table_css-td">${tt}</td>
                                <td class="table_css-td">${i.name}</td>
                                <td class="table_css-td"><img src="img/${i.img}" alt="alt"/></td>
                                <td class="table_css-td" style="text-align: center">

                                    ${i.quantity}

                                </td>

                                <td  class="table_css-td">
                                    $<fmt:formatNumber pattern="##.#" value="${i.price}"/>
                                </td>
                                <td class="table_css-td">${i.date}</td>
                                <td  class="table_css-td">
                                    $<fmt:formatNumber pattern="##.#" value="${(i.price*i.quantity)}"/>
                                </td>

                            </tr>


                        </c:forEach>

                    </table>
                </div>
                <h3>Tổng tiền đã mua:$ ${total}</h3>
                <hr/>		
                <div class="chart">
                    <div id="chart" class="chart">

                    </div>
                    <h3>THống kê số tiền để mua sản phẩm theo ngày mua</h3><br><br> <br>

                    <canvas id="myChart" style="width:100%;max-width:600px"></canvas>

                </div>
<!--                <script>
                    var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
                    var yValues = [55, 49, 44, 24, 15];
                    var barColors = [
                        "#b91d47",
                        "#00aba9",
                        "#2b5797",
                        "#e8c3b9",
                        "#1e7145"
                    ];

                    new Chart("myChart", {
                        type: "pie",
                        data: {
                            labels: xValues,
                            datasets: [{
                                    backgroundColor: barColors,
                                    data: yValues
                                }]
                        },
                        options: {
                            title: {
                                display: true,
                                text: "World Wide Wine Production 2018"
                            }
                        }
                    });
                </script>-->
        </form>
    </body>
</html>
