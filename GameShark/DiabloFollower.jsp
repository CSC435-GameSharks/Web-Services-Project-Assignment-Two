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
    <%@ page import="Diablo.Follower" %>
    <%
    Follower follower;
    if(request.getParameter("follower") != null){
        follower = (Follower)request.getAttribute("follower");
        out.println(follower.toHtmlString());
    }
    %>

</body>
</html>