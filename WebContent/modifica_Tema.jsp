<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Teme</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Teme:</h1>
        <br/>
        <h2><p align="center"><button type="button" class="btn btn-outline-info"><a href="nou_Tema.jsp"><b>Adauga o noua tema.</b></a></button> </p></h2>
        <form action="m1_Tema.jsp" method="post">
            <table class="table" border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdTema:</b></td>
                    <td><b>Puncte:</b></td>
                    <td><b>Denumire:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("teme");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idtema");
                %>
                <tr>
                    <td><input type="radio" name="primarykey" value="<%= x%>" required/></td>
                    <td><%= x%></td>
                    <td><%= rs.getFloat("puncte")%></td>
                    <td><%= rs.getString("denumire")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
       <h2> <p align="center">
            <button type="button" class="btn btn-outline-info"><a href="index.jsp"><b>Home</b></a></button>
            <br/>
        </p></h2>
    </body>
</html>