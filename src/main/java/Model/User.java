package Model;

public class User {
    private int id;
    private String name;
    private String loginName;
    private String loginPassword;
    private String role;
    private String dateOfBirth;
    private int gender;
    private String email;
    private String address;

    public User() {
    }

    public User(int id, String name, String loginName, String loginPassword, String role, String dateOfBirth, int gender, String email, String address) {
        this.id = id;
        this.name = name;
        this.loginName = loginName;
        this.loginPassword = loginPassword;
        this.role = role;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.email = email;
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getloginPassword() {
        return loginPassword;
    }

    public void setloginPassword(String loginPassword) {
        this.loginPassword = loginPassword;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
