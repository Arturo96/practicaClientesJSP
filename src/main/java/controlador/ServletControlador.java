
package controlador;

import datos.ClienteDaoJDBC;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Cliente;

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        List<Cliente> clientes = new ClienteDaoJDBC().getClientes();
        
        System.out.println("clientes = " + clientes);
        
        request.setAttribute("clientes", clientes);
        request.getRequestDispatcher("vista/listarClientes.jsp").forward(request, response);
    }
}
