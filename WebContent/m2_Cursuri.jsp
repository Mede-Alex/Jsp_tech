<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Cursuri</title>
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Cursuri:</h1>
        <br/>
        <h2><p align="center"><a href="nou_Cursuri.jsp"><b>Adauga un nou curs.</b></a></p></h2>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idcurs"));
            String idstudent = request.getParameter("idstudent");
            String idtema = request.getParameter("idtema");
            String OreCursSemestru = request.getParameter("orecursemestru");

            String[] valori = {String.valueOf(idstudent), String.valueOf(idtema),String.valueOf(OreCursSemestru)};
            String[] campuri = {"idstudent", "idtema", "orecursemestru"};
            jb.modificaTabela("cursuri", "idcurs", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <h2><p align="center">
            <a href="index.jsp"><b>Home</b></a>
            <br/></h2>
    </body>
</html>>