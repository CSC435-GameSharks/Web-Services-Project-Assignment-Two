<html>
  <head>
    <title>
      WoW Character JSP
    </title>
    <link rel="stylesheet" type="text/css" href="css/WoWStyle.css" />
  </head>
  <body>
    <h3>
      Player Character Info
    </h3>
    <div>
      <form action="wowCharServ">
	<table>
	  <tr>
	    <td>
	      Character Name:
	    </td>
	    <td>
	      <input type="text" id="txtName" name="name"></br>
	    </td>
	  </tr>
	  <tr>
	    <td>
	      Realm Name:
	    </td>
	    <td>
	      <input type="text" id="txtRealm" name="realm"></br>
	    </td>
	  </tr>
	  <tr colspan="2">
	    <td colspan="2">
	      <input type="submit" id="btnSubmit" value="Submit"></br>
	    </td>
	  </tr>
	</table>
      </form>
    </div>
    <%@ page import="WoW.WoWCharacter" %>
    <%
       if(request.getAttribute("userChar") != null){
         WoWCharacter wowChar = (WoWCharacter) request.getAttribute("userChar");


    %>
    <div class="mainDiv" >
      <h2 class="characterTitle">
	Character Profile
      </h2>
      <table class="charTable">
	<tr>
	  <td class="mainDivPhoto" rowspan="5">
	    <img src="http://us.battle.net/static-render/us/<%= wowChar.getThumbnail() %>" />
	  </td>
	</tr>
	<tr>
	  <td class="nameCell">
	    <%= wowChar.getName() %>
	  </td>
	</tr>
	<tr>
	  <td>
	    Level:&#160;<%= wowChar.getLevel() %>&#160;<%= wowChar.getRace() %>&#160;<%=wowChar.getCharClass() %>
	  </td>
	</tr>
	<tr>
	  <td>
	    Realm:&#160;<%= wowChar.getRealm() %>
	  </td>
	</tr>
	<tr>
	  <td>
	    Battlegroup:&#160;<%= wowChar.getBattleGroup() %>
	  </td>
	</tr>
	<tr>
	  <td>
	    Honurable Kills:&#160;<%= wowChar.getHonorableKills() %>
	  </td>
	</tr>
	<tr>
	  <td>
	    Achievement Points:&#160;<%= wowChar.getAchievementPoints() %>
	  </td>
	</tr>
      </table>
    </div>
    <%
       }else{
    %>
    <div>
      <span>No User Character Data</span>
    </div>
    <%
       }
    %>
  </body>
</html>
