<%@page import="League.LeagueSummoner"%>
<html>
  <head>
    <title>
      League Summoner JSP
    </title>
  </head>
  <body>
    <h3>
      Summoner Info
    </h3>
    <div>
      <form action="LeagueSummonerServ">
            Summoner Name:
            <input type="text" id="txtName" name="name"></br>
	      <input type="submit" id="btnSubmit" value="Submit"></br>
      </form>
    </div>
    <%
       if(request.getAttribute("summoner") != null){
         LeagueSummoner summoner = (LeagueSummoner) request.getAttribute("summoner");
         out.println("<BR>Summoner name: " + summoner.getName());
         out.println("<BR>Summoner ID: " + summoner.getID());
         out.println("<BR>Summoner level: "+ summoner.getLevel());
         out.println("<BR>Summoner icon: ");
         out.println("<img src='http://ddragon.leagueoflegends.com/cdn/5.5.1/img/profileicon/"+ summoner.getProfileIcon() + ".png'/>");
   
       }else{
            out.println(" No User Character Data");
       }
    %>
  </body>
</html>