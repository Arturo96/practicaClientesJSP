<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div class="modal fade" id="agregarClienteModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-info text-white">
                <h5 class="modal-title">Agregar cliente</h5>
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>


            <form id="frmCliente" action="${pageContext.request.contextPath}/ServletControlador?accion=insertar"
                  method="POST" class="was-validated">

                <div class="modal-body">

                    <div class="form-group">
                        <label for="nombres">Nombres:</label>
                        <input type="text" class="form-control" name="nombres" id="nombres" >
                    </div>

                    <div class="form-group">
                        <label for="apellidos">Apellidos:</label>
                        <input type="text" class="form-control" name="apellidos" id="apellidos" >
                    </div>

                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" name="email" id="email" >
                    </div>

                    <div class="form-group">
                        <label for="telefono">Teléfono:</label>
                        <input type="tel" class="form-control" name="telefono" id="telefono" >
                    </div>

                    <div class="form-group">
                        <label for="saldo">Saldo:</label>
                        <input type="number" class="form-control" name="saldo" id="saldo" >
                    </div>
                    
                    <div id="errores" class="errores text-center"></div>
                    
                </div>
                
                <div class="modal-footer">
                    
                    
                    <button id="enviarCliente" type="submit" class="btn btn-primary">Guardar</button>
                </div>

            </form>

        </div>
    </div>

</div>