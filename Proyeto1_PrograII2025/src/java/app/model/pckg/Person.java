package app.model.pckg;

public class Person {

    private String id;
    private String userName;
    private String password;
    private String email;
    private String creationDate;
    private int userStatus;
    private int role;

    public Person() {
    }

    public Person(String id, String userName, String password, String email, String creationDate, int userStatus, int role) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.creationDate = creationDate;
        this.userStatus = userStatus;
        this.role = role;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(String creationDate) {
        this.creationDate = creationDate;
    }

    public int getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(int userStatus) {
        this.userStatus = userStatus;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Person{" + "id=" + id + ", userName=" + userName + ", password=" + password + ", email=" + email + ", creationDate=" + creationDate + ", userStatus=" + userStatus + ", role=" + role + '}';
    }

    
    
}
