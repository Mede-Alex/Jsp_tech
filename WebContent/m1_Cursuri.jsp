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
        <h1 align="center">Tabela Cursuri:</h1>
        <br/>
        <h2><p align="center"><a href="nou_Cursuri.jsp"><b>Adauga un nou curs.</b></a></p></h2>
        <%
            jb.connect();
            String NumeStudent, PrenumeStudent, Denumire;
            int OreCursSemestru, NrAbsente;
            float Medie, Puncte;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceCursuriId(aux);
            rs.first();
            int id1 = rs.getInt("idstudent_cursuri");
            int id2 = rs.getInt("idtema_cursuri");

            NumeStudent = rs.getString("nume_student");
            PrenumeStudent = rs.getString("prenume_student");
            Medie = rs.getFloat("medie");
            NrAbsente = rs.getInt("nrabsente");
            Puncte = rs.getFloat("puncte");
            Denumire = rs.getString("denumire");
            OreCursSemestru = rs.getInt("orecursemestru");

          

            ResultSet rs1 = jb.vedeTabela("studenti");
            ResultSet rs2 = jb.vedeTabela("teme");
            int idstudent, idtema;


        %>
        <form action="m2_Cursuri.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdCurs:</td>
                    <td> <input type="text" name="idcurs" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">idstudent:</td>
                    <td> 
                        <SELECT NAME="idstudent">
                            <%
                                while (rs1.next()) {
                                    idstudent = rs1.getInt("idstudent");
                                    NumeStudent = rs1.getString("nume");
                                    PrenumeStudent = rs1.getString("prenume");
                                    Medie = rs1.getFloat("medie");
                                    NrAbsente = rs1.getInt("nrabsente");
                                    if (idstudent != id1) {
                            %>
                            <OPTION VALUE="<%= idstudent%>"><%= idstudent%>, <%= NumeStudent%>, <%= PrenumeStudent%>, <%= Medie%>, <%= NrAbsente%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idstudent%>"><%= idstudent%>, <%= NumeStudent%>, <%= PrenumeStudent%>, <%= Medie%>, <%= NrAbsente%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">idtema:</td>
                    <td> 
                        <SELECT NAME="idtema">
                            <%
                                while (rs2.next()) {
                                    idtema = rs2.getInt("idtema");
                                    Puncte = rs2.getFloat("puncte");
                                    Denumire = rs2.getString("denumire");
                            if (idtema != id2) {
                            %>
                            <OPTION VALUE="<%= idtema%>"><%= idtema%>, <%= Puncte%>, <%= Denumire%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idtema%>"><%= idtema%>, <%= Puncte%>, <%= Denumire%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">OreCursSemestru:</td>
                    <td> <input type="text" name="orecursemestru" size="30" value="<%= OreCursSemestru%>"/></td>
                </tr>
            
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <h2><p align="center"">
            <a href="index.jsp"><b>Home</b></a>
            <br/></h2>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>