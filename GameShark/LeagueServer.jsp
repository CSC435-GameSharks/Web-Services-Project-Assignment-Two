<html>
    <head>
        <title>
            League Server JSP
        </title>
    </head>
    <body>
        <h1>
            League of Legends Server Statuses
        </h1>
        <div>
            <%@ page import="League.LeagueServer" %>
            <%@ page import="League.LeagueServerService" %>
            <%@ page import="League.LeagueServerIncident" %>
            <%@ page import="League.LeagueServerIncMessage" %>
            <%
            LeagueServer[] servers = (LeagueServer[]) request.getAttribute("serverList");
            for(int i = 0; i < servers.length; i++){
                    //NAME OF SERVER
                    out.println("<h2>" + servers[i].getName()+"</h2>");
	
                    LeagueServerService[] services = servers[i].getServices();
                    out.println("<ul style='list-style-type:none'>");
                    for(int j = 0; j < services.length; j++){
                        //THE SERVICES OF THE SERVER
                        out.println("<li><b>" + services[j].getName() +":  </b>");
                        out.print( services[j].getStatus());
			
                            LeagueServerIncident[] inc = services[j].getIncidents();
                            out.println("<ul style='list-style-type:none'>");
                            for(int k = 0; k < inc.length; k++){
                                    //THE INCIDENTS OF THE SERVER
                                    out.println("<li><ins>Incidents</ins>:</li>");
                                    out.println("<ul style='list-style-type:none'>");
                                    out.println("<li>Created: " + inc[k].getCreatedAt()+"</li>");
                                    out.println("<li>Active: " + inc[k].getActive()+"</li>");
				
                                    LeagueServerIncMessage[] message = inc[k].getMessages();
                                    for(int m = 0; m < message.length; m++){
                                            //THE MESSAGES ABOUT THE INCIDENT
                                            out.println("<li>"+ message[m].getSeverity()+": ");
                                            out.print("<i>"+ message[m].getContent()+"</i></li>");
                                    }
                                    out.println("</ul>");
                            }
                            out.println("</ul></li>");
                    }
                    out.println("</ul>");
       }
            %>
        </div>
  </body>
</html>
