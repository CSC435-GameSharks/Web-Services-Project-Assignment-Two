<html>
  <head>
    <title>
      League Summoner JSP
    </title>
  </head>
  <body>
    <h3>
      Summoner Lookup
    </h3>
    <div>
      <form method="POST" action="LeagueSummonerServ">
            Summoner Name:
            <input type="text" id="txtName" name="name"></br>
	      <input type="submit" id="btnSubmit" value="Submit"></br>
      </form>
    </div>
      <div>
    <%@page import="League.LeagueSummoner"%>
    <%
       if(request.getAttribute("summoner") != null){
         LeagueSummoner summoner = (LeagueSummoner) request.getAttribute("summoner");
         out.println("<img src='http://ddragon.leagueoflegends.com/cdn/5.5.1/img/profileicon/"+ summoner.getProfileIcon() + ".png'/>");
         out.println("<BR>Summoner name: " + summoner.getName());
         out.println("<BR>Summoner ID: " + summoner.getID());
         out.println("<BR>Summoner level: "+ summoner.getLevel());
       }else{
            out.println(" Not a valid Summoner Name");
       }
    %>
    </div>
  </body>
</html>