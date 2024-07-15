/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.cinemas;
import Model.movies;
import Model.schedule;
import dal.CinemasDAO;
import dal.MovieDAO;
import dal.ScheduleDAO;
import dal.bookingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dokkuhai
 */
public class CinemaBooking extends HttpServlet {

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
            out.println("<title>Servlet CinemaBooking</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CinemaBooking at " + request.getContextPath() + "</h1>");
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
        MovieDAO mDao = new MovieDAO();
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        
        movies getMovie = mDao.getMovieById(movieId);
        ScheduleDAO sDao = new ScheduleDAO();
        bookingDAO bDao = new bookingDAO();
        CinemasDAO cDao = new CinemasDAO();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        
        ArrayList<schedule> listSchedule = sDao.getScheduleMovieById(movieId);
        
        //schedule schedule_default =listSchedule.get(0);
        //schedule_date
        String get_date = request.getParameter("scheduleDate");
        ArrayList<schedule> listScheduleMovie = sDao.getScheduleMovieById(movieId);
        ArrayList<schedule> listScheduleValid = new ArrayList<>();
        Date getSchedule = null;
        try {
            getSchedule = df.parse(get_date);
        } catch (ParseException ex) {
            Logger.getLogger(ScheduleBooking.class.getName()).log(Level.SEVERE, null, ex);
        }
        for (schedule sc : listScheduleMovie) {
            if (sc.getScheduleDate().equals(getSchedule)) {
                listScheduleValid.add(sc);
                
            }
        }
        ArrayList<cinemas> listCinema = cDao.getAllCinemas();
        
        request.setAttribute("movie_booking", getMovie);
        request.setAttribute("listCinema", listCinema);
        request.setAttribute("get_date", get_date);
        request.getRequestDispatcher("cinemabooking.jsp").forward(request, response);
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
