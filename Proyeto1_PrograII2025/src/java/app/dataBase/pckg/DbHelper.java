
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
            conn = DriverManager.getConnection("jdbc:mysql://localhost/EventosCR", "root", "Admin$1234");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DbHelper.class.getName()).log(Level.SEVERE, null, ex);
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
            PreparedStatement preState = conn.prepareStatement("SELECT * FROM Users WHERE email= ? AND pswd= ? AND userStatus = 1;");
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
        try {
            //otra forma
            PreparedStatement predStatement = 
            conn.prepareStatement("INSERT INTO Users (ced, userName, pswd, email, creationDate, userStatus, ocupation) VALUES (?, ?, ?, ?, ?, ?, ?)");
            
            
            predStatement.setString(1, user.getId());
            predStatement.setString(2, user.getUserName());
            predStatement.setString(3, user.getPassword());
            predStatement.setString(4, user.getEmail());
            predStatement.setString(5, user.getCreationDate());
            predStatement.setInt(6, 1);
            predStatement.setString(7, "User");
            
            predStatement.executeUpdate();    
            
            return true;
            
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }        
    }
    
    public boolean saveEvent(Event event) throws SQLException {
        try {
            PreparedStatement predStatement = 
            conn.prepareStatement("INSERT INTO PageEvents (eventName, eventDescription, eventDate, photo, ubication, ticketsAvailable) VALUES (?, ?, ?, ?, ?, ?)");
            
            
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
            PreparedStatement predStatement =  conn.prepareStatement("SELECT * FROM Users;");
            ResultSet resultset = predStatement.executeQuery();
            return resultset;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }
    
    public ResultSet getEvents() throws SQLException {
        try {
            PreparedStatement predStatement =  conn.prepareStatement("SELECT * FROM Events;");
            ResultSet resultset = predStatement.executeQuery();
            return resultset;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }
}
