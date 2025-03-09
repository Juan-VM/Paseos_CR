
package app.model.pckg;


public class User{
    
    private int id;
    private String user_name;
    private String email;
    private String pwd;
    private int user_status;

    public User(String user_name, String email, String pwd, int user_status) {
        this.user_name = user_name;
        this.email = email;
        this.pwd = pwd;
        this.user_status = user_status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setUser_status(int user_status) {
        this.user_status = user_status;
    }
    
    

    public int getId() {
        return id;
    }

    public String getUser_name() {
        return user_name;
    }

    public String getEmail() {
        return email;
    }

    public String getPwd() {
        return pwd;
    }

    public int getUser_status() {
        return user_status;
    }
    
    

}
