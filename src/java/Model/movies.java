/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *  Date: 14/06/2024
 *  Author: Nguyễn Việt Lâm
 *  Purpose: Model movies
 */
public class movies {
    private int movie_id;
    private String movieName;
    private String movieDescription;
    private String movieTrailer;
    private String movieActress;
    private String movieGenres;
    private Date movieRelease;
    private String movieLength;
    private String movieDirector;
    private String moviePoster;

    public movies(int movie_id, String movieName, String movieDescription, String movieTrailer, String movieActress, String movieGenres, Date movieRelease, String movieLength, String movieDirector, String moviePoster) {
        this.movie_id = movie_id;
        this.movieName = movieName;
        this.movieDescription = movieDescription;
        this.movieTrailer = movieTrailer;
        this.movieActress = movieActress;
        this.movieGenres = movieGenres;
        this.movieRelease = movieRelease;
        this.movieLength = movieLength;
        this.movieDirector = movieDirector;
        this.moviePoster = moviePoster;
    }

    public movies() {
    }

    public int getMovie_id() {
        return movie_id;
    }

    public void setMovie_id(int movie_id) {
        this.movie_id = movie_id;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getMovieDescription() {
        return movieDescription;
    }

    public void setMovieDescription(String movieDescription) {
        this.movieDescription = movieDescription;
    }

    public String getMovieTrailer() {
        return movieTrailer;
    }

    public void setMovieTrailer(String movieTrailer) {
        this.movieTrailer = movieTrailer;
    }

    public String getMovieActress() {
        return movieActress;
    }

    public void setMovieActress(String movieActress) {
        this.movieActress = movieActress;
    }

    public String getMovieGenres() {
        return movieGenres;
    }

    public void setMovieGenres(String movieGenres) {
        this.movieGenres = movieGenres;
    }

    public Date getMovieRelease() {
        return movieRelease;
    }

    public void setMovieRelease(Date movieRelease) {
        this.movieRelease = movieRelease;
    }

    public String getMovieLength() {
        return movieLength;
    }

    public void setMovieLength(String movieLength) {
        this.movieLength = movieLength;
    }

    public String getMovieDirector() {
        return movieDirector;
    }

    public void setMovieDirector(String movieDirector) {
        this.movieDirector = movieDirector;
    }



    public String getMoviePoster() {
        return moviePoster;
    }

    public void setMoviePoster(String moviePoster) {
        this.moviePoster = moviePoster;
    }

    @Override
    public String toString() {
        return "movies{" + "movie_id=" + movie_id + ", movieName=" + movieName + ", movieDescription=" + movieDescription + ", movieTrailer=" + movieTrailer + ", movieActress=" + movieActress + ", movieGenres=" + movieGenres + ", movieRelease=" + movieRelease + ", movieLength=" + movieLength + ", movieDirector=" + movieDirector + ", moviePoster=" + moviePoster + '}';
    }

 
    
    
    
}
