/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *  Date: 14/06/2024
 *  Author: Nguyễn Việt Lâm
 *  Purpose: Model Admin
 */
public class Admin {
    private int admin_id;
    private String username;
    private String password;
    private String avartar;
    private String fullname;
    private String email;
    private String city;
    private String phone;

    public Admin(int admin_id, String username, String password, String avartar, String fullname, String email, String city, String phone) {
        this.admin_id = admin_id;
        this.username = username;
        this.password = password;
        this.avartar = avartar;
        this.fullname = fullname;
        this.email = email;
        this.city = city;
        this.phone = phone;
    }

    public Admin() {
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
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

    public String getAvartar() {
        return avartar;
    }

    public void setAvartar(String avartar) {
        this.avartar = avartar;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
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

    @Override
    public String toString() {
        return "Admin{" + "admin_id=" + admin_id + ", username=" + username + ", password=" + password + ", avartar=" + avartar + ", fullname=" + fullname + ", email=" + email + ", city=" + city + ", phone=" + phone + '}';
    }
    
    
}


