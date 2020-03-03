let c = console.log,
        d = document,
        enviarCliente = d.getElementById("enviarCliente"),
        frmCliente = d.getElementById("frmCliente");

const confirmarMensaje = (id, nombre) => {
    let nombreCliente = d.getElementById('nombreCliente'),
        inputId = d.getElementById('inputId');

    if(nombreCliente != null) {
        nombreCliente.textContent = nombre;
    }

    if(inputId != null) {
        inputId.value = id;
    }
}

if (enviarCliente != null) {
    enviarCliente.addEventListener('click', e => {
        e.preventDefault();

        let errores = [],
                erroresDiv = d.getElementById("errores");

        if (erroresDiv != null) {
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

        // Validar correo

        let pattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

        if (!pattern.test(email)) {
            errores['email'] = "Introduce un formato de correo válido.";
        }

        // Validar telefono

        pattern = /([+]\d{2})?\d{10}/;
        if (!pattern.test(telefono) || telefono.length > 15) {
            errores['telefono'] = "Introduce un formato de teléfono válido (sin espacios).";
        }

        // Validar saldo

        if (isNaN(saldo) || saldo <= 0) {
            errores['saldo'] = "Ingresa un saldo válido";
        } else {
            saldo = parseFloat(saldo);
        }

        if (Object.keys(errores).length == 0) {
            frmCliente.submit();
        } else {
            for (campo in errores) {
                if (erroresDiv != null) {
                    erroresDiv.innerHTML += `<h3>${errores[campo]}</h3>`;
                }
            }


        }

    });
}



