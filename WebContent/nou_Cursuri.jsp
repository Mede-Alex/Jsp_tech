<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Cursuri</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            int idstudent, idtema;
            String id1, id2, NumeStudent, PrenumeStudent, Denumire,OreCursSemestru;
            int NrAbsente;
            float Medie,Puncte;
            
            id1 = request.getParameter("idstudent");
            id2 = request.getParameter("idtema");
            OreCursSemestru = request.getParameter("orecursemestru");
            if (id1 != null) {
                jb.connect();
                jb.adaugaCursuri(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), java.lang.Integer.parseInt(OreCursSemestru));
                jb.disconnect();
        %>
        <h2><strong><p>Datele au fost adaugate.</p></strong></h2><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("studenti");
        ResultSet rs2 = jb.vedeTabela("teme");
        %>
        <h1> Suntem in tabela de adaugare a cursurilor.</h1>
        <form action="nou_Cursuri.jsp" method="post">
            <table>
                <tr>
                    <td align="right">IdStudent:</td>
                    <td> 
                        Selectati Studenti:
			<SELECT NAME="idstudent">
                                <%
                                    while(rs1.next()){
                                        idstudent = rs1.getInt("idstudent");
                                        NumeStudent  = rs1.getString("nume");
                                        PrenumeStudent = rs1.getString("prenume");
                                        Medie = rs1.getFloat("medie");
                                        NrAbsente = rs1.getInt("nrabsente");
                                %>
                                    <OPTION VALUE="<%= idstudent%>"><%= idstudent%>,<%= NumeStudent%>,<%= PrenumeStudent%>,<%= Medie%>, <%= NrAbsente%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td align="right">IdTema:</td>
                    <td> 
                        Selectati Tema:
			<SELECT NAME="idtema">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idtema = rs2.getInt("idtema");
                                        Puncte = rs2.getFloat("puncte");
                                        Denumire = rs2.getString("denumire");
               
                                %>
                                    <OPTION VALUE="<%= idtema%>"><%= idtema%>,<%= Puncte%>,<%= Denumire%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr>
                    <td align="right">Ore Curs Semestru:</td>
                    <td> <input type="text" name="orecursemestru" size="30" required/></td>
                </tr>
            </table>
            <input type="submit" value="Adauga Cursul" />
        </form>
        <%
            }
        %>
        <br/>
        <h2><a href="index.jsp"><b>Home</b></a></h2>
        <br/>
    </body>
</html>