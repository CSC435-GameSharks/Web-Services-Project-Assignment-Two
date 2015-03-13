<html>
<head>
    <title> Diablo Hero Overview </title>
</head>
<body>
    <%@ page import="Diablo.Hero" %>
    <% 
        String sOutput = "";
        Hero hero = (Hero)request.getAttribute("hero");
        if(hero!=null){
            sOutput += hero.toHtmlString();
        }
        else{
            sOutput+="The Diablo Hero does not exist.";
        }
        out.println(sOutput);
    %>
</body>
</html>