/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.movies;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import java.util.List;

import java.sql.Date;


/**
 * Date: 02/07/2024 Author: Nguyễn Việt Lâm Purpose: Load Movie
 */
public class MovieDAO extends DBContext {

    // Lấy hết thông tin phim từ database
    public ArrayList<movies> getAllMovies() {
        ArrayList<movies> listMovies = new ArrayList<>();
        try {
            //dùng câu lệnh sql để truy vấn
            String sql = "Select * from movies";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                //Set các đặc tính vào đối tượng
                movies movie = new movies();
                movie.setMovie_id(rs.getInt("movie_id"));
                movie.setMoviePoster(rs.getString("movie_poster"));
                movie.setMovieName(rs.getString("movie_name"));
                movie.setMovieDescription(rs.getString("movie_description"));
                movie.setMovieTrailer(rs.getString("movie_trailer"));
                movie.setMovieActress(rs.getString("movie_actress"));
                movie.setMovieGenres(rs.getString("movie_genres"));
                movie.setMovieRelease(rs.getDate("movie_release"));
                movie.setMovieLength(rs.getString("movie_length"));
                movie.setMovieDirector(rs.getString("movie_director"));

                //thêm vào trong danh sách
                listMovies.add(movie);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null; //nếu có lỗi trả về null
        }
        return listMovies; //trả vè list
    }

    // Hàm xóa một bộ phim theo movie_id
    public boolean deleteMovie(int movieId) {
        try {
            //dùng câu lệnh sql để truy vấn
            String sql = "DELETE FROM movies WHERE movie_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            //Set các đặc tính vào vị trí trong câu truy vấn
            ps.setInt(1, movieId);

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;//Trả về nếu không thành công
        }
        return true; //Trả về nếu thành công
    }

    // Hàm cập nhật thông tin phim
    public boolean updateMovie(movies movie) {
        try {
            //dùng câu lệnh sql để truy vấn
            String sql = "UPDATE movies SET movie_poster = ?, movie_name = ?, movie_description = ?, movie_trailer = ?, movie_actress = ?, movie_genres = ?, movie_release = ?, movie_length = ?, movie_director = ? WHERE movie_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            //Set các đặc tính vào vị trí trong câu truy vấn
            ps.setString(1, movie.getMoviePoster());
            ps.setString(2, movie.getMovieName());
            ps.setString(3, movie.getMovieDescription());
            ps.setString(4, movie.getMovieTrailer());
            ps.setString(5, movie.getMovieActress());
            ps.setString(6, movie.getMovieGenres());
            ps.setDate(7, (Date) movie.getMovieRelease());
            ps.setString(8, movie.getMovieLength());
            ps.setString(9, movie.getMovieDirector());
            ps.setInt(10, movie.getMovie_id());

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;//Trả về nếu không thành công
        }
        return true; //Trả về nếu thành công
    }

    // Hàm thêm một bộ phim mới
    public boolean addMovie(movies movie) {
        try {
            //dùng câu lệnh sql để truy vấn
            String sql = "INSERT INTO movies (movie_poster, movie_name, movie_description, movie_trailer, movie_actress, movie_genres, movie_release, movie_length, movie_director) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);

            //Set các đặc tính vào vị trí trong câu truy vấn
            ps.setString(1, movie.getMoviePoster());
            ps.setString(2, movie.getMovieName());
            ps.setString(3, movie.getMovieDescription());
            ps.setString(4, movie.getMovieTrailer());
            ps.setString(5, movie.getMovieActress());
            ps.setString(6, movie.getMovieGenres());
            ps.setDate(7, (Date) movie.getMovieRelease());
            ps.setString(8, movie.getMovieLength());
            ps.setString(9, movie.getMovieDirector());

            // Thực thi câu lệnh
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false; // Trả về nếu không thành công
        }
        return true; // Trả về nếu thành công
    }

    //Tìm đối phim theo id
    public movies getMovieById(int id){
        try {
            //dùng câu lệnh sql để truy vấn
            String sql = "SELECT * FROM movies WHERE movie_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);

            //Set các đặc tính vào vị trí trong câu truy vấn
            ps.setInt(1, id);

            // Thực thi câu lệnh
            ResultSet rs = ps.executeQuery();

            // Nếu tìm thấy phim với id tương ứng
            if (rs.next()) {
                movies movie = new movies();
                movie.setMovie_id(rs.getInt("movie_id"));
                movie.setMoviePoster(rs.getString("movie_poster"));
                movie.setMovieName(rs.getString("movie_name"));
                movie.setMovieDescription(rs.getString("movie_description"));
                movie.setMovieTrailer(rs.getString("movie_trailer"));
                movie.setMovieActress(rs.getString("movie_actress"));
                movie.setMovieGenres(rs.getString("movie_genres"));
                movie.setMovieRelease(rs.getDate("movie_release"));
                movie.setMovieLength(rs.getString("movie_length"));
                movie.setMovieDirector(rs.getString("movie_director"));
                return movie;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null; // Trả về null nếu không tìm thấy phim hoặc có lỗi xảy ra
        }
        return null; // Trả về null nếu không tìm thấy phim hoặc có lỗi xảy ra
    }
    
    
    public static void main(String[] args) {
        MovieDAO mDao = new MovieDAO();

        List<movies> list = mDao.getAllMovies();
        for (movies id : list) {
            System.out.println(list);
        }

        


    }

}
