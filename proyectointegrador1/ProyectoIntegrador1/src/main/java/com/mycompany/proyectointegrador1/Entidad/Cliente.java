/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.proyectointegrador1.Entidad;

import lombok.Data;

/**
 *
 * @author Lenovo
 */
@Data
public class Cliente {
  private String RazonSocial;
  private int Cuit_Cliente;
  private int IdCliente;
  private boolean estado;
    public Cliente() {
    }

    public Cliente(String RazonSocial, int Cuit_Cliente, int IdCliente, boolean estado) {
        this.RazonSocial = RazonSocial;
        this.Cuit_Cliente = Cuit_Cliente;
        this.IdCliente = IdCliente;
        this.estado = estado;
    }

    public Cliente(String RazonSocial, int Cuit_Cliente, boolean estado) {
        this.RazonSocial = RazonSocial;
        this.Cuit_Cliente = Cuit_Cliente;
        this.estado = estado;
    }

    


   
}
