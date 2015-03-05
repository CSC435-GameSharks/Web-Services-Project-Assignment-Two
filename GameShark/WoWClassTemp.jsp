<html>
  <head>
    <title>GameShart</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
  <body>
    <h2>
      WoW Class
    </h2>
    <div>
      <form action="wowClassServ">
	<div>
	  <table>
	    <tr>
	      <td>
		Select Class:
	      </td>
	      <td>
		<select>
		  <option value="1">Warror</option>
		  <option value="2">Paladin</option>
		  <option value="3">Hunter</option>
		  <option value="4">Rouge</option>
		  <option value="5">Priest</option>
		  <option value="6">Death Knight</option>
		  <option value="7">Shaman</option>
		  <option value="8">Mage</option>
		  <option value="9">Warlock</option>
		  <option value="10">Monk</option>
		  <option value="11">Druid</option>
		</select>
	      </td>
	  <tr>
	  </table>
	</div>
	</br>
	<%@ page import="WoW.WoWClassDetail" %>
	<%@ page import="WoW.WoWSpell" %>
	   if(request.getAttribute("wowClass") != null){
	       WoWClassDetail wowClass = (WoWClassDetail) request.getAttribute("wowClass");
	%>
	<div>
	  <table>
	    <caption>
	      <%= wowClass.getName() %>
	    </caption>
	    <tr>
	      <td>
		Roles:&#160;<%= wowClass.getRolesString() %>
	      </td>
	    </tr>
	    <tr>
	      <td>
		<table>
		  <caption>
		    Spells
		  </caption>
		  <tr>
		    <th>
		      LvL
		    </th>
		    <th>
		      Spell
		    </th>
		    <th>
		      LvL
		    </th>
		    <th>
		      Spell
		    </th>
		    <th>
		      LvL
		    </th>
		    <th>
		      Spell
		    </th>
		  </tr>
		  <%
		     WoWSpell[] wowSpells = wowClass.getSpells();
		     int rowBreak = 0;
		     for(int i = 0; i < wowSpells.length; i++){
		         if (rowBreak == 0){
			     //Start a new Row
		  %>
		     <tr>
		       <td>
			 <%= wowSpells[i].getLvl() %>
		       </td>
		       <td>
			 <%= wowSpells[i].getName() %>
		       </td>
		  <%
		         rowBreak ++;
		         }else if(rowBreak == 1){
		  %>
		      <td>
		        <%= wowSpells[i].getLvl() %>
		      </td>
		      <td>
		        <%= wowSpells[i].getName() %>
		      </td>
		  <%
		         rowBreak ++;
		         }else {
		  %>
		      <td>
		        <%= wowSpells[i].getLvl() %>
		      </td>
		      <td>
		      <td>
		        <%= wowSpells[i].getName() %>
		      </td>
		  </tr>
		  <%
		         rowBreak = 0;
		         }
		     }
		  %>
		</table>
	      </td>
	    </tr>
	  </table>
	</div>
	<%
	   }
	%>
      </form>
    </div>
</html>
