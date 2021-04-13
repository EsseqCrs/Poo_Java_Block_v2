/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ivan_
 */
public class Database 
{
    private String DATABASE = "blockbuster";
    private String USER = "root";
    private String PASSWORD = "";
    private String SERVER = "localhost";
    
    private Connection connection;
    
    public Database()
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            connection = DriverManager.getConnection("jdbc:mysql://"+SERVER+"/"+DATABASE,USER,PASSWORD);
        } 
        catch (ClassNotFoundException | SQLException ex) 
        {
            System.out.println("No se pudo conectar a la base de datos- Razon: " + ex.getMessage());
        }
    }
    
    public Connection getDB()
    {
        return this.connection;
    }
    
    
}
