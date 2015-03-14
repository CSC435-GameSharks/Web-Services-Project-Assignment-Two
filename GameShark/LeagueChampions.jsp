
<html>
  <head>
    <title>
      League Champions
    </title>
      <style>
        #section {
                float:left;
                padding:10px;
               // border: 1px solid gray;
                margin: 0px;
                text-align: center;
            }
          
      </style>
  </head>
  <body>
    <h1>
      Select a Champion
    </h1>
    <div>

    <%@page import="League.LeagueBasicChampion"%>
    <%@page import="java.util.ArrayList"%>
    <%

         ArrayList<LeagueBasicChampion> champs = (ArrayList<LeagueBasicChampion>) request.getAttribute("champList");
         for(int i = 0; i < champs.size(); i++){
             %>
             <form id ="section" method="POST" action="LeagueBuildABuildServ">
             <%
         LeagueBasicChampion tmp = champs.get(i);
         out.print("<input type='hidden' name='championID' value='"+tmp.getID()+"'>");
         out.print("<input type='hidden' name='championImage' value='"+tmp.getImage()+"'>");
         out.print("<input type='image' src='http://ddragon.leagueoflegends.com/cdn/5.2.1/img/champion/"+ tmp.getImage() + "'"
                 + "alt='Submit Form'/>");
         out.print("<br><b>" +tmp.getName()+"</b>");
         %>
         </form>
         <%
         
         }


    %>
    </div>
  </body>
</html>