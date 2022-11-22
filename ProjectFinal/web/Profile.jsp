<%-- 
    Document   : profile
    Created on : Nov 1, 2022, 1:52:13 AM
    Author     : mylov
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><b>User Information</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>

            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editUser" method="get">

                            <div class="modal-body">		

                                    <c:set var="id" value="${sessionScope.account.id}"/>
                                    <div class="form-group">

                                        <label>User Id</label>
                                        <input value="${id}" name="id" type="text" class="form-control" readonly required>
                                    </div>
                                    <div class="form-group">
                                        <label>User Name</label>
                                        <input value="${sessionScope.account.name}" name="name" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Phone number</label>
                                        <input value="${sessionScope.account.phone}" name="phone" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Address</label>
                                        <input value="${sessionScope.account.address}" name="address" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Country</label>
                                        <textarea name="country" class="form-control" required>${sessionScope.account.country}</textarea>
                                    </div>

                                    <div class="modal-footer">
                                        <input type="submit" class="btn btn-success" value="Edit"/>
                                        <button href="home" class="btn btn-success"><a href="home">Back</a></button>

                                    </div>

                            </div>


                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
