<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div class="modal fade" id="confirmarBorrado">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-info text-white">
                <h5 class="modal-title">Confirmación</h5>
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                
                <p class="red">Estás seguro de eliminar el cliente <span id="nombreCliente" ></span> ? </p>
                
            </div>
            <div class="modal-footer">
                <form action="${pageContext.request.contextPath}/ServletControlador?accion=borrar"
                      method="POST">
                    <input name="id" id="inputId" type="hidden" value="">
                    <button class="btn btn-danger" type="submit">Si</button>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">No</button>
                </form>
            </div>

        </div>
    </div>

</div>