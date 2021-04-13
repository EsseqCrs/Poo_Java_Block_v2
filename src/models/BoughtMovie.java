/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author ivan_
 */
public class BoughtMovie {
    
    protected String id;
    protected String title;
    protected String year;
    protected String director;
    protected String date;

    public BoughtMovie(String id, String title, String year, String director, String date) {
        this.id = id;
        this.title = title;
        this.year = year;
        this.director = director;
        this.date = date;
    }

    public BoughtMovie() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
}
