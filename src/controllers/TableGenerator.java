/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.ArrayList;
import java.util.Vector;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import models.BoughtMovie;
import models.Movie;
import models.Rented;
import models.RentedMovie;
import models.RentedRecord;
import models.User;

/**
 *
 * @author ivan_
 */
public class TableGenerator {
    private BlockBuster db;
    private ArrayList<Movie> movies;
    
    public TableGenerator()
    {
        db = new BlockBuster();
    }
    
    public DefaultTableModel getMovies()
    {
        ArrayList<Movie> mv = db.getMovies();
        
        Vector cabeceras = new Vector();
        cabeceras.addElement("ID");
        cabeceras.addElement("Titulo");
        cabeceras.addElement("Director");
        cabeceras.addElement("Año");
        cabeceras.addElement("Precio");
        cabeceras.addElement("Stock");
        cabeceras.addElement("Genero");
        cabeceras.addElement("Sinopsis");
        
        DefaultTableModel model = new DefaultTableModel(cabeceras, 0)
        {
             @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        
        mv.forEach(a->
        {
            Vector v = new Vector();
            v.addElement(a.getId());
            v.addElement(a.getTitle());
            v.addElement(a.getDirector());
            v.addElement(a.getYear());
            v.addElement(a.getPrice());
            v.addElement(a.getStock());
            v.addElement(a.getGenre());
            v.addElement(a.getSinopsis());
            model.addRow(v);
        });
        
        this.movies = mv;
        return model;
    }
    
    public DefaultTableModel getRentedMovies(String user)
    {
        ArrayList<Rented> mv = db.getRentedMovies(user);
        
        Vector cabeceras = new Vector();
        cabeceras.addElement("ID renta");
        cabeceras.addElement("Titulo");
        cabeceras.addElement("Director");
        cabeceras.addElement("Año");
        cabeceras.addElement("Fecha de prestamo");
        DefaultTableModel model = new DefaultTableModel(cabeceras, 0)
        {
             @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        
        mv.forEach(a->
        {
            Vector v = new Vector();
            v.addElement(a.getId());
            v.addElement(a.getTitle());
            v.addElement(a.getDirector());
            v.addElement(a.getYear());
            v.addElement(a.getDate());
            model.addRow(v);
        });
        
        return model;
    }
    
    public DefaultTableModel getRentedLog(String user)
    {
        ArrayList<RentedMovie> mv = db.getRentedLog(user);
        
        Vector cabeceras = new Vector();
        cabeceras.addElement("ID renta");
        cabeceras.addElement("Titulo");
        cabeceras.addElement("Director");
        cabeceras.addElement("Año");
        cabeceras.addElement("Fecha de prestamo");
        cabeceras.addElement("Fecha de regreso");
        DefaultTableModel model = new DefaultTableModel(cabeceras, 0)
        {
             @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        
        mv.forEach(a->
        {
            Vector v = new Vector();
            v.addElement(a.getId());
            v.addElement(a.getTitle());
            v.addElement(a.getDirector());
            v.addElement(a.getYear());
            v.addElement(a.getDate());
            v.addElement(a.getReturned());
            model.addRow(v);
        });
        
        return model;
    }

    TableModel getBuyLog(String username) {
        ArrayList<BoughtMovie> mv = db.getBuyLog(username);
        
        Vector cabeceras = new Vector();
        cabeceras.addElement("ID compra");
        cabeceras.addElement("Titulo");
        cabeceras.addElement("Director");
        cabeceras.addElement("Año");
        cabeceras.addElement("Fecha de transaccion");
        DefaultTableModel model = new DefaultTableModel(cabeceras, 0)
        {
             @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        
        mv.forEach(a->
        {
            Vector v = new Vector();
            v.addElement(a.getId());
            v.addElement(a.getTitle());
            v.addElement(a.getDirector());
            v.addElement(a.getYear());
            v.addElement(a.getDate());
            model.addRow(v);
        });
        
        return model;
    }
    
    public DefaultTableModel getUsers()
    {
        ArrayList<User> users = db.getUsers();
        Vector cabeceras = new Vector();
        cabeceras.addElement("Usuario");
        cabeceras.addElement("Nombre");
        cabeceras.addElement("Apellidos");
        cabeceras.addElement("Correo");
        cabeceras.addElement("Contraseña");
        
        DefaultTableModel model = new DefaultTableModel(cabeceras, 0)
        {
             @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        
        users.forEach(a->
        {
            Vector v = new Vector();
            v.addElement(a.getUsername());
            v.addElement(a.getFirstName());
            v.addElement(a.getLastName());
            v.addElement(a.getEmail());
            v.addElement(a.getPassword());
            model.addRow(v);
        });
        
        return model;
        
    }
    
    public DefaultTableModel getRentedLog()
    {
        ArrayList<RentedRecord> mv = db.getRentedLog();
        
        Vector cabeceras = new Vector();
        cabeceras.addElement("ID renta");
        cabeceras.addElement("Titulo");
        cabeceras.addElement("Usuario");
        cabeceras.addElement("Fecha de prestamo");
        cabeceras.addElement("Fecha de regreso");
        DefaultTableModel model = new DefaultTableModel(cabeceras, 0)
        {
             @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        
        mv.forEach(a->
        {
            Vector v = new Vector();
            v.addElement(a.getId());
            v.addElement(a.getTitle());
            v.addElement(a.getUser());
            v.addElement(a.getDate());
            v.addElement(a.getReturned());
            model.addRow(v);
        });
        
        return model;
    }
}
