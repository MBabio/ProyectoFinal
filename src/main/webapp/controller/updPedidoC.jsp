<%@page import="com.google.protobuf.TextFormatParseInfoTree"%>
<%@page import="dao.PedidoDAOC"%>
<%@page import="model.Pedido"%>
<%@page import="model.Localidad"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UPDATE del pedido</title>
</head>
<body>

<%
	String idPedido = request.getParameter("idPedido");
	idPedido = idPedido.replaceAll("(\r|\n)", "");

 	Integer idPedido2 = Integer.valueOf(idPedido);
 	String nombre =request.getParameter("firstName");
	String apellido =request.getParameter("lastName");
 	String usuario =request.getParameter("username");
 	String mail =request.getParameter("email");
 	String lugarentrega =request.getParameter("address");
 	String idLocalidad = request.getParameter("country");
 	String idProvincia = request.getParameter("state");
 	String codpostal =request.getParameter("zip");
 	String formadepago =request.getParameter("paymentMethod");
 	String tarjtitular =request.getParameter("cc-name");
 	String tarjnumero =request.getParameter("cc-number");
 	String tarjvto =request.getParameter("cc-expiration");
	String tarjclave =request.getParameter("cc-cvv");
	
	//populate: llenar un obj con datos para insertarlos
 	Localidad localidad = new Localidad(Integer.valueOf(idLocalidad), null, null);
	
 	Pedido pedido = new Pedido(idPedido2, nombre, apellido, usuario, mail, lugarentrega, localidad, codpostal, formadepago, tarjtitular, Integer.valueOf(tarjnumero), tarjvto, Integer.valueOf(tarjclave));

 	PedidoDAOC dao = new PedidoDAOC();
 	Boolean updOk = dao.updPedido(pedido);
	

 	if(updOk) {
 		response.sendRedirect("../view/mensajeOk.jsp");
 	} else {
 		response.sendRedirect("../view/mensajeError.jsp");
 	}	
	
 %>

</body>
</html>