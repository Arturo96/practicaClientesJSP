package datos;

import java.sql.*;
import java.util.*;
import model.Cliente;

public class ClienteDaoJDBC {

    private static final String SQL_SELECT = "SELECT * FROM clientes";
    private static final String SQL_SELECT_BY_ID = "SELECT * FROM clientes WHERE id=?";
    private static final String SQL_INSERT = "INSERT INTO clientes"
            + "(nombres, apellidos, email, telefono, saldo) VALUES (?,?,?,?,?)";
    private static final String SQL_UPDATE = "UPDATE clientes SET "
            + "nombres=?, apellidos=?, telefono=?, saldo=? WHERE id=?";
    private static final String SQL_DELETE = "DELETE FROM clientes WHERE id=?";

    public List<Cliente> getClientes() {

        Connection conn = null;
        PreparedStatement st = null;
        ResultSet result = null;
        List<Cliente> clientes = new ArrayList<>();

        try {
            conn = Conexion.getConnection();
            st = conn.prepareStatement(SQL_SELECT);
            result = st.executeQuery();

            while (result.next()) {
                clientes.add(new Cliente(result.getInt(1), result.getString(2),
                        result.getString(3), result.getString(4),
                        result.getString(5), result.getDouble(6)));
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(result);
            Conexion.close(st);
            Conexion.close(conn);
        }

        return clientes;
    }

    public Cliente getClienteById(int id) {

        Connection conn = null;
        PreparedStatement st = null;
        ResultSet result = null;
        Cliente cliente = null;

        try {
            conn = Conexion.getConnection();
            st = conn.prepareStatement(SQL_SELECT_BY_ID);
            st.setInt(1, id);
            result = st.executeQuery();
            result.absolute(1);

            cliente = new Cliente(result.getInt(1), result.getString(2),
                    result.getString(3), result.getString(4),
                    result.getString(5), result.getDouble(6));

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(result);
            Conexion.close(st);
            Conexion.close(conn);
        }

        return cliente;
    }

    public String insert(Cliente cliente) {

        Connection conn = null;
        PreparedStatement st = null;
        int rows = 0;
        String mensaje = "";

        try {
            conn = Conexion.getConnection();
            st = conn.prepareStatement(SQL_INSERT);
            st.setString(1, cliente.getNombres());
            st.setString(2, cliente.getApellidos());
            st.setString(3, cliente.getEmail());
            st.setString(4, cliente.getTelefono());
            st.setDouble(5, cliente.getSaldo());
            rows = st.executeUpdate();
            
            mensaje = "Datos insertados correctamente";

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
            mensaje = "Error al insertar los datos: " + ex.getMessage();
        } finally {
            Conexion.close(st);
            Conexion.close(conn);
        }
       
        return mensaje;
    }
    
    public String update(Cliente cliente) {

        Connection conn = null;
        PreparedStatement st = null;
        int rows = 0;
        String mensaje = "";

        try {
            conn = Conexion.getConnection();
            st = conn.prepareStatement(SQL_UPDATE);
            st.setString(1, cliente.getNombres());
            st.setString(2, cliente.getApellidos());
            st.setString(3, cliente.getTelefono());
            st.setDouble(4, cliente.getSaldo());
            st.setInt(5, cliente.getId());
            rows = st.executeUpdate();
            
            mensaje = "Datos actualizados correctamente";

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
            mensaje = "Error al actualizar los datos: " + ex.getMessage();
        } finally {
            Conexion.close(st);
            Conexion.close(conn);
        }
       
        return mensaje;
    }
    
    public String delete(int id) {

        Connection conn = null;
        PreparedStatement st = null;
        int rows = 0;
        String mensaje = "";

        try {
            conn = Conexion.getConnection();
            st = conn.prepareStatement(SQL_DELETE);
            st.setInt(1, id);
            rows = st.executeUpdate();
            
            mensaje = "Datos eliminados correctamente";

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
            mensaje = "Error al eliminar los datos: " + ex.getMessage();
        } finally {
            Conexion.close(st);
            Conexion.close(conn);
        }
       
        return mensaje;
    }
}
