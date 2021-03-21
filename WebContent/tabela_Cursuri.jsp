<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Cursuri</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Cursuri:</h1>
        <br/>
       <h2> <p align="center"><button type="button" class="btn btn-outline-info">
       <a href="nou_Cursuri.jsp"><b>Adauga cursuri.</b></a></p></h2></button>
        <form action="sterge_Cursuri.jsp" method="post">
            <table class="table" border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdCursuri:</b></td>
                    <td><b>IdStudent:</b></td>
                    <td><b>NumeStudent:</b></td>
                    <td><b>PrenumeStudent:</b></td>
                    <td><b>MedieStudent:</b></td>
                    <td><b>NrAbsenteStudent:</b></td>
                    <td><b>IdTema:</b></td>
                    <td><b>PuncteTema:</b></td>
                    <td><b>DenumireTema:</b></td>
                    <td><b>OreCursSemestru:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeCursuri();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idcurs");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getInt("idstudent_cursuri")%></td>
                    <td><%= rs.getString("nume_student")%></td>
                    <td><%= rs.getString("prenume_student")%></td>
                    <td><%= rs.getFloat("medie")%></td>
                    <td><%= rs.getInt("nrabsente")%></td>
                    <td><%= rs.getInt("idtema_cursuri")%></td>
                    <td><%= rs.getFloat("puncte")%></td>
                    <td><%= rs.getString("denumire")%></td>
                    <td><%= rs.getInt("orecursemestru")%></td>
                  
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Sterge liniile marcate">
            </p>
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>
        <br/>
        <h2><p align="center">
            <button type="button" class="btn btn-outline-info">
            <a href="index.jsp"><b>Home</b></a></button>
            <br/></h2>
        </p>
    </body>
</html>