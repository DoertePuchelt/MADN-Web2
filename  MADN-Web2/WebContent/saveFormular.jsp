<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Speichern Sie das Spiel</h2>
<p>
<form method='post' action='XMLServlet'>
	Dateiname: <input name="Dateiname" type="text" size="30" maxlength="30">
	<select name="auswahl">
		<option value="csv">.csv</option>
		<option value="ser">.ser</option>
		<option value="pdf">.pdf</option>
		<option value=".xml">.xml</option>
	</select>
</p>
	<button type="submit">OK!</button>
</form>
</body>
</html>