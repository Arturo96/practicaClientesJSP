let c = console.log
d = document,
        enviarCliente = d.getElementById("enviarCliente");

enviarCliente.addEventListener('click', e => {
    e.preventDefault();

    
    let errores = [],
        erroresDiv = d.getElementById("errores");
        
        if(erroresDiv != null) {
            erroresDiv.innerHTML = "";
        }

// Recibimos los campos del formulario

    let nombres = d.getElementById("nombres").value,
            apellidos = d.getElementById("apellidos").value,
            email = d.getElementById("email").value,
            telefono = d.getElementById("telefono").value,
            saldo = d.getElementById("saldo").value;
    
    
    // Validar nombres

    if (nombres.length == 0 || !isNaN(nombres)) {
        errores['nombres'] = "Por favor, suministra los nombres";
    }
    
    // Validar apellidos

    if (apellidos.length == 0 || !isNaN(apellidos)) {
        errores['apellidos'] = "Por favor, suministra los apellidos";
    }
    
    if(Object.keys(errores).length == 0) {
        
    } else {
        for(campo in errores) {
            if(erroresDiv != null) {
                erroresDiv.innerHTML += `<h3>${errores[campo]}</h3>`;
            }
        }
        
        
    }
    
});

