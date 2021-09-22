/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.sql.PreparedStatement;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author mutsu
 */
public class Producto {
    private String producto,descripcion;
    private  int id_marca , existencia ;
    private  float precio_costo , precio_venta ;
    private Conexion cn;
  
    public Producto() {}

    public Producto(String producto, String descripcion, int id_marca, int existencia, float precio_costo, float precio_venta) {
        this.producto = producto;
        this.descripcion = descripcion;
        this.id_marca = id_marca;
        this.existencia = existencia;
        this.precio_costo = precio_costo;
        this.precio_venta = precio_venta;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public float getPrecio_costo() {
        return precio_costo;
    }

    public void setPrecio_costo(float precio_costo) {
        this.precio_costo = precio_costo;
    }

    public float getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(float precio_venta) {
        this.precio_venta = precio_venta;
    }
    
    
    
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        try{
            cn = new Conexion();
            String query = "select e.id_producto as id,e.producto,p.marca,e.descripcion,e.precio_costo,e.precio_venta,e.existencia, e.id_marca from productos as e inner join marcas as p on e.id_marca = p.id_marca order by id_producto;";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
String encabezado[] = {"id","producto","marca","descripcion","precio_costo","precio_venta","existencia","id_marca"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] =new String[8];
            while (consulta.next()){
            datos[0] = consulta.getString("id");
            datos[1] = consulta.getString("producto");
            datos[2] = consulta.getString("marca");
            datos[3] = consulta.getString("descripcion");
            datos[4] = consulta.getString("precio_costo");
            datos[5] = consulta.getString("precio_venta");
            datos[6] = consulta.getString("existencia");
            datos[7] = consulta.getString("id_marca");
            tabla.addRow(datos);
            
            }
            cn.cerrar_conexion();
            
        }catch(SQLException ex){
           System.out.println("Error" + ex.getMessage());  
        }
        return tabla;
    
    }
    

  public int agregar(){
        int retorno =0;
    try {
    PreparedStatement parametro;
    cn = new Conexion();
    String query="INSERT INTO productos(producto,id_marca,descripcion,precio_costo,precio_venta,existencia) VALUES(?,?,?,?,?,?);";
    cn.abrir_conexion();
    parametro=(PreparedStatement)cn.conexionBD.prepareStatement(query);
    parametro.setString(1, getProducto());
     parametro.setInt(2, getId_marca());
      parametro.setString(3, getDescripcion());
       parametro.setFloat(4, getPrecio_costo());
        parametro.setFloat(5, getPrecio_venta());
         parametro.setInt(6, getExistencia());
         
          
         retorno = parametro.executeUpdate();
    
    
    cn.cerrar_conexion();
        
        
    }catch(SQLException ex){
    System.out.println(ex.getMessage());
    retorno =0;
    }
    return retorno;
    }

 
    
    
}
