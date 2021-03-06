<%@page import="logica.Venta"%>
<%@page import="java.util.Date"%>
<%@page import="logica.Servicio"%>
<%@page import="logica.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Alta Venta</title>

	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">  <!-- Google web font "Open Sans" -->
	<link rel="stylesheet" href="css/fontawesome-all.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/magnific-popup.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
	<link rel="stylesheet" href="css/tooplate-style.css">
    </head>
    <body>
        <%
        HttpSession misesion = request.getSession();
        String usuario = (String) misesion.getAttribute("usuario");
        String contrasenia = (String) misesion.getAttribute("contrasenia");
        int idEmpleado = (Integer) misesion.getAttribute("idEmpleado");
            if(usuario == null){
                response.sendRedirect("login.jsp");
            }
            else{
        %>
        <div class="container">
            <div class="table-responsive custom-table-responsive tm-bg-transparent-black">
                <header class="col-xl-12"><h2 class="tm-text-shadow">Seleccione el cliente</h2></header>
                <input type="text" class="form-control" id="myInput" onkeyup="myFunction()" placeholder="Buscar por DNI">
                <form name="formModificarVentaServicio" action="SvModificarVentaServicio" method="post">
                 <table class="table custom-table" id="myTable">
                  <thead>
                        <tr>  
                            <th scope="col"></th>
                            <th scope="col">Clientes</th>
                            <th scope="col">ID</th>
                            <th scope="col">DNI</th>
                            <th scope="col">Celular</th>
                            <th scope="col">E-mail</th>
                            <th scope="col">Nacionalidad</th>
                            <th scope="col">Direccion</th>
                            <th scope="col">Fecha de Nacimiento</th>
                        </tr>
                  </thead>
                  <tbody>
                        <%
                        int j = 0;
                        Venta ven = (Venta) misesion.getAttribute("ven");
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        String fecha_nac;
                        String check;
                        List <Cliente> listaClientes = (List) misesion.getAttribute("listaClientes");
                        Cliente cli1 = ven.getCli();
                        for (Cliente cli: listaClientes){
                            if (cli.isHabilitado()) {
                            check = "";
                            if(cli.getId_cliente() == cli1.getId_cliente()){
                                    check= "checked=\"check\"";
                            }
                        %>
                        <tr>
                            <% int ID = cli.getId_cliente();%>
                            <td><input name="Clicheckbox<%=j%>" class="check" type="checkbox" value="<%=ID%>" <%=check%>></td>
                            <%String nombre = cli.getNombre() + " " + cli.getApellido();%>
                            <td> <%=nombre%> </td>
                            <td> <%=ID%></td>
                            <% String DNI = cli.getDni();%>
                            <td> <%=DNI%></td>
                            <% int celular = cli.getCelular();%>
                            <td> <%=celular%></td>
                            <% String Email = cli.getEmail();%>
                            <td> <%=Email%></td>
                            <% String nacionalidad = cli.getNacionalidad();%>
                            <td> <%=nacionalidad%></td>
                            <% String direccion = cli.getDireccion();%>
                            <td> <%=direccion%></td>
                            <% fecha_nac = sdf.format(cli.getFecha_nac());%>
                            <td> <%=fecha_nac%></td>
                        </tr>
                  </tbody>
                        <%}}%>
                </table>
                <header class="col-xl-12"><h2 class="tm-text-shadow">Seleccione los servicios a vender</h2></header>
                <table class="table custom-table">
                  <thead>
                        <tr> 
                            <th scope="col"></th>
                            <th scope="col">Nombre</th>
                            <th scope="col">ID</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Destino</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Costo</th>
                        </tr>
                  </thead>
                  <tbody>
                        <% int i = 0;
                        List <Servicio> listaServicios = (List) misesion.getAttribute("listaServicios");
                        String check1;
                        Servicio ser1 = ven.getServi();
                        for (Servicio ser: listaServicios){
                            if(ser.isHabilitado()){
                            check1 = "";
                                if(ser.getCodigo_servicio() == ser1.getCodigo_servicio()){
                                    check1= "checked=\"check\"";
                                } 
                        %>
                        <tr>
                            <% double costo_servicio = ser.getCosto_servicio();%>
                            <% int ID = ser.getCodigo_servicio();%>
                            <td><input name="Sercheckbox<%=i%>" type="checkbox" class="check1" value="<%=ID%>" <%=check1%> ></td>
                            <%String nombre = ser.getNombre();%>
                            <td> <%=nombre%> </td>
                            <td> <%=ID%></td>
                            <% String descripcion_breve = ser.getDescripcion_breve();%>
                            <td> <%=descripcion_breve%></td>
                            <% String destino_servicio = ser.getDestino_servicio();%>
                            <td> <%=destino_servicio%></td>
                            <% Date fecha_servicio= ser.getFecha_servicio();%>
                            <td> <%=fecha_servicio%></td>
                            <td> <%=costo_servicio%></td>
                        </tr>
                        <%i++; }}%>
                  </tbody> 
                </table>
                <header class="col-xl-12"><h2 class="tm-text-shadow">Seleccione el metodo de pago</h2></header>
                <ul>
                    <li><label for="Efectivo"><input type="radio" value="Efectivo" name="medio_pago" checked>   Efectivo</label></li>
                    <li><label for="Tarjeta de Debito (3% comision)"><input value="Tarjeta de Debito" type="radio" name="medio_pago">   Tarjeta de Debito (3% comision) </label></li>
                    <li><label for="Tarjeta de Credito (9% comision)"><input  value="Tarjeta de Credito" type="radio" name="medio_pago">    Tarjeta de Credito (9% comision) </label></li>
                    <li><label for="Monedero Virtual"><input " type="radio" value="Monedero Virtual" name="medio_pago"> Monedero Virtual</label></li>
                    <li><label for="Transferencia (2.45% comision)"><input value="Transferencia" type="radio" name="medio_pago">    Transferencia (2.45% comision)</label></li>
                </ul> 
                    <input type="hidden" name="idVenta" value="<%=ven.getNum_venta()%>">
                    <button id="Button" class="btn tm-btn-submit tm-btn ml-auto" type="submit" >Modificar</button> 
                </form>
            </div>  
            </div>
            <script>
                var checks = document.querySelectorAll(".check");
                var max = 1;
                for (var i = 0; i < checks.length; i++)
                  checks[i].onclick = selectiveCheck;
                function selectiveCheck (event) {
                  var checkedChecks = document.querySelectorAll(".check:checked");
                  if (checkedChecks.length >= max + 1)
                    return false;
                }
                
                var checks1 = document.querySelectorAll(".check1");
                var max1 = 1;
                for (var i = 0; i < checks1.length; i++)
                  checks1[i].onclick = selectiveCheck;
                function selectiveCheck (event) {
                  var checkedChecks1 = document.querySelectorAll(".check1:checked");
                  if (checkedChecks1.length >= max + 1)
                    return false;
                }
                function myFunction() {
                  // Declare variables
                  var input, filter, table, tr, td, i, txtValue;
                  input = document.getElementById("myInput");
                  filter = input.value.toUpperCase();
                  table = document.getElementById("myTable");
                  tr = table.getElementsByTagName("tr");

                  // Loop through all table rows, and hide those who don't match the search query
                  for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[3];
                    if (td) {
                      txtValue = td.textContent || td.innerText;
                      if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                      } else {
                        tr[i].style.display = "none";
                      }
                    }
                  }
                }
                
                
        </script>      
        <%}%>
    </body>
</html>
