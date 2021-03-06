<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">
window.onload=function() {
    document.getElementsByName('log')[0].scrollTop=document.getElementsByName('log')[0].scrollHeight;
};
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spiel</title>
</head>
<body>
<%
if(application.getAttribute("init").equals("0")){
	spiel.initSpiel();
	application.setAttribute("init", "1");
}
%>
	<center>
		
<%
for(int i=1; i<=spiel.getSpieler().size(); i++){
	application.setAttribute("s"+i, spiel.getSpieler().get(i-1).getSessionID());
	application.setAttribute("farbeS"+i, spiel.getSpieler().get(i-1).getFarbe1());
}

for(int i=1; i<=4; i++){
	if(spiel.getAmZug().getFarbe1().equals(application.getAttribute("farbeS"+i))){
		application.setAttribute("amZug", application.getAttribute("s"+i));
		application.setAttribute("amZugFarbe", application.getAttribute("farbeS"+i));
	}
}
%>

		<div id="container">
			<div id=menu><%
				switch(spiel.getAmZug().getWuerfel().getErgebnis()){
				case 1:
					out.print("<img src='bilder/erg1.png' id='wuerfel'>");
					break;
				case 2:
					out.print("<img src='bilder/erg2.png' id='wuerfel'>");
					break;
				case 3:
					out.print("<img src='bilder/erg3.png' id='wuerfel'>");
					break;
				case 4:
					out.print("<img src='bilder/erg4.png' id='wuerfel'>");
					break;
				case 5:
					out.print("<img src='bilder/erg5.png' id='wuerfel'>");
					break;
				case 6:
					out.print("<img src='bilder/erg6.png' id='wuerfel'>");
					break;
				}%>
				<br/><br/><br/>
				<a href="spiel.jsp">aktualisieren</a>
				<br><br><br>
				<%if(request.getParameter("feld") != null) out.print(request.getParameter("feld"));%>
				<br>
				<%if(request.getParameter("figur") != null) out.print(request.getParameter("figur"));%>
			
			</div>
			
			<div id="spielfeld"><div class="panel"><div class="content">
				<table border="0">
					<tr>
						<td id="sr1" ><%
							if(spiel.getBrett().getSpielbrett()[0].getFelder()[1].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[0].getFelder()[1].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 1 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 1 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[0].getFelder()[1].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[0].getFelder()[1].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>1</a>");
								
							}
						%></td>

						<td id="sr2"><%
							if(spiel.getBrett().getSpielbrett()[0].getFelder()[2].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[0].getFelder()[2].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 2 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 2 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[0].getFelder()[2].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[0].getFelder()[2].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>2</a>");
							}
						%></td>
						<td></td>
						<td></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[8].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[8].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[8].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 9&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 9&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 7&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 9&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 9&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 9&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 9&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 9&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[8].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>9</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[9].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[9].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[9].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 10&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 10&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 10&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 10&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 10&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 10&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 10&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 10&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[9].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>10</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[10].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[10].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[10].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 11&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 11&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 11&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 11&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 11&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 11&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 11&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 11&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[10].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>11</a>");
							}
						%></td>
						<td></td>
						<td></td>
						<td id="sb1"><%
							if(spiel.getBrett().getSpielbrett()[10].getFelder()[1].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[10].getFelder()[1].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 1 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 1 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[10].getFelder()[1].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[10].getFelder()[1].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>1</a>");
							}
						%></td>
						<td id="sb2"><%
							if(spiel.getBrett().getSpielbrett()[10].getFelder()[2].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[10].getFelder()[2].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 2 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 2 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[10].getFelder()[2].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[10].getFelder()[2].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>2</a>");
							}
						%></td>
						
					</tr>
					<tr>
						<td id="sr3"><%
							if(spiel.getBrett().getSpielbrett()[0].getFelder()[3].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[0].getFelder()[3].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 3 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 3 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[0].getFelder()[3].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[0].getFelder()[3].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>3</a>");
							}
						%></td>
						<td id="sr4"><%
							if(spiel.getBrett().getSpielbrett()[0].getFelder()[4].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[0].getFelder()[4].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 4 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 4 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[0].getFelder()[4].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[0].getFelder()[4].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>4</a>");
							}
						%></td>
						<td></td>
						<td></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[7].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[7].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[7].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 8&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 6&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 8&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 8&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 8&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 8&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 8&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 8&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[7].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>8</a>");
							}
						%></td>
						<td id="eb1"><%
							if(spiel.getBrett().getSpielbrett()[9].getFelder()[1].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[9].getFelder()[1].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 1 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 1 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[9].getFelder()[1].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[9].getFelder()[1].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>1</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[11].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[11].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[11].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 12&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 12&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 12&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 12&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 12&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 12&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 12&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 12&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[11].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>12</a>");
							}
						%></td>
						<td></td>
						<td></td>
						<td id="sb3"><%
							if(spiel.getBrett().getSpielbrett()[10].getFelder()[3].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[10].getFelder()[3].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 3 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 3 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[10].getFelder()[3].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[10].getFelder()[3].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>3</a>");
							}
						%></td>
						<td id="sb4"><%
							if(spiel.getBrett().getSpielbrett()[10].getFelder()[4].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[10].getFelder()[4].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 4 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 4 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[10].getFelder()[4].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[10].getFelder()[4].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>4</a>");
							}
						%></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[6].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[6].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[6].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 7&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 7&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 7&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 7&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 7&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 7&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 7&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 7&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[6].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>7</a>");
							}
						%></td>
						<td id="eb2"><%
							if(spiel.getBrett().getSpielbrett()[9].getFelder()[2].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[9].getFelder()[2].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 2 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 2 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[9].getFelder()[2].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[9].getFelder()[2].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>2</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[12].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[12].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[12].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 13&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 13&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 13&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 13&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 13&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 13&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 13&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 13&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[12].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>13</a>");
							}
						%></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[5].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[5].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[5].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 6&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 6&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 6&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 6&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 6&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 6&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 6&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 6&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[5].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>6</a>");
							}
						%></td>
						<td id="eb3"><%
							if(spiel.getBrett().getSpielbrett()[9].getFelder()[3].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[9].getFelder()[3].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 3 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 3 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[9].getFelder()[3].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[9].getFelder()[3].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>3</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[13].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[13].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[13].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 14&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 14&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 14&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 14&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 14&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 14&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 14&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 14&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[13].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>14</a>");
							}
						%></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td><%
							if(spiel.getBrett().getSpielbrett()[0].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[0].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[0].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 1&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 1&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 1&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 1&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 1&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 1&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 1&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 1&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[0].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>1</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[1].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[1].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[1].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 2&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 2&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 2&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 2&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 2&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 2&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 2&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 2&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[1].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>2</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[2].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[2].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[2].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 3&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 3&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 3&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 3&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 3&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 3&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 3&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 3&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[2].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>3</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[3].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[3].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[3].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 4&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 4&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 4&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 4&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 4&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 4&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 4&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 4&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[3].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>4</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[4].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[4].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[4].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 5&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 5&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 5&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 5&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 5&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 5&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 5&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 5&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[4].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>5</a>");
							}
						%></td>
						<td id="eb4"><%
							if(spiel.getBrett().getSpielbrett()[9].getFelder()[4].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[9].getFelder()[4].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 4 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 4 Blau&figur=Spielfigur "+id+"'><img src='bilder/Figur_blau.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[9].getFelder()[4].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[9].getFelder()[4].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>4</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[14].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[14].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[14].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 15&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 15&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 15&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 15&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 15&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 15&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 15&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 15&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[14].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>15</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[15].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[15].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[15].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 16&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 16&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 16&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 16&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 16&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 16&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 16&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 16&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[15].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>16</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[16].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[16].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[16].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 17&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 17&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 17&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 17&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 17&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 17&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 17&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 17&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[16].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>17</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[17].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[17].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[17].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 18&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 18&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 18&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 18&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 18&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 18&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 18&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 18&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[17].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>18</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[18].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[18].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[18].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 19&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 19&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 19&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 19&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 19&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 19&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 19&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 19&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[18].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>19</a>");
							}
						%></td>
					</tr>
					<tr>
						<td><%
							if(spiel.getBrett().getSpielbrett()[39].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[39].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[39].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 40&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 40&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 40&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 40&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 40&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 40&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 40&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 40&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[39].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>40</a>");
							}
						%></td>
						<td id="er1"><%
							if(spiel.getBrett().getSpielbrett()[39].getFelder()[1].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[39].getFelder()[1].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 1 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 1 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[39].getFelder()[1].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[39].getFelder()[1].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>1</a>");
							}
						%></td>
						<td id="er2"><%
							if(spiel.getBrett().getSpielbrett()[39].getFelder()[2].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[39].getFelder()[2].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 2 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 2 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[39].getFelder()[2].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[39].getFelder()[2].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>2</a>");
							}
						%></td>
						<td id="er3"><%
							if(spiel.getBrett().getSpielbrett()[39].getFelder()[3].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[39].getFelder()[3].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 3 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 3 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[39].getFelder()[3].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[39].getFelder()[3].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>3</a>");
							}
						%></td>
						<td id="er4"><%
							if(spiel.getBrett().getSpielbrett()[39].getFelder()[4].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[39].getFelder()[4].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 4 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 4 Rot&figur=Spielfigur "+id+"'><img src='bilder/Figur_rot.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[39].getFelder()[4].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[39].getFelder()[4].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>4</a>");
							}
						%></td>
						<td></td>
						<td id="eg4"><%
							if(spiel.getBrett().getSpielbrett()[19].getFelder()[4].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[19].getFelder()[4].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 4 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 4 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[19].getFelder()[4].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[19].getFelder()[4].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>4</a>");
							}
						%></td>
						<td id="eg3"><%
							if(spiel.getBrett().getSpielbrett()[19].getFelder()[3].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[19].getFelder()[3].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 3 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 3 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[19].getFelder()[3].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[19].getFelder()[3].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>3</a>");
							}
						%></td>
						<td id="eg2"><%
							if(spiel.getBrett().getSpielbrett()[19].getFelder()[2].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[19].getFelder()[2].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 2 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 2 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[19].getFelder()[2].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[19].getFelder()[2].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>2</a>");
							}
						%></td>
						<td id="eg1"><%
							if(spiel.getBrett().getSpielbrett()[19].getFelder()[1].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[19].getFelder()[1].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 1 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 1 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[19].getFelder()[1].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[19].getFelder()[1].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>1</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[19].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[19].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[19].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 20&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 20&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 20&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 20&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 20&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 20&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 20&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 20&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[19].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>20</a>");
							}
						%></td>
					</tr>
					<tr>
						<td><%
							if(spiel.getBrett().getSpielbrett()[38].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[38].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[38].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 39&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 39&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 39&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 39&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 39&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 39&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 39&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 39&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[38].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>39</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[37].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[37].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[37].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 38&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 38&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 38&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 38&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 38&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 38&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 38&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 38&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[37].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>38</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[36].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[36].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[36].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 37&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 37&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 37&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 37&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 37&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 37&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 37&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 37&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[36].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>37</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[35].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[35].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[35].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 36&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 36&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 36&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 36&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 36&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 36&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 36&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 36&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[35].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>36</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[34].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[34].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[34].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 35&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 35&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 35&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 35&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 35&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 35&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 35&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 35&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[34].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>35</a>");
							}
						%></td>
						<td id="ey4"><%
							if(spiel.getBrett().getSpielbrett()[29].getFelder()[4].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[29].getFelder()[4].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 4 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 4 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[29].getFelder()[4].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[29].getFelder()[4].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>4</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[24].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[24].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[24].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 25&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 25&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 25&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 25&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 25&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 25&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 25&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 25&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[24].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>25</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[23].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[23].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[23].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 24&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 24&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 24&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 24&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 24&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 24&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 24&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 24&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[23].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>24</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[22].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[22].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[22].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 23&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 23&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 23&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 23&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 23&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 23&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 23&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 23&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[22].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>23</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[21].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[21].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[21].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 22&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 22&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 22&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 22&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 22&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 22&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 22&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 22&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[21].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>22</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[20].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[20].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[20].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 21&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 21&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 21&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 21&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 21&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 21&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 21&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 21&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[20].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>21</a>");
							}
						%></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[33].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[33].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[33].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 34&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 34&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 34&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 34&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 34&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 34&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 34&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 34&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[33].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>34</a>");
							}
						%></td>
						<td id="ey3"><%
							if(spiel.getBrett().getSpielbrett()[29].getFelder()[3].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[29].getFelder()[3].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 3 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 3 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[29].getFelder()[3].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[29].getFelder()[3].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>3</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[25].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[25].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[25].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 26&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 26&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 26&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 26&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 26&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 26&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 26&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 26&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[25].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>26</a>");
							}
						%></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[32].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[32].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[32].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 33&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 33&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 33&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 33&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 33&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 33&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 33&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 33&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[32].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>33</a>");
							}
						%></td>
						<td id="ey2"><%
							if(spiel.getBrett().getSpielbrett()[29].getFelder()[2].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[29].getFelder()[2].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 2 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 2 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[29].getFelder()[2].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[29].getFelder()[2].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>2</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[26].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[26].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[26].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 27&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 27&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 27&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 27&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 27&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 27&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 27&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 27&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[26].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>27</a>");
							}
						%></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td id="sy1"><%
							if(spiel.getBrett().getSpielbrett()[30].getFelder()[1].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[30].getFelder()[1].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 1 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 1 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[30].getFelder()[1].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[30].getFelder()[1].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>1</a>");
							}
						%></td>
						<td id="sy2"><%
							if(spiel.getBrett().getSpielbrett()[30].getFelder()[2].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[30].getFelder()[2].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 2 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 2 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[30].getFelder()[2].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[30].getFelder()[2].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>2</a>");
							}
						%></td>
						<td></td>
						<td></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[31].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[31].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[31].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 32&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 32&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 32&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 32&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 32&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 32&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 32&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 32&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[31].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>32</a>");
							}
						%></td>
						<td id="ey1"><%
							if(spiel.getBrett().getSpielbrett()[29].getFelder()[1].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[29].getFelder()[1].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Endfeld 1 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Endfeld 1 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[29].getFelder()[1].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[29].getFelder()[1].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>1</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[27].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[27].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[27].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 28&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 28&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 28&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 28&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 28&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 28&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 28&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 28&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[27].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>28</a>");
							}
						%></td>
						<td></td>
						<td></td>
						<td id="sg1"><%
							if(spiel.getBrett().getSpielbrett()[20].getFelder()[1].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[20].getFelder()[1].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 1 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 1 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[20].getFelder()[1].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[20].getFelder()[1].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>1</a>");
							}
						%></td>
						<td id="sg2"><%
							if(spiel.getBrett().getSpielbrett()[20].getFelder()[2].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[20].getFelder()[2].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 2 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 2 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[20].getFelder()[2].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[20].getFelder()[2].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>2</a>");
							}
						%></td>
					</tr>
					<tr>
						<td id="sy3"><%
							if(spiel.getBrett().getSpielbrett()[30].getFelder()[3].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[30].getFelder()[3].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 3 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 3 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[30].getFelder()[3].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[30].getFelder()[3].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>3</a>");
							}
						%></td>
						<td id="sy4"><%
							if(spiel.getBrett().getSpielbrett()[30].getFelder()[4].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[30].getFelder()[4].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 4 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 4 Gelb&figur=Spielfigur "+id+"'><img src='bilder/Figur_gelb.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[30].getFelder()[4].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[30].getFelder()[4].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>4</a>");
							}
						%></td>
						<td></td>
						<td></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[30].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[30].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[30].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 31&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 31&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 31&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 31&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 31&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 31&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 31&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 31&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[30].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>31</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[29].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[29].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[29].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 30&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 30&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 30&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 30&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 30&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 30&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 30&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 30&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[29].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>30</a>");
							}
						%></td>
						<td><%
							if(spiel.getBrett().getSpielbrett()[28].getFelder()[0].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[28].getFelder()[0].getSpielfigur().getID();
								FarbEnum farbe = spiel.getBrett().getSpielbrett()[28].getFelder()[0].getSpielfigur().getFarbe();
								if(farbe.equals(FarbEnum.RED)){
									String s= "Spielfigur "+id+" Rot";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("red"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 29&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 29&figur="+s+"'><img src='bilder/Figur_rot.png'></a>");
								}else if(farbe.equals(FarbEnum.BLUE)){
									String s= "Spielfigur "+id+" Blau";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("blue"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 29&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 29&figur="+s+"'><img src='bilder/Figur_blau.png'></a>");
								}else if(farbe.equals(FarbEnum.GREEN)){
									String s= "Spielfigur "+id+" Gruen";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 29&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 29&figur="+s+"'><img src='bilder/Figur_gruen.png'></a>");
								}else if(farbe.equals(FarbEnum.YELLOW)){
									String s= "Spielfigur "+id+" Gelb";
									if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("yellow"))
										out.print("<a href='spiel.jsp?id="+id+"&feld=Spielfeld 29&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
									else
										out.print("<a href='spiel.jsp?feld=Spielfeld 29&figur="+s+"'><img src='bilder/Figur_gelb.png'></a>");
								}
							}else{
								String id = spiel.getBrett().getSpielbrett()[28].getFelder()[0].getID().toString();
								out.print("<a href ='feld.jsp?id="+id+"'>29</a>");
							}
						%></td>
						<td></td>
						<td></td>
						<td id="sg3"><%
							if(spiel.getBrett().getSpielbrett()[20].getFelder()[3].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[20].getFelder()[3].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 3 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 3 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[20].getFelder()[3].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[20].getFelder()[3].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>3</a>");
							}
						%></td>
						<td id="sg4"><%
							if(spiel.getBrett().getSpielbrett()[20].getFelder()[4].getSpielfigur() != null){
								int id = spiel.getBrett().getSpielbrett()[20].getFelder()[4].getSpielfigur().getID();
								if(session.getId().equals(application.getAttribute("amZug")) && spiel.getAmZug().getFarbe1().equals("green"))
									out.print("<a href='spiel.jsp?id="+id+"&feld=Startfeld 4 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
								else
									out.print("<a href='spiel.jsp?feld=Startfeld 4 Gruen&figur=Spielfigur "+id+"'><img src='bilder/Figur_gruen.png'></a>");
							}else{
								String farbe = spiel.getBrett().getSpielbrett()[20].getFelder()[4].getFarbe().toString();
								String id = spiel.getBrett().getSpielbrett()[20].getFelder()[4].getID().toString();
								out.print("<a href='feld.jsp?id="+id+"&farbe="+farbe+"'>4</a>");
							}
						%></td>
					</tr>
				</table>
			</div></div></div>
			
			
			<div id="menu">
			<%
				if(request.getParameter("id") != null)
					out.print("<a href='SpielServlet?id="+request.getParameter("id").toString()+"'><button>Zug durchführen</button></a>");
				else
					out.print("<a href='SpielServlet'><button disabled='disabled'>Zug durchführen</button></a>");%>
					
				<br />
			<%
			if(session.getId().equals(application.getAttribute("amZug"))){
				out.print("<a href='SpielServlet?id=next'><button>aussetzen</button></a>");
			}else{
				out.print("<a href='SpielServlet?id=next'><button disabled='disabled'>aussetzen</button></a>");
			}
			%>
<br/>
				
				<a href=saveFormular.jsp target="new"><button>speichern</button></a> 
			</div>
		</div>
			
		<br />
		<textarea name="log" id="log" readonly="readonly" style="width: 40%; resize: none;" rows="6"><%out.print(spiel.getLogging());%></textarea>
	</center>
	<%@ include file="footer.jsp"%>