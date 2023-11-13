/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.proyectointegrador1.AccesoAdatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Lenovo
 */
public class Conexion {
  

    private static final String url = "jdbc:mariadb://localhost/";
    private static final String dataBase = "sistema_reportes_accidentes";
    private static final String user = "root";
    private static final String pass = "";
    private static Connection connection;

    public Conexion() {
    }

    public static Connection getConnection() {
        if (connection == null) {
            try {
                Class.forName("org.mariadb.jdbc.Driver");
                connection = (Connection) DriverManager.getConnection(url + dataBase + "?useLegacyDatetimeCode=false&serverTimezone=UTC" + "&user=" + user + "&password=" + pass);
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Error al conectarse a la DB " + ex.getMessage());
            } catch (ClassNotFoundException ex) {
                JOptionPane.showMessageDialog(null, "Error al cargar los drivers " + ex.getMessage());
            }
        }
        return connection;
    }
  
}
