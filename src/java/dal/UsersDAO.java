/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.User;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Dokkuhai
 */
public class UsersDAO extends DBContext{
    public Map<Integer, User> getAllUsers(){
        Map<Integer, User> list = new HashMap<>();
        try {
            String sql = "Select * from users";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()){
                User u = new User();
                u.setUser_id(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                list.put(u.getUser_id(), u);
            }
            rs.close();
            st.close();
        }
        catch (Exception e){
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public static void main(String[] args){
        UsersDAO uDao = new UsersDAO();
        Map<Integer,User> list = uDao.getAllUsers();
        for (int id : list.keySet()){
            System.out.println(list.get(id));
        }
   }
}
   
