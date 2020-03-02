<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <title>Editar cliente</title>
    </head>

    <body>
        <!-- Header -->
        <jsp:include page="/WEB-INF/components/header.jsp" />

        <form action="{pageContext.request.contextPath}/ServletControlador?accion=actualizar?id=${cliente.id}"
              method="POST" id="frmCliente">

            <!-- Botones de navegación -->
            <jsp:include page="/WEB-INF/components/botonesEdicion.jsp" />

            <div class="details container">
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <div class="card-header">
                                <h4>Editar Cliente</h4>
                            </div>
                            <div class="card-body">

                                <div class="form-group">
                                    <label for="nombres">Nombres:</label>
                                    <input type="text" class="form-control" name="nombres" id="nombres" value="${cliente.nombres}" >
                                </div>

                                <div class="form-group">
                                    <label for="apellidos">Apellidos:</label>
                                    <input type="text" class="form-control" name="apellidos" id="apellidos" value="${cliente.apellidos}" >
                                </div>

                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input type="email" class="form-control" name="email" id="email" value="${cliente.email}" >
                                </div>

                                <div class="form-group">
                                    <label for="telefono">Teléfono:</label>
                                    <input type="tel" class="form-control" name="telefono" id="telefono" value="${cliente.telefono}" >
                                </div>

                                <div class="form-group">
                                    <label for="saldo">Saldo:</label>
                                    <input type="number" class="form-control" name="saldo" id="saldo" value="${cliente.saldo}" >
                                </div>

                                <div id="errores" class="errores text-center"></div>

                            </div>

                            <div class="modal-footer">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <!-- Footer -->
        <jsp:include page="/WEB-INF/components/footer.jsp" />

        <script src="https://kit.fontawesome.com/c3a11b6600.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/validaciones.js"></script>
    </body>
</html>
