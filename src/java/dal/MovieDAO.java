/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.movies;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

/**
 *  Date: 02/07/2024
 *  Author: Nguyễn Việt Lâm
 *  Purpose: Load Movie
 */
public class MovieDAO extends DBContext{
    public Map<Integer, movies> getAllMovies() {
        Map<Integer, movies> listMovies = new HashMap<>();
        try {
            String sql = "Select * from movies";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                movies movie = new movies();
                movie.setMovie_id(rs.getInt("movie_id"));
                movie.setMoviePoster(rs.getString("movie_poster"));
                movie.setMovieName(rs.getNString("movie_name"));
                movie.setMovieDescription(rs.getNString("movie_description"));
                movie.setMovieTrailer(rs.getString(rs.getString("movie_trailer")));
                movie.setMovieCens(rs.getString("movie_cens"));
                movie.setMovieGenres(rs.getNString("movie_genres"));
                movie.setMovieRelease(rs.getDate("movie_release"));
                movie.setMovieFormat(rs.getString("movie_format"));
                listMovies.put(movie.getMovie_id(), movie);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listMovies;
    }
    
    
}
