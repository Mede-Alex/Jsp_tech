<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Tema</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String Puncte = request.getParameter("puncte");
            String Denumire = request.getParameter("denumire");
            if (Puncte != null) {
                jb.connect();
                jb.adaugaTema(java.lang.Float.parseFloat(Puncte), Denumire);
                jb.disconnect();
        %>
        <h1><p>Datele au fost adaugate.</p></h1><%
        } else {
        %>
        <h1><td align="center">  Suntem in tabela Teme.</td></h1>
        <form action="nou_Tema.jsp" method="post">
            <table>
                <tr>
                    <td align="center">Puncte Tema:</td>
                    <td> <input type="text" name="puncte" size="40" required/></td>
                </tr>
                <tr>
                    <td align="center">Denumire Tema:</td>
                    <td> <input type="text" name="denumire" size="30" required/></td>
                </tr>
                
            </table>
            <input type="submit" value="Adauga tema" />
        </form>
        <%
            }
        %>
        <br/>
        <h2><a href="index.jsp"><b>Home</b></a></h2>
        <br/>
    </body>
</html>