<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Student</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String nume = request.getParameter("nume");
            String prenume = request.getParameter("prenume");
            String medie = request.getParameter("medie");
            String nrabsente =request.getParameter("nrabsente");
            if (nume != null) {
                jb.connect();
                jb.adaugaStudent(nume, prenume, java.lang.Float.parseFloat(medie), java.lang.Integer.parseInt(nrabsente));
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Student.</h1>
        <form action="nou_Student.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Nume Student:</td>
                    <td> <input type="text" name="nume" size="40" required/></td>
                </tr>
                <tr>
                    <td align="right">Prenume Student:</td>
                    <td> <input type="text" name="prenume" size="30" required/></td>
                </tr>
                <tr>
                    <td align="right">Medie:</td>
                    <td> <input type="text" name="medie" size="30" required/></td>
                </tr>
                 <tr>
                    <td align="right">NrAbsente:</td>
                    <td> <input type="text" name="nrabsente" size="30" required/></td>
                </tr>
            </table>
            <input type="submit" value="Adauga studentul" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.jsp"><b>Home</b></a>
        <br/>
    </body>
</html>