<html>
  <head>
    <title>
      League Summoner JSP
    </title>
      <style>

            #formsection {
                line-height:30px;
                float:left;
                padding:5px;
            }
            #statssection {
                float:left;
                width:70%;
                padding:5px;
                border: 5px solid gray;
                margin: 0px;
                
            }
            .stat{
                float:left;
                width: 15%;
               // border: 1px solid black;
                padding:10px;
                margin: 0px;
            }
          
      </style>
  </head>
  <body>
    <h1>
      Summoner Lookup
    </h1>
    <div id="formsection">
      <form method="POST" action="LeagueSummonerServ">
            Summoner Name:
            <input type="text" id="txtName" name="name"></br>
	      <input type="submit" id="btnSubmit" value="Submit"></br>
      </form>
    <%@page import="League.LeagueSummoner"%>
    <%
       if(request.getAttribute("summoner") != null){
         LeagueSummoner summoner = (LeagueSummoner) request.getAttribute("summoner");
         out.println("<img src='http://ddragon.leagueoflegends.com/cdn/5.5.1/img/profileicon/"+ summoner.getProfileIcon() + ".png'/>");
         out.println("<BR><b>Summoner name: </b>" + summoner.getName());
         out.println("<BR><b>Summoner ID: </b>" + summoner.getID());
         out.println("<BR><b>Summoner level: </b>"+ summoner.getLevel());
    %>
      </div>
    <div id="statssection">
        <b><h3>Stats:</h3></b>

       <%for(int i = 0; i < summoner.getStatsSize();i++){%>
       <div class="stat">
                 <%out.print("<b>"+summoner.getStatType(i)+"</b>");%>
                 <ul style="list-style-type:none">
                     <li>Wins: <%out.print(summoner.getStatWins(i));%></li>
                     <li>Losses: <%out.print(summoner.getStatWins(i));%></li>
                     <li>Total Champion Kills: <%out.print(summoner.getStatWins(i));%></li>
                     <li>Total Minion Kills: <%out.print(summoner.getStatWins(i));%></li>
                     <li>Total Neutral Minion Kills: <%out.print(summoner.getStatWins(i));%></li>
                     <li>Total Assists: <%out.print(summoner.getStatWins(i));%></li>
                     <li>Total Turrent Kills: <%out.print(summoner.getStatWins(i));%></li>
                 </ul>
       </div>
         <%
         }
       %></div>
      <%
       }else{
            out.println(" Not a valid Summoner Name");
       }
    %>
  </body>
</html>