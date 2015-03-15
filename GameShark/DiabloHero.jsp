<html>
<head>
    <title> Diablo Hero Overview </title>
</head>
<body>
    <%@ page import="Diablo.*" %>
    <% 
            String sOutput = "";
            Hero hero = (Hero)request.getAttribute("hero");
            if(hero!=null){
                StringBuilder sbReturn = new StringBuilder();
                sbReturn.append("           </br>\n");
                sbReturn.append("Name:    " + hero.getName()+ "</br>\n");
                sbReturn.append("Level:    " + hero.getLevel()+ "</br>\n");
                
                sbReturn.append("</br>\n Base Stats </br>");
                for(String statKey : hero.getStats().keySet()){
                    sbReturn.append(statKey+":    " + hero.getStats().get(statKey) +  "</br>\n");
                    sbReturn.append("</br>\n");
                }
                
                for(ActiveSkill skill : hero.getActiveSkills()){
                    sbReturn.append("           </br>\n");
                    sbReturn.append("Name:    " + skill.getName()+ "</br>\n");
                    sbReturn.append("Level:    " + skill.getLevel()+ "</br>\n");
                    sbReturn.append("Description:    " + skill.getDescription()+ "</br>\n");
                    sbReturn.append("<img src=\"" + skill.IMAGE_URL_PREFIX + skill.getIcon() + ".png\">" + "</br>\n");
                }
                for(PassiveSkill skill : hero.getPassiveSkills()){
                    sbReturn.append("           </br>\n");
                    sbReturn.append("Name:    " + skill.getName()+ "</br>\n");
                    sbReturn.append("Level:    " + skill.getLevel()+ "</br>\n");
                    sbReturn.append("Description:    " + skill.getDescription()+ "</br>\n");
                    sbReturn.append("<img src=\"" + skill.IMAGE_URL_PREFIX + skill.getIcon() + ".png\">" + "</br>\n");
                }
                for(String key : hero.getItems().keySet()){
                    sbReturn.append(key + ":    </br>\n");
                    Item value = hero.getItems().get(key);
                    sbReturn.append("           </br>\n");
                    sbReturn.append("Name:    " + value.getName()+ "</br>\n");
                    sbReturn.append("<img src=\"" + value.IMAGE_URL_PREFIX + value.getIcon() + ".png\">" + "</br>\n");
                }
                sOutput += sbReturn.toString();
            }
            else{
                sOutput+="The Diablo Hero does not exist.";
            }
            out.println(sOutput);
        //}
    %>
</body>
</html>