<html>
  <head>
    <title>
      WoW Server JSP
    </title>
    <link rel="stylesheet" type="text/css" href="css/WoWStyle.css" />
  </head>
  <body>
    <h3>
      Server Status  
    </h3>
    <div>
      <table class="serverTable">
	<caption>
	  WoW Server Status
	</caption>
	<tr>
	  <th>
	    Name
	  </th>
	  <th>
	    Status
	  </th>
	</tr>
	<%@ page import="WoW.WoWServer" %>
	<%
	   WoWServer[] aryServers = (WoWServer[]) request.getAttribute("servList");
	   for(int i = 0; i < aryServers.length; i++){

	%>
	<tr>
	  <td>
	    <%= aryServers[i].getName() %>
	  </td>
	  <td>
	    <%= aryServers[i].getStatus() %>
	  </td>
	</tr>
	<%
	   }

	%>
    </div>
  </body>
</html>
