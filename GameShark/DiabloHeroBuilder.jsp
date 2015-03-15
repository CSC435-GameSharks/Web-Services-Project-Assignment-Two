<html>
<head>
    <title> Diablo Hero Overview </title>
</head>
<body>
    <form method="GET" action="DiabloHeroBuilderServlet">
            Head
            <input id="head" type="text" name="0"></br>
            Shoulders:
            <input id="shoulders" type="text" name="1"></br>
            Torso:
            <input id="torso" type="text" name="2"></br>
            Wrists:
            <input id="wrists" type="text" name="3"></br>
            Hands:
            <input id="hands" type="text" name="4"></br>
            Waist:
            <input id="waist" type="text" name="5"></br>
            Legs:
            <input id="legs" type="text" name="6"></br>
            Bracers:
            <input id="bracers" type="text" name="7"></br>
            Feet:
            <input id="feet" type="text" name="8"></br>
            Main-Hand:
            <input id="mainHand" type="text" name="9"></br>
            Off-Hand:
            <input id="offHand" type="text" name="10"></br>
            Jewelry:
            Right Finger:
            <input id="rightFinger" type="text" name="11"></br>
            Left Finger:
            <input id="leftFinger" type="text" name="12"></br>
            Neck:
            <input id="neck" type="text" name="13"></br>
            <input type="submit" id="btnSubmit" value="Submit"></br>
            </br>
      </form>
    <%@ page import="Diablo.*" %>
    <%@ page import="java.util.*" %>
    <% 
        ItemBuilder itemBuild = (ItemBuilder)request.getAttribute("itemBuild");
        if(itemBuild!=null){
            LinkedHashMap<String, Double> stats = itemBuild.getStats();
            for(String statName : stats.keySet()){%>
                <%=statName%>: <%=stats.get(statName)%></br> 
    <%
            }
        }
    %>
</body>
</html>