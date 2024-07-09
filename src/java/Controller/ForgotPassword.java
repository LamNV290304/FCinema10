/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.UsersDAO;
import Model.User;
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

/**
 *
 * Date: 02/07/2024 Author: Nguyễn Việt Lâm Purpose: Chức năng Forgot Password
 */
public class ForgotPassword extends HttpServlet {

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
            out.println("<title>Servlet ForgotPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPassword at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String error = null;
        //Lấy giữ liệu từ JSP
        String answer1 = request.getParameter("answer1");
        String answer2 = request.getParameter("answer2");
        String answer3 = request.getParameter("answer3");

        try {

            //chuyển đổi ngày text sang date
            SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
            Date birth = dateFormat.parse(answer1);

            //lấy người dùng từ Databse
            UsersDAO loadUser = new UsersDAO();
            User user = loadUser.getUserByUsername(answer3);

            //kiểm tra xem người dùng tồn tại không
            if (user == null) {
                error = "Không tồn tại người dùng";
                throw new Exception();
            } else {
                //kiểm tra các câu trả lời
                if (user.getBirthday().compareTo(birth) != 0) {
                    error = "Sai thông tin ngày sinh";
                    throw new Exception();
                }
                if (!user.getEmail().equals(answer2)){
                    error = "Sai thông tin email";
                    throw new Exception();
                }
                
                request.setAttribute("user", user);
                request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            request.setAttribute("error", error);
            request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
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
