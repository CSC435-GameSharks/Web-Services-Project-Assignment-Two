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
		if(leagueServers == null){
			out.println("servers are null");
		}
		int size = servers.length;
		for(int i = 0; i < size; i++){
			out.println("<BR>Server Name: " + servers[i].getName());
			out.println("<BR>Server Slug: " + servers[i].getSlug());
		
			LeagueServerService[] services = servers[i].getServices();
			for(int j = 0; j < services.length; j++){
				out.println("<BR>Service: " + services[j].getName());
				out.println("<BR>Slug: " + services[j].getSlug());
				out.println("<BR>Status: " + services[j].getStatus());
				
				LeagueServerIncident[] inc = services[j].getIncidents();
				for(int k = 0; k < inc.length; k++){
					out.println("<BR>Server Incidents: ");
					out.println("<BR>Created: " + inc[k].getCreatedAt());
					out.println("<BR>Active: " + inc[k].getActive());
					
					LeagueServerIncMessage[] message = inc[k].getMessages();
					for(int m = 0; m < message.length; m++){
						out.println("<BR>Severity: " + message[m].getSeverity());
						out.println("<BR>Author: "+ message[m].getAuthor());
						out.println("<BR>Created: "+ message[m].getCreatedAt());
						out.println("<BR>Updated: "+ message[m].getUpdatedAt());
						out.println("<BR>Content: "+ message[m].getContent());
					}
				}
			}
	   }
	%>
    </div>
  </body>
</html>
