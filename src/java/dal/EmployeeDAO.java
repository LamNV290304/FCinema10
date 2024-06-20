/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Admin;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Dokkuhai
 */
public class EmployeeDAO extends DBContext{
    public Map<Integer, Admin> getAllEmployee(){
        Map<Integer, Admin> list = new HashMap<>();
        try {
            String sql = "Select * from admin";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()){
                Admin a = new Admin();
                a.setAdmin_id(rs.getInt("admin_id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                list.put(a.getAdmin_id(), a);
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
        AdminDAO aDao = new AdminDAO();
        Map<Integer,Admin> list = aDao.getAllAdmin();
        for (int id : list.keySet()){
            System.out.println(list.get(id));
        }
   }
}