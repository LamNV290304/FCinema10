/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author LAM
 */
public class Employee{
    private int employee_id;
    private String username;
    private String password;
    private String avatar;
    private String fullname;
    private String birhtday;
    private String gender;
    private String email;
    private String city;
    private String phone;
    private String cinema;

    public Employee(int employee_id, String username, String password, String avatar, String fullname, String birhtday, String gender, String email, String city, String phone, String cinema) {
        this.employee_id = employee_id;
        this.username = username;
        this.password = password;
        this.avatar = avatar;
        this.fullname = fullname;
        this.birhtday = birhtday;
        this.gender = gender;
        this.email = email;
        this.city = city;
        this.phone = phone;
        this.cinema = cinema;
    }

    public Employee() {
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getBirhtday() {
        return birhtday;
    }

    public void setBirhtday(String birhtday) {
        this.birhtday = birhtday;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCinema() {
        return cinema;
    }

    public void setCinema(String cinema) {
        this.cinema = cinema;
    }
    
    
}
