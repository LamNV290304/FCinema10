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
import Model.User;
import dal.UsersDAO;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author LAM
 */
public class UpdateProfile extends HttpServlet {

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
            out.println("<title>Servlet UpdateProfile</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy thông tin từ form
            String fullName = request.getParameter("fullname");
            String phoneNumber = request.getParameter("phoneNumber");
            String email = request.getParameter("email");
            String birthdayStr = request.getParameter("birthday");
            String gender = request.getParameter("r-gender");
            String location = request.getParameter("location");
            
            // Chuyển đổi chuỗi ngày sinh sang đối tượng Date
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date birthday = dateFormat.parse(birthdayStr);
            
            // Lấy thông tin người dùng hiện tại từ session
            User currentUser = (User) request.getSession().getAttribute("user");
            
            // Cập nhật thông tin người dùng
            currentUser.setFullname(fullName);
            currentUser.setPhone(phoneNumber);
            currentUser.setEmail(email);
            currentUser.setBirthday(birthday);
            currentUser.setGender(gender);
            currentUser.setCity(location);
            
            // Gọi DAO để cập nhật vào cơ sở dữ liệu
            UsersDAO usersDAO = new UsersDAO();
            usersDAO.updateUser(currentUser);
            
            // Chuyển hướng về trang profile
            response.sendRedirect("profile.jsp");
        } catch (Exception e) {
            
        } finally {
            
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
