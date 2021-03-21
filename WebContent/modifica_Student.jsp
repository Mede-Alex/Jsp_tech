<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Studenti</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Studenti:</h1>
        <br/>
       <h2> <p align="center"><button type="button" class="btn btn-outline-info"><a href="nou_Student.jsp"><b>Adauga un nou student.</b></a></button></button></p></h2>
        <form action="m1_Student.jsp" method="post">
            <table class = "table" border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdStudent:</b></td>
                    <td><b>Nume:</b></td>
                    <td><b>Prenume:</b></td>
                    <td><b>Medie:</b></td>
                    <td><b>NrAbsente:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("studenti");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idstudent");
                %>
                <tr>
                    <td><input type="radio" name="primarykey" value="<%= x%>" required/></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("nume")%></td>
                    <td><%= rs.getString("prenume")%></td>
                    <td><%= rs.getFloat("medie")%></td>
                    <td><%= rs.getInt("nrabsente")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica linia" >
            </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
       <h2> <p align="center">
            <button type="button" class="btn btn-outline-info"><a href="index.jsp"><b>Home</b></a></h2>
            <br/>
        </p>
    </body>
</html>