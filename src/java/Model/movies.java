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
    private String movieCens;
    private String movieGenres;
    private Date movieRelease;
    private String movieLenght;
    private String movieFormat;
    private String moviePoster;

    public movies(int movie_id, String movieName, String movieDescription, String movieTrailer, String movieCens, String movieGenres, Date movieRelease, String movieLenght, String movieFormat, String moviePoster) {
        this.movie_id = movie_id;
        this.movieName = movieName;
        this.movieDescription = movieDescription;
        this.movieTrailer = movieTrailer;
        this.movieCens = movieCens;
        this.movieGenres = movieGenres;
        this.movieRelease = movieRelease;
        this.movieLenght = movieLenght;
        this.movieFormat = movieFormat;
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

    public String getMovieCens() {
        return movieCens;
    }

    public void setMovieCens(String movieCens) {
        this.movieCens = movieCens;
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

    public String getMovieLenght() {
        return movieLenght;
    }

    public void setMovieLenght(String movieLenght) {
        this.movieLenght = movieLenght;
    }

    public String getMovieFormat() {
        return movieFormat;
    }

    public void setMovieFormat(String movieFormat) {
        this.movieFormat = movieFormat;
    }

    public String getMoviePoster() {
        return moviePoster;
    }

    public void setMoviePoster(String moviePoster) {
        this.moviePoster = moviePoster;
    }

    @Override
    public String toString() {
        return "movies{" + "movie_id=" + movie_id + ", movieName=" + movieName + ", movieDescription=" + movieDescription + ", movieTrailer=" + movieTrailer + ", movieCens=" + movieCens + ", movieGenres=" + movieGenres + ", movieRelease=" + movieRelease + ", movieLenght=" + movieLenght + ", movieFormat=" + movieFormat + ", moviePoster=" + moviePoster + '}';
    }
    
    
    
}
