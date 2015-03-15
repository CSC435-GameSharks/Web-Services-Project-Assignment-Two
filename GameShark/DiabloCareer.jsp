<html>
<head>
    <title> Diablo Characters Overview </title>
</head>

<body>
    <form method="GET" action="DiabloCareerServlet">
            Battle Tag Name:
            <input id="battleTagName" type="text" name="battleTagName">
            </br>Battle Tag Code:
            <input id="battleTagCode" type="text" name="battleTagCode">
            </br>
            <input type="submit" id="btnSubmit" value="Submit"></br>
            </br>
      </form>
    <%@ page import="Diablo.Career" %>
    <%@ page import="Diablo.AbbreviatedHero" %>
    <% 
        if(request.getAttribute("dne")!=null){
            String sOutput = "";
            Career career = (Career)request.getAttribute("career");
            String dne = (String)request.getAttribute("dne");
            if(career!=null){
                StringBuilder sbReturn = new StringBuilder();
                sbReturn.append("           </br>\n");
                sbReturn.append("Battle Tag:    " + career.getBattleTag()+ "</br>\n");
                sbReturn.append("Paragon Level " + career.getParagonLevel() + "</br>\n");
                sbReturn.append("Number of Kills: " + "</br>\n");
                sbReturn.append("Monsters: " + career.getKills().getMonsters() + "</br>\n");
                sbReturn.append("Elites: " + career.getKills().getElites() + "</br>\n");
                sbReturn.append("Hardcore Monsters: " + career.getKills().getHardcoreMonsters() + "</br>\n");
                sbReturn.append("Heroes:" + "</br>\n");
                for(AbbreviatedHero hero : career.getHeroes()){
                    sbReturn.append("           </br>\n");
                    sbReturn.append("<a href=\"DiabloHeroServlet?"
                    + "battleID="+career.getBattleTag().replaceAll("#", "-")
                    + "&hero=" + hero.getId() 
                    + "\">" + "Name:    " + hero.getName()+ "</a></br>\n");
                    sbReturn.append("Level:    " + hero.getLevel()+ "</br>\n");
                    sbReturn.append("Dead:    " + (hero.isDead()?"Yes":"No") + "</br>\n");
                }
                sOutput+=sbReturn.toString();
            }
            else{
                sOutput+="The Diablo Career that you entered does not exist.";
            }
            out.println(sOutput);
        }
    %>
</body>
</html>