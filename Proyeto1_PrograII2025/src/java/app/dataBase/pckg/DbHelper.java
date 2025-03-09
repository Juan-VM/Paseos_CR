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

    public boolean validateLogin(String email, String pswd) throws SQLException {
        try {
            PreparedStatement preState = conn.prepareStatement("SELECT * FROM usuarios WHERE email= ? AND pwd= ? AND user_status = 1;");
            preState.setString(1, email);
            preState.setString(2, pswd);
            ResultSet resultset = preState.executeQuery();
            while (resultset.next()) {
                return true;
            }
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return false;
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
                    = conn.prepareStatement("INSERT INTO PageEvents (eventName, eventDescription, eventDate, photo, ubication, ticketsAvailable) VALUES (?, ?, ?, ?, ?, ?)");

            predStatement.setString(1, event.name);
            predStatement.setString(2, event.description);
            predStatement.setString(3, event.date);
            predStatement.setString(4, event.photo);
            predStatement.setString(5, event.ubication);
            predStatement.setInt(6, event.ticketsAvailable);

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

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

    public ResultSet getEvents() throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM Events;");
            ResultSet resultset = predStatement.executeQuery();
            return resultset;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }
}
