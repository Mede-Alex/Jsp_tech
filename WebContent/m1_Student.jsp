<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Studenti</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Studenti:</h1>
        <br/>
       <h2> <p align="center"><a href="nou_Student.jsp"><b>Modifica informatiile studentului.</b></a></p></h2>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("studenti", "idstudent", aux);
            rs.first();
            String Nume = rs.getString("nume");
            String Prenume = rs.getString("prenume");
            float Medie = rs.getFloat("medie");
            int NrAbsente = rs.getInt("nrabsente");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Student.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdStudent:</td>
                    <td> <input type="text" name="idstudent" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="nume" size="30" value="<%= Nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Prenume:</td>
                    <td> <input type="text" name="prenume" size="30" value="<%= Prenume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Medie:</td>
                    <td> <input type="text" name="medie" size="30" value="<%= Medie%>"/></td>
                </tr>
                <tr>
                    <td align="right">NrAbsente:</td>
                    <td> <input type="text" name="nrabsente" size="30" value="<%= NrAbsente%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <h2><p align="center"">
            <a href="index.jsp"><b>Home</b></a></h2>
            <br/>
    </body>
</html>