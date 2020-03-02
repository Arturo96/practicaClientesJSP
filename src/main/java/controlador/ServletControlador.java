package controlador;

import datos.ClienteDaoJDBC;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Cliente;

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet {

    private void accionDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ClienteDaoJDBC clientedao = new ClienteDaoJDBC();

        List<Cliente> clientes = clientedao.getClientes();

        HttpSession session = request.getSession();
        
        session.setAttribute("clientes", clientes);
        session.setAttribute("saldoTotal", clientedao.getSaldoTotal());
        session.setAttribute("numClientes", clientedao.getNumClientes());
//        request.getRequestDispatcher("vista/clientes.jsp").forward(request, response);

        response.sendRedirect("vista/clientes.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "editar":
                    this.editarCliente(request, response);
                default:
                    
            }
        } 
        
        accionDefault(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if (accion != null) {
            switch (accion) {
                case "insertar":
                    this.insertarCliente(request, response);
                default:
                    
            }
        } 
        
        accionDefault(request, response);

    }
    
    private void insertarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String saldoString = request.getParameter("saldo");

        List<String> errores = validarCampos(nombres, apellidos, email, telefono, saldoString);

        if (errores.isEmpty()) {
            double saldo = Double.parseDouble(saldoString);
            ClienteDaoJDBC clientedao = new ClienteDaoJDBC();
            
            String mensajeInsert = clientedao.insert(new Cliente(0, nombres, apellidos, email, telefono, saldo));
//            request.setAttribute("mensajeInsert", mensajeInsert);
            System.out.println("mensajeInsert = " + mensajeInsert);
            
        } else {
            
            request.setAttribute("errores", errores);
            System.out.println("Errores: " + errores);
            
        }

    }

    private void editarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = -1;
        String idString = request.getParameter("id");
        if(esIdValido(idString)) id = Integer.parseInt(idString);
        
        ClienteDaoJDBC clientedao = new ClienteDaoJDBC();
        Cliente cliente = clientedao.getClienteById(id);
        
        if (cliente != null) {
            request.setAttribute("cliente", cliente);
        }
        
        String path = "/WEB-INF/clientes/editarCliente.jsp";
        
        request.getRequestDispatcher(path).forward(request, response);
        
    }
    
    private boolean esIdValido(String idString) {
        try {
            int id = Integer.parseInt(idString);
            return true;
        } catch (NumberFormatException ex) {
            return false;
        }
    }

    private List<String> validarCampos(String nombres, String apellidos,
            String email, String telefono, String saldoString) {

        boolean saldoValido = true;
        List<String> errores = new ArrayList<>();

        if (nombres == null || nombres.equals(" ")) {
            errores.add("nombres");
        }
        if (apellidos == null || apellidos.equals(" ")) {
            errores.add("apellidos");
        }
        if (email == null || email.equals(" ")) {
            errores.add("email");
        }
        if (telefono == null || telefono.equals(" ")) {
            errores.add("telefono");
        }
        
        try {
            double saldo = Double.parseDouble(saldoString);
            if (saldo < 0) saldoValido = false;
        } catch (Exception ex) {
            saldoValido = false;
        }
        
        if (!saldoValido) {
            errores.add("saldo");
        }

        return errores;
    }
}
