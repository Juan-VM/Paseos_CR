package app.dataBase.pckg;

import app.model.pckg.Event;
import app.model.pckg.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DbHelper {

    Connection conn;

    public DbHelper() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/PaseosCR", "root", "Admin$1234");
            if (conn == null) {
                throw new SQLException("No se pudo establecer la conexión con la base de datos.");
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DbHelper.class.getName()).log(Level.SEVERE, "Error: Driver de MySQL no encontrado.", ex);
            throw new SQLException("Error al cargar el driver MySQL.", ex);

        } catch (SQLException ex) {
            Logger.getLogger(DbHelper.class.getName()).log(Level.SEVERE, "Error al conectar con la base de datos.", ex);
            throw ex;
        }
    }

    public void close() {
        try {
            conn.close();
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
    }

    public ResultSet validateLogin(String email, String pswd) throws SQLException {
        try {
            PreparedStatement preState = conn.prepareStatement("SELECT * FROM usuarios WHERE email= ? AND pwd= ? AND user_status = 1;");
            preState.setString(1, email);
            preState.setString(2, pswd);
            ResultSet resultset = preState.executeQuery();
            return resultset;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public boolean saveUser(User user) throws SQLException {
        if (conn == null) {
            Logger.getLogger(DbHelper.class.getName()).log(Level.SEVERE, "Error: La conexión a la base de datos es NULL.");
            return false;
        }

        try {
            //otra forma
            PreparedStatement predStatement
                    = conn.prepareStatement(
                            "INSERT INTO usuarios (user_name, email, pwd, user_status) VALUES (?, ?, ?, ?)");

            predStatement.setString(1, user.getUser_name());
            predStatement.setString(2, user.getPwd());
            predStatement.setString(3, user.getEmail());
            predStatement.setInt(4, user.getUser_status());

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            Logger.getLogger(DbHelper.class.getName()).log(Level.SEVERE, "Error al guardar el usuario.", ex);
            return false;
        }
    }

    public boolean saveEvent(Event event) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("INSERT INTO paseos (e_userId, e_name, e_description, e_date, e_photo, e_ubication, e_tickets)"
                            + "VALUES (?, ?, ?, ?, ?, ?, ?)");

            predStatement.setInt(1, event.getUser_id());
            predStatement.setString(2, event.getName());
            predStatement.setString(3, event.getDescription());
            predStatement.setString(4, event.getDate());
            predStatement.setString(5, event.getPhoto());
            predStatement.setString(6, event.getUbication());
            predStatement.setInt(7, event.getTicketsAvailable());

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    //usuarios
    public ResultSet getUsers() throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM Users;");
            ResultSet resultset = predStatement.executeQuery();
            return resultset;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    //Boton de perfil
    public ResultSet getUser(int id) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM usuarios WHERE id=?;");
            predStatement.setInt(1, id);
            ResultSet resultset = predStatement.executeQuery();
            return resultset;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public int getUserId(String email) throws SQLException {
        int userId = 0;
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT id FROM usuarios WHERE email= ?;");
            predStatement.setString(1, email);
            ResultSet resultset = predStatement.executeQuery();
            userId = resultset.getInt("id");
            return userId;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return userId;
    }

    public ResultSet getEvents() throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM paseos;");
            ResultSet resultset = predStatement.executeQuery();
            return resultset;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public ResultSet getEvent(int eventId) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM paseos INNER JOIN usuarios ON paseos.e_userId = usuarios.id WHERE paseos.e_id = ?;");
            predStatement.setInt(1, eventId);
            return predStatement.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DbHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean updatePaseo(int paseoId, Event event) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("UPDATE paseos SET e_name = ?, e_description = ?, e_date = ?, e_ubication = ?, e_tickets = ? WHERE e_id = ?;");

            predStatement.setString(1, event.getName());
            predStatement.setString(2, event.getDescription());
            predStatement.setString(3, event.getDate());
            predStatement.setString(4, event.getUbication());
            predStatement.setInt(5, event.getTicketsAvailable());
            predStatement.setInt(6, paseoId);

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public boolean deleteEvent(int eventId, int user_id) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("DELETE FROM paseos WHERE e_id = ? AND e_userId = ?;");

            predStatement.setInt(1, eventId);
            predStatement.setInt(2, user_id);

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public boolean reservarPaseo(int paseoId, int userId, int r_tickets) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("INSERT INTO reservas(event_id, user_id, r_tickets) VALUES (?, ?, ?);");

            predStatement.setInt(1, paseoId);
            predStatement.setInt(2, userId);
            predStatement.setInt(3, r_tickets);

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public boolean actualizarTickets(int eventId, int newTickets) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("UPDATE paseos SET e_tickets = ? WHERE e_id = ?;");

            predStatement.setInt(1, newTickets);
            predStatement.setInt(2, eventId);
            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public ResultSet getTable(String table) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM ?;");
            predStatement.setString(1, table);
            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public ResultSet getTable(String table, String column, int id) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM ? WHERE ?= ?;");
            predStatement.setString(1, table);
            predStatement.setString(2, column);
            predStatement.setInt(3, id);
            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public ResultSet getReserves(int userId) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM reservas INNER JOIN paseos ON reservas.event_id = paseos.e_id WHERE reservas.user_id = ?;");
            predStatement.setInt(1, userId);

            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public ResultSet getReserv(int reservId) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM reservas WHERE reserv_id = ?;");
            predStatement.setInt(1, reservId);

            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public ResultSet getReservFullInfo(int reservId) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM reservas INNER JOIN paseos ON reservas.event_id = paseos.e_id WHERE reservas.reserv_id = ?;");
            predStatement.setInt(1, reservId);

            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public boolean cancelarReserva(int reservId) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("Delete from reservas WHERE reserv_id = ?;");

            predStatement.setInt(1, reservId);
            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public boolean actualizarReserva(int reservId, int newTickets) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("UPDATE reservas SET r_tickets = ? WHERE reserv_id = ?;");

            predStatement.setInt(1, newTickets);
            predStatement.setInt(2, reservId);
            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public boolean ActualizarPerfil(String email, String nombre, String pwd, int id) throws SQLException {
        String query = "UPDATE usuarios SET user_name = ?, pwd = ?, email = ? WHERE id = ?";

        try (PreparedStatement predStatement = conn.prepareStatement(query)) {
            predStatement.setString(1, nombre);
            predStatement.setString(2, pwd);
            predStatement.setString(3, email);
            predStatement.setInt(4, id);
            predStatement.executeUpdate();
            return true;
        }
    }

}
