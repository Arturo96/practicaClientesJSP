
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
        
        ClienteDaoJDBC clientedao = new ClienteDaoJDBC();
        
        List<Cliente> clientes = clientedao.getClientes();
        
        request.setAttribute("clientes", clientes);
        request.setAttribute("saldoTotal", clientedao.getSaldoTotal());
        request.setAttribute("numClientes", clientedao.getNumClientes());
        
        request.getRequestDispatcher("vista/clientes.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        ClienteDaoJDBC clientedao = new ClienteDaoJDBC();
        
        
    }
}
