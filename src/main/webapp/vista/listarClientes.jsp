
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>Listado de clientes</title>
    </head>
    
    <style>
        th {
            text-align: center;
        }
        
        td {
            vertical-align: initial !important;
            text-align: center;
        }
        
        td:nth-child(2) {
            text-align: left;
        }
    </style>
    <body>
        <div class="container">
            <h1 class="text-center my-4">Listado de clientes</h1>
            
            <table class="table table-bordered table-hover">
                <thead>
                    <th>Id</th>
                    <th>Nombre completo</th>
                    <th>Email</th>
                    <th>Teléfono</th>
                    <th>Saldo</th>
                    <th>Acción</th>
                </thead>
                <tbody>
                    <c:forEach var="cliente" items="${clientes}">
                        <tr>
                            <td>${cliente.id}</td>
                            <td>${cliente.nombres} ${cliente.apellidos}</td>
                            <td>${cliente.email}</td>
                            <td>${cliente.telefono}</td>
                            <td>${cliente.saldo} $</td>
                            <td>
                                <a href="#" class="btn btn-info">Editar</a>
                                <a href="#" class="btn btn-danger">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        
    </body>
</html>
