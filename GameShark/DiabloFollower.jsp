<html>
<head>
    <title>
      Diablo Follower Overview
    </title>
</head>
<body>
    <h1> Diablo Follower Information </h1>
    <select onchange="this.options[this.selectedIndex].value && (window.location.assign(this.options[this.selectedIndex].value));">
            <option value="\">Select...</option>
            <option value="DiabloFollowerServ?follower=enchantress">Enchantress</option>
            <option value="DiabloFollowerServ?follower=templar">Templar</option>
            <option value="DiabloFollowerServ?follower=scoundrel">Scoundrel</option>
    </select>
    <%@ page import="Diablo.*" %>
    <%
    Follower follower;
    if(request.getParameter("follower") != null){
        follower = (Follower)request.getAttribute("follower");
        StringBuilder sbReturn = new StringBuilder();
        sbReturn.append("           </br>\n");
        sbReturn.append("Name:    " + follower.getName()+ "</br>\n");
        for(ActiveSkill skill : follower.getActiveSkills()){
            sbReturn.append("           </br>\n");
            sbReturn.append("Name:    " + skill.getName()+ "</br>\n");
            sbReturn.append("Level:    " + skill.getLevel()+ "</br>\n");
            sbReturn.append("Description:    " + skill.getDescription()+ "</br>\n");
            sbReturn.append("<img src=\"" + skill.IMAGE_URL_PREFIX + skill.getIcon() + ".png\">" + "</br>\n");
        }
        out.println(sbReturn.toString());
    }
    %>

</body>
</html>