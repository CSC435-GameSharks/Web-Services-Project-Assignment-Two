<html>
    <head>
        <title>
            League Server JSP
        </title>
    </head>
    <body>
        <h2>
            League of Legends Server Statuses 
        </h2>
        <div>
            <%@ page import="League.LeagueServer" %>
            <%@ page import="League.LeagueServerService" %>
            <%@ page import="League.LeagueServerIncident" %>
            <%@ page import="League.LeagueServerIncMessage" %>
            <%
            LeagueServer[] servers = (LeagueServer[]) request.getAttribute("serverList");
            for(int i = 0; i < servers.length; i++){
                    //NAME OF SERVER
                    out.println("<dl><dt><h3>" + servers[i].getName()+"</h3><p>");
	
                    LeagueServerService[] services = servers[i].getServices();
                    for(int j = 0; j < services.length; j++){
                        //THE SERVICES OF THE SERVER
                        out.println("<dd><dt><b>" + services[j].getName() +":  </b>");
                        out.print( services[j].getStatus()+"</dd>");
			
                            LeagueServerIncident[] inc = services[j].getIncidents();
                            for(int k = 0; k < inc.length; k++){
                                    //THE INCIDENTS OF THE SERVER
                                    out.println("<dd><ins>Incidents</ins>:</dt>");
                                    out.println("<dd>Created: " + inc[k].getCreatedAt()+"</dd>");
                                    out.println("<dd>Active: " + inc[k].getActive()+"</dd>");
				
                                    LeagueServerIncMessage[] message = inc[k].getMessages();
                                    for(int m = 0; m < message.length; m++){
                                            //THE MESSAGES ABOUT THE INCIDENT
                                            out.println("<dd>"+ message[m].getSeverity()+": ");
                                            out.print("<i>"+ message[m].getContent()+"</i></dd>");
                                    }
                                    out.println("</dd>");
                            }
                    }
                    out.println("</p></dt></dl>");
       }
            %>
        </div>
  </body>
</html>
