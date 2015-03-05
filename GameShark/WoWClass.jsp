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
      <form action="wowClassServ" mentod="post">
	<%@ page import="WoW.WoWClassDetail" %>
	<%@ page import="WoW.WoWSpell" %>
	<%@ page import="WoW.WoWTalent" %>
	<%@ page import="WoW.WoWSpec" %>
	<div>
	  <table>
	    <tr>
	      <td>
		Select Class:
	      </td>
	      <td>
		<% 
		   if(request.getAttribute("wowClass") != null){
		   WoWClassDetail wowTemp = (WoWClassDetail) request.getAttribute("wowClass");
		%>
		<select name="classID" onchange='this.form.submit()'>
		  <%
		     if(wowTemp.getID() == 1){
		  %>
		  <option value="1" selected="selected">Warror</option>
		  <%
		     }else{
		  %>
		  <option value="1">Warror</option>
		  <%
		     }
		  %>
		  <%
		     if(wowTemp.getID() == 2){
		  %>
		  <option value="2" selected="selected">Paladin</option>
		  <%
		     }else{
		  %>
		  <option value="2">Paladin</option>
		  <%
		     }
		  %>
		  <%
		     if(wowTemp.getID() == 3){
		  %>
		  <option value="3" selected="selected">Hunter</option>
		  <%
		     }else{
		  %>
		  <option value="3">Hunter</option>
		  <%
		     }
		  %>
		  <%
		     if(wowTemp.getID() == 4){
		  %>
		  <option value="4" selected="selected">Rouge</option>
		  <%
		     }else{
		  %>
		  <option value="4">Rouge</option>
		  <%
		     }
		  %>
		  <%
		     if(wowTemp.getID() == 5){
		  %>
		  <option value="5" selected="selected">Priest</option>
		  <%
		     }else{
		  %>
		  <option value="5">Priest</option>
		  <%
		     }
		  %>
		  <%
		     if(wowTemp.getID() == 6){
		  %>
		  <option value="6" selected="selected">Death Knight</option>
		  <%
		     }else{
		  %>
		  <option value="6">Death Knight</option>
		  <%
		     }
		  %>
		  <%
		     if(wowTemp.getID() == 7){
		  %>
		  <option value="7" selected="selected">Shaman</option>
		  <%
		     }else{
		  %>
		  <option value="7">Shaman</option>
		  <%
		     }
		  %>
		  <%
		     if(wowTemp.getID() == 8){
		  %>
		  <option value="8" selected="selected">Mage</option>
		  <%
		     }else{
		  %>
		  <option value="8">Mage</option>
		  <%
		     }
		  %>
		  <%
		     if(wowTemp.getID() == 9){
		  %>
		  <option value="9" selected="selected">Warlock</option>
		  <%
		     }else{
		  %>
		  <option value="9">Warlock</option>
		  <%
		     }
		  %>
		  <%
		     if(wowTemp.getID() == 10){
		  %>
		  <option value="10" selected="selected">Monk</option>	
		  <%
		     }else{
		  %>
		  <option value="10">Monk</option>	
		  <%
		     }
		  %>
		  <%
		     if(wowTemp.getID() == 11){
		  %>
		  <option value="11" selected="selected">Druid</option>
		  <%
		     }else{
		  %>
		  <option value="11">Druid</option>
		  <%
		     }
		  %>
		</select>
		<% 
		   }else{
		%>
		<select name="classID" onchange='this.form.submit()'>
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
		<%
		   }
		%>
	      </td>
	  <tr>
	  </table>
	</div>
	</br>
	<%
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
		<%
		   WoWSpec[] wowSpecs = wowClass.getSpecs();
		   boolean bFirstPass = true;
		   Integer iSpecID = -1;

		   if(request.getAttribute("wowSpecID") != null){
		       bFirstPass = false;
		       iSpecID = Integer.parseInt((String)request.getAttribute("wowSpecID"));
		   }
	           for(int i = 0; i < wowSpecs.length; i++){
	               if(bFirstPass || (wowSpecs[i].getID() == iSpecID)){
		%>
		   <input type="radio" name="spec" value="<%= wowSpecs[i].getID() %>" onchange='this.form.submit()' checked> <%= wowSpecs[i].getName() %>
		<%
		           bFirstPass = false;
		       }else{
		%>
		   <input type="radio" name="spec" value="<%= wowSpecs[i].getID() %>" onchange='this.form.submit()' > <%= wowSpecs[i].getName() %>
		<%
		       }
		   }
		%>
	       </td>
	    </tr>
	    <tr>
	      <td>
		<table>
		  <caption>
		    Spells
		  </caption>
		  <tr>
		    <th>LvL</th>
		    <th>Spell</th>
		    <th>LvL</th>
		    <th>Spell</th>
		    <th>LvL</th>
		    <th>Spell</th>
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
	    <tr>
	      <td>
		<table>
		  <caption>
		    Talents
		  </caption>
		  <tr>
		    <th>Level</th>
		    <th>Talent</th>
		    <th>Talent</th>
		    <th>Talent</th>
		  </tr>
		  <%
		     WoWTalent[] wowTalents = wowClass.getTalents();
		     rowBreak = 0;
		     for(int i = 0; i < wowTalents.length; i++){
		         if(rowBreak == 0){
			     //start a new row
		  %>
		    <tr>
		      <td>
			<%= wowTalents[i].getLvl() %>
		      </td>
		      <td>
			<%= wowTalents[i].getName() %>
		      </td>
		  <%
		     
		     rowBreak ++;
		     }else if(rowBreak == 1){
		  %>
		      <td>
			<%= wowTalents[i].getName() %>
		      </td>
		   <%
		      
		      rowBreak ++;
		      }else{	
		   %>
		     <td>
		       <%= wowTalents[i].getName() %>
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
	<noscript><input type="submit" value="Submit"/></noscript>
      </form>
    </div>
</html>
