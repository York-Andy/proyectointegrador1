/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.proyectointegrador1.Entidad;

import java.sql.Date;
import lombok.Data;

/**
 *
 * @author Lenovo
 */
@Data
public class Siniestro {
  private int IdSiniestro;
  private String Descripcion;
  private Date FechaDeSiniestro; 
  private Date FechaDeResoluccion;
  private Boolean estado;
  private int Cuit_Cliente;
}
