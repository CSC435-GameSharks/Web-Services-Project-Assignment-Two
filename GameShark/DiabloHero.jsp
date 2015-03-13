<html>
<head>
    <title> Diablo Hero Overview </title>
</head>
<body>
    <%@ page import="Diablo.Hero" %>
    <% 
        //if(request.getAttribute("dne")!=null){
            String sOutput = "";
            Hero hero = (Hero)request.getAttribute("hero");
        //    String dne = (String)request.getAttribute("dne");
            if(hero!=null){
                sOutput += hero.toHtmlString();
            }
            else{
                sOutput+="The Diablo Hero does not exist.";
            }
            out.println(sOutput);
        //}
    %>
</body>
</html>