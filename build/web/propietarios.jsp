<%-- 
    Document   : propietarios
    Created on : 21 abr. 2021, 19:57:30
    Author     : Usuario
--%>

<%@page import="Modelos.Persona"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Gestores.GestorProveedores"%>
<%@page import="java.util.Set"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-grid.min.css" type="text/css"/>
        <link rel="stylesheet" href="css/bootstrap-reboot.css" type="text/css">

        <jsp:include page="/adminHeaderNavbarLayout.jsp"/>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title >Verat Consortium</title>
    </head>
    <body >
        <h1 class="container-md">Listado de Propietarios</h1><br>
        <div class="container-md">     
            <table class="table table-striped" id="tabla">

                <thead>
                    <tr><td colspan="4">
                            <input id="buscar" type="text" class="form-control" placeholder="Buscar en la tabla" /> 
                        </td> </tr>

                <th style="text-align: center" hidden>ID</th><th style="text-align: center">Consorcio</th>
                <th style="text-align: center">DPTO</th><th style="text-align: center">Nombre</th><th style="text-align: center">Apellido</th>
                <th style="text-align: center"># Documento</th><th style="text-align: center">Telefono</th><th style="text-align: center">Mail</th>
                <th style="text-align: center">Editar</th><th style="text-align: center">Eliminar</th>
                </thead>
                <c:forEach var="pro" items="${lista}" >
                    <tr style="text-align: center">
                        <td hidden>${pro.id_persona}</td>
                        <td>${pro.consorcio.nombre}</td>
                        <td>${pro.ph.descripcion}</td>
                        <td>${pro.nombre}</td>
                        <td>${pro.apellido}</td>
                        <td>${pro.documento}</td>
                        <td>${pro.telefono}</td>
                        <td>${pro.mail}</td>

                        <td>
                            <button class="btn btn-outline-dark" onclick="window.location = 'eliminarPropietarioServlet?id_persona=${pro.id_persona }';" >Eliminar</button>  
                        </td>
                        <td>
                            <button  class="btn btn-outline-dark" onclick="window.location = 'editarPropietarioServlet?id_persona=${pro.id_persona}';" >Editar</button>              
                        </td>
                    </tr>

                </c:forEach>
            </table>
        </div>


        <div class="container-md"><button class="btn btn-dark"  onclick="window.location = 'nuevoPropietario.jsp';" >Nuevo Propietario</button>
            <a class=" btn btn-dark" href="vistaAdmin.jsp">Volver</a>
        </div>

        <div>
            <jsp:include page="/footer.jsp"/>
        </div>



        <script>
            var table = document.querySelector('#tabla');
            var tableBody = table.querySelector('tbody');
            var input = document.querySelector('#buscar');

            var originalRows = [
                ...table.querySelectorAll('tbody tr')
            ].map(row => {
                var newRow = document.createElement('tr');
                newRow.innerHTML = row.innerHTML;

                return newRow;
            });

            input.addEventListener('input', evt => {
                var value = evt.target.value;
                var rows = originalRows
                        .filter(row => {
                            var cells = [...row.querySelectorAll('td')];
                            return (
                                    evt.target.value === ''
                                    || cells.find(cell => {
                                        return cell.textContent.includes(value);
                                    })
                                    );
                        })
                        .map(row => row.outerHTML);

                tableBody.innerHTML = rows.join('');
                if (value !== '') {
                    tableBody.querySelectorAll('tr td').forEach(row => {
                        var text = row.textContent;
<!--var html = text.replace(new RegExp(value, 'g'),`<strong>${value}</strong>`);-->
                    row.innerHTML = html;
                });

            }
        });

        </script>





    </body>
</html>
