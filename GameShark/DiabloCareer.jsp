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
    <% 
        if(request.getAttribute("dne")!=null){
            String sOutput = "";
            Career career = (Career)request.getAttribute("career");
            String dne = (String)request.getAttribute("dne");
            if(career!=null){
                sOutput += career.toHtmlString();
            }
            else{
                sOutput+="The Diablo Career that you entered does not exist.";
            }
            out.println(sOutput);
        }
    %>
</body>

</html>