<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<center>
Feldinformation
<br/>
<p>
<%
	if (request.getParameter("id").equals("S1")||request.getParameter("id").equals("S2")
			|| request.getParameter("id").equals("S3")|| request.getParameter("id").equals("S4")) {
		out.print("Startfeld " + request.getParameter("id")
				+ " mit der Farbe " + request.getParameter("farbe"));

	} else if (request.getParameter("id").equals("E1")||request.getParameter("id").equals("E2")
			||request.getParameter("id").equals("E3")||request.getParameter("id").equals("E4")) {
		out.print("Endfeld " + request.getParameter("id")
				+ " mit der Farbe " + request.getParameter("farbe"));

	} else {
		out.print("Das Feld " + request.getParameter("id"));
	}
%>

<br/><a href='spiel.jsp'><button>zurueck zum Spiel</button></a>

</center>
</body>
</html>