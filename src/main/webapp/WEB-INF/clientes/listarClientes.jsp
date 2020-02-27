<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="es_CO" />

<div class="container">
    <div class="clientes row">
        <div class="col-md-9">
            <div class="card">
                <div class="card-header">
                    <h3>Listado de clientes</h3>
                </div>
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nombre completo</th>
                            <th>Email</th>
                            <th>Teléfono</th>
                            <th>Saldo</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cliente" items="${clientes}">
                            <tr>
                                <td>${cliente.id}</td>
                                <td>${cliente.nombres} ${cliente.apellidos}</td>
                                <td>${cliente.email}</td>
                                <td>${cliente.telefono}</td>
                                <td><fmt:formatNumber value="${cliente.saldo}" type="currency" /></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/ServletClientes" class="btn btn-info">Editar</a>
                                    <!--  <a href="#" class="btn btn-danger">Eliminar</a> -->
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card bg-danger text-center text-white mb-3">
                <div class="card-body">
                    <h4>Saldo total: </h4>
                    <h3 class="font-light"><fmt:formatNumber value="${saldoTotal}" type="currency" /></h3> 
                </div>

            </div>

            <div class="card bg-success text-center text-white mb-3">
                <div class="card-body">
                    <h4>Número de clientes: </h4>
                    <h3 class="font-light"><i class="fas fa-users"></i> ${numClientes}</h3> 
                </div>

            </div>

        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/clientes/agregarCliente.jsp" />