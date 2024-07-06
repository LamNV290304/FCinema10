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
import Model.*;
import dal.UsersDAO;
import jakarta.servlet.http.HttpSession;
import java.util.Map;

/**
 * Date: 03/07/2024 Author: Nguyễn Việt Lâm Purpose: Chức năng login
 */
public class Login extends HttpServlet {

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

        //lấy thông tin từ file JSP
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UsersDAO userLoad = new UsersDAO(); //Load các đối tượng từ database

        HttpSession session = request.getSession(); //tạo một session

        String error = null;
        if (userLoad.checkLogin(username, password) != null) {
            User customer = userLoad.getUserByUsername(username);//lấy customer theo username
            //gán các attribute vào trong session
            session.setAttribute("user", customer);

            //gửi đến trang khác
            response.sendRedirect("ListMovie");
        } else {
            // Gửi lỗi nếu có lỗi, lấy lỗi ở bên kia đi bạn hiền
            error = "Sai tài khoản hoặc mật khẩu";
            request.setAttribute("error", error);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

}
