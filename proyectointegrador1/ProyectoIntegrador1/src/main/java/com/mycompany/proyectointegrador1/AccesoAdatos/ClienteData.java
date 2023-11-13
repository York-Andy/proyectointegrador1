/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.proyectointegrador1.AccesoAdatos;

/**
 *
 * @author Lenovo
 */
import com.mycompany.proyectointegrador1.Entidad.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class ClienteData {

    private final Connection con;
    private ClienteData cliData;

    public ClienteData() {
        con = Conexion.getConnection();
    }

    public void nuevoCliente(Cliente cliente) {
        String sql = "INSERT INTO `clientes`(`RazonSocial`, `Cuit_Cliente`,'estado') VALUES (?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(2, cliente.getCuit_Cliente());
            ps.setString(1, cliente.getRazonSocial());
            ps.setBoolean(3, cliente.isEstado());
            int exito = ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                cliente.setIdCliente(rs.getInt(1));
                JOptionPane.showMessageDialog(null, "Cliente agregado");

            } else {
                JOptionPane.showMessageDialog(null, "Cliente no agregado");
            }
            ps.close();
            rs.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error en cargad de sql cliente");
        }

    }

    public void modificarCliente(Cliente cliente) {
        String sql = "UPDATE `clientes` SET `RazonSocial`=?,`Cuit_Cliente`=?,'estado'=? WHERE IdCliente=?";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cliente.getRazonSocial());
            ps.setInt(2, cliente.getCuit_Cliente());
            ps.setBoolean(3, cliente.isEstado());
            int exito = ps.executeUpdate();
            if(exito == 1){
            JOptionPane.showMessageDialog(null, "Cliente modificado");
            
            }else{
            JOptionPane.showMessageDialog(null, "Cliente NO  modificado");
            }
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error en acceder a bases de datos ");
        }

    }
    public List <Cliente>listarClientes (boolean estado){
    List <Cliente>clientes =new ArrayList<>();
    String sql ="SELECT * FROM clientes";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setBoolean(1, estado);
            ResultSet rs =ps.executeQuery();
            while(rs.next()){
            Cliente cliente = new Cliente();
            cliente.setIdCliente(rs.getInt("IdCliente"));
            cliente.setRazonSocial(rs.getString("RazonSocial"));
            cliente.setCuit_Cliente(rs.getInt("Cuit_Cliente"));
            cliente.setEstado(rs.getBoolean("estado"));
            
            clientes.add(cliente);
            }
            ps.close();
            rs.close();
        } catch (SQLException ex) {
          JOptionPane.showMessageDialog(null, "Error en acceder sql de Clinte listar");
        }
        return clientes;
    }
    public Cliente buscarClientePorCuit(int IdCliente){
    String sql ="SELECT  RazonSocial, Cuit_Cliente,'estado'WHERE IdCliente = ?";
    Cliente cliente = new Cliente();
        try {
            PreparedStatement ps =con.prepareStatement(sql);
            ps.setInt(1, IdCliente);
            ResultSet rs =ps.executeQuery();
            if(rs.next()){
            cliente.setRazonSocial(rs.getString("RazonSocial"));
            cliente.setCuit_Cliente(rs.getInt("Cuit_Cliente"));
            cliente.setEstado(rs.getBoolean("estado"));
            
            }
            ps.close();
            rs.close();
        } catch (SQLException ex) {
            JOptionPane.showInternalMessageDialog(null, "Error al aceder listar x IdCliente");
        }
        return cliente;
    
    
    }
     public Cliente buscarClientePorCuit(String RazonSocial){
    String sql ="SELECT  RazonSocial, Cuit_Cliente,'estado'WHERE IdCliente = ?";
    Cliente cliente = new Cliente();
        try {
            PreparedStatement ps =con.prepareStatement(sql);
            ps.setString(1, RazonSocial);
            ResultSet rs =ps.executeQuery();
            if(rs.next()){
            cliente.setIdCliente(rs.getInt("IdCliente"));
            cliente.setCuit_Cliente(rs.getInt("Cuit_Cliente"));
            cliente.setEstado(rs.getBoolean("estado"));
            
            }
            ps.close();
            rs.close();
        } catch (SQLException ex) {
            JOptionPane.showInternalMessageDialog(null, "Error al aceder listar x IdCliente");
        }
        return cliente;
    
    
    }
}
