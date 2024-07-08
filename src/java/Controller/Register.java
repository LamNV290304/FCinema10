/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.User;
import dal.UsersDAO;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *  Date: 03/07/2024
 *  Author: Nguyễn Việt Lâm
 *  Purpose: Chức năng đăng kí
 */
public class Register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
      /**
     * Ktra nếu email hoặc username đã tốn tại trong db thì làm cái alert để chuyển sang login hoặc hiện lỗi cx đc
     *
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //khai báo chưa thông báo lỗi
            String error = null;
            
            //lấy dữ liệu từ JSP
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String rePassword = request.getParameter("re_password");
            String avatar = "";
            String fullName = request.getParameter("fullname");
            
            //birthday/ xử lí dữ liệu ngày sinh
            String birthDay = request.getParameter("birthday");
            SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
            Date birth = dateFormat.parse(birthDay);
            
            String gender = request.getParameter("r-gender");
            String email = request.getParameter("email");
            String city = request.getParameter("location");
            String phoneNumber = request.getParameter("phoneNumber");
            String role = "user"; // role mặc đinh là user

            if(!containSpace(username)){
                error = "Username không được có khoảng trống";
                request.setAttribute("error", error);
                throw new Exception();
            }
            //Kiểm tra xem người dùng nhập đúng chưa
            if (password.equals(rePassword)){ //xác nhận mật khẩu
                error = "Mật khẩu không trùng khớp";
                request.setAttribute("error", error);
                throw new Exception();
            }
            
            //Thêm người dùng vào cơ sở dữ liệu
            User user = new User(0, username, password, avatar, fullName, birth, gender, email, city, phoneNumber, role);
            UsersDAO loadUser = new UsersDAO();
            loadUser.addUser(user);
            
        } catch (Exception ex) {
            //trả lỗi về trang đăng kí
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
    
    private boolean containSpace(String username){
        // Duyệt qua từng ký tự trong phoneNumber
        for (int i = 0; i < username.length(); i++) {
            char ch = username.charAt(i);
            // Nếu ký tự có khoảng trống , trả về false
            if (!Character.isSpaceChar(ch)) {
                return false;
            }
        }
        // Nếu tất cả ký tự đều là số, trả về true
        return true;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
