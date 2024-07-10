/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.movies;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.MovieDAO;
import java.util.ArrayList;

import jakarta.servlet.annotation.WebServlet;

import java.util.HashMap;
import java.util.Map;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.Map;
import java.util.ArrayList;



/**
 *
 * Date: 02/07/2024 
 * Author: Nguyễn Việt Lâm 
 * Purpose: Chức năng hiển thị Movie
 */


public class ListMovie extends HttpServlet {

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

         MovieDAO loadMovie = new MovieDAO();
        ArrayList<movies> listMovies = loadMovie.getAllMovies();
        
        //gửi sang view
        request.setAttribute("listMovies", listMovies);
        request.getRequestDispatcher("listmovie.jsp").forward(request, response);

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
        
        //lấy dữ liệu từ database
        MovieDAO loadMovie = new MovieDAO();
        ArrayList<movies> listMovies = loadMovie.getAllMovies();
        
        //gửi sang view
        request.setAttribute("listMovies", listMovies);
        request.getRequestDispatcher("listmovie.jsp").forward(request, response);
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
        processRequest(request, response);
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
