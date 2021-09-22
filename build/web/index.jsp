<%-- 
    Document   : index
    Created on : 30/08/2021, 19:00:53
    Author     : mutsu
--%>


<%@page import="modelo.Producto"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="modelo.Marca" %>
<%@page import="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos en web</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
          <div style="width:150px; height:150px; border: 1px whidth; background: url('img/tienda.png') no-repeat; background-size: contain; "></div>
         
          <h1>Productos</h1>  
         
        <div class="container">
            <form action="sr_producto" method="get" class="form-group">
           
             <label for="lbl_producto"><b>Producto</b></label>
             
            <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Ejemplo prod">    
             <label for="lbl_puesto"><b>Marca</b></label>
              <select name ="drop_sangre"  id="drop_sangre" class="form-control">
                 <% Marca marca = new Marca();
              HashMap<String,String> drop = marca.drop_sangre();
              for(String i: drop.keySet()){
                  out.println("<option value='"+ i +"' >" + drop.get(i) +"</option>");
                  }
              
              %>
                
            </select>
           
            
            <label for="lbl_descripcion"><b>Descripcion</b></label>
            <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="color,tamaño" >    
            <label for="lbl_precio_costo"><b>Precio Costo</b></label>
            <input type="txt" name="txt_precio_costo" id="txt_precio_costo" class="form-control" placeholder="ejemplo 1.00" >    
            <label for="lbl_precio_venta"><b>Precio Venta</b></label>
            <input type="txt" name="txt_precio_venta" id="txt_precio_venta" class="form-control" placeholder="Ejemplo 1.00 " >    
            <label for="lbl_existencia"><b>Existencia</b></label>
            <input type="number" name="txt_existencia" id="txt_existencia" class="form-control" placeholder="Ejemplo 1" >  
           
           
           <br>
          
            <br>
          <button  name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-danger">Agregar</button>
          <br>
          <br>
          <table class="table table-hover">
    <thead>
      <tr>
        <th> Producto</th>
        <th>Marca</th>
        <th>Descripcion</th>
        <th>Precio_costo</th>
        <th>Precio_venta</th>
        <th>Existencia</th>
        
      </tr>
    </thead>
    <tbody id="tbl_productos">
    <%
        Producto producto = new Producto();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = producto.leer();
        for (int t=0;t <tabla.getRowCount();t++){
            out.println("<tr data-id="+tabla.getValueAt(t, 0)+" data-idp="+tabla.getValueAt(t, 7)+">");
            out.println("<td>"+ tabla.getValueAt(t, 1)+"</td>");
            out.println("<td>"+ tabla.getValueAt(t, 2)+"</td>");
            out.println("<td>"+ tabla.getValueAt(t, 3)+"</td>");
            
            out.println("<td>"+ tabla.getValueAt(t, 4)+"</td>");
            out.println("<td>"+ tabla.getValueAt(t, 5)+"</td>");
            out.println("<td>"+ tabla.getValueAt(t, 6)+"</td>");
            
            out.println("</tr>");
        }
        
        %>
      
    </tbody>
  </table>
           </div>
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
    </body>
</html>
