<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Teme</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Teme:</h1>
        <br/>
        <h2><p align="center"><a href="nou_Tema.jsp"><b>Adauga o noua tema.</b></a></p></h2>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("teme", "idtema", aux);
            rs.first();
            String Puncte = rs.getString("puncte");
            String Denumire = rs.getString("denumire");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Tema.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdTema:</td>
                    <td> <input type="text" name="idtema" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Puncte:</td>
                    <td> <input type="text" name="puncte" size="30" value="<%= Puncte%>"/></td>
                </tr>
                <tr>
                    <td align="right">Denumire:</td>
                    <td> <input type="text" name="denumire" size="30" value="<%= Denumire%>"/></td>
                </tr>
                
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <h2><p align="center"">
            <a href="index.jsp"><b>Home</b></a>
            <br/></h2>
    </body>
</html>