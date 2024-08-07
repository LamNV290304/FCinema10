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
 * Date: 03/07/2024 Author: Nguyễn Việt Lâm Purpose: Chức năng đăng kí
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
     * Ktra nếu email hoặc username đã tốn tại trong db thì làm cái alert để
     * chuyển sang login hoặc hiện lỗi cx đc
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //khai báo chưa thông báo lỗi
            String error = null;
            int errorNumber = 0; //set lỗi mã là 0 nếu không có lỗi

            //lấy dữ liệu từ JSP
            String username = request.getParameter("username").trim();
            
            String password = request.getParameter("password");
            String rePassword = request.getParameter("re_password");
            String avatar = "";
            String fullName = request.getParameter("fullname");

            //birthday xử lí dữ liệu ngày sinh
            String birthDay = request.getParameter("birthday");
            SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
            Date birth = dateFormat.parse(birthDay);

            String gender = request.getParameter("r-gender");
            String email = request.getParameter("email");
            String city = request.getParameter("location");
            String phoneNumber = request.getParameter("phoneNumber");
            String role = "user"; // role mặc đinh là user


            if (checkNumber(phoneNumber)) {
                error = "Số điện thoại không hợp lệ";
                errorNumber = 2;
                request.setAttribute("errorNumber", errorNumber);
                request.setAttribute("error", error);
                throw new Exception();
            }
            //Kiểm tra xem người dùng nhập đúng chưa
            if (!password.equals(rePassword)) { //xác nhận mật khẩu
                error = "Mật khẩu không trùng khớp";
                request.setAttribute("error", error);
                errorNumber = 3;
                request.setAttribute("errorNumber", errorNumber);
                throw new Exception();
            }

            //Thêm người dùng vào cơ sở dữ liệu
            User user = new User(0, username, password, avatar, fullName, birth, gender, email, city, phoneNumber, role);
            UsersDAO loadUser = new UsersDAO();
            loadUser.addUser(user);
            response.sendRedirect("index.html");

        } catch (Exception ex) {
            //trả lỗi về trang đăng kí
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }


    //kiểm tra xem có nhập đúng đủ 10 chữ số không
    private boolean checkNumber(String number) {
        if (number.length() != 10) { // kiểm tra xem có đủ 10 chữ số không
            return true; // trả về true
        }
        return false; // sai trả về false
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
