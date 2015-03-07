<html>
  <head>
    <title>
      League Server JSP
    </title>
  </head>
  <body>
    <div>
	<%@ page import="League.LeagueServer" %>
	<%@ page import="League.LeagueServerService" %>
	<%@ page import="League.LeagueServerIncident" %>
	<%@ page import="League.LeagueServerIncMessage" %>
	<%
LeagueServer[] servers = (LeagueServer[]) request.getAttribute("serverList");
for(int i = 0; i < servers.length; i++){
	out.println("<BR>Server Name: " + servers[i].getName());

	LeagueServerService[] services = servers[i].getServices();
	for(int j = 0; j < services.length; j++){
		out.println("<BR><span style='padding-left:2em'>Service: " + services[j].getName() +"</span>");
		out.println("<BR><span style='padding-left:2em'>Status: " + services[j].getStatus()+ "</span>");
		
		LeagueServerIncident[] inc = services[j].getIncidents();
		for(int k = 0; k < inc.length; k++){
			out.println("<BR><span style='padding-left:2em'>Server Incidents: </span>");
			out.println("<BR><span style='padding-left:3em'>Created: " + inc[k].getCreatedAt()+"</span>");
			out.println("<BR><span style='padding-left:3em'>Active: " + inc[k].getActive()+"</span>");
			
			LeagueServerIncMessage[] message = inc[k].getMessages();
			for(int m = 0; m < message.length; m++){
				out.println("<BR><span style='padding-left:3em'>Severity: " + message[m].getSeverity()+"</span>");
				out.println("<BR><span style='padding-left:3em'>Author: "+ message[m].getAuthor()+"</span>");
				out.println("<BR><span style='padding-left:3em'>Created: "+ message[m].getCreatedAt()+"</span>");
				out.println("<BR><span style='padding-left:3em'>Updated: "+ message[m].getUpdatedAt()+"</span>");
				out.println("<BR><span style='padding-left:3em'>Content: "+ message[m].getContent()+"</span>");
			}
		}
	}
  }
	%>
    </div>
  </body>
</html>
