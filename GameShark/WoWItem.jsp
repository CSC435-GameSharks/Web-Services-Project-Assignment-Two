<!DOCTYPE html>
<html>
  <head>
    <title>GameShark</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
  <body>
    <h2>
      WoW Gear
    </h2>
    <div>
      <span>Please go to the following link to get item ids for this site.  WoWs API needs item ids not names :(</span></br>
      <span><a href="http://us.battle.net/wow/en/item/">http://us.battle.net/wow/en/item/</a></span>
    </div>
    <form action="wowItemServ">
      <%@ page import="java.util.HashMap"  %>
      <%
	 HashMap <Integer, Integer> mapStats;
	 if(request.getAttribute("mapStats") != null){
	   mapStats = (HashMap<Integer, Integer>) request.getAttribute("mapStats");
	 }else{
	   mapStats = new HashMap<Integer, Integer>();
	   mapStats.put(3,0);
	   mapStats.put(4,0);
	   mapStats.put(5,0);
	   mapStats.put(6,0);
	   mapStats.put(7,0);
	 }
      %>
      <div>
	<table>
	  <tr>
	    <td>
	      <table>
		<tr>
		  <th colspan="2">
		    Armor
		  </th>
		<tr>
		  <td>Head:</td>
		  <td>
		    <%
		       if(request.getAttribute("head") != null){
		          String temp =  request.getAttribute("head").toString();
		    %>
		    <input type="text" id="txtHead" name="head" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtHead" name="head">
		    <%
		       }
		    %>
		  </td>
		</tr>
		<tr>
		  <td>Shoulder:</td>
		  <td>
		    <%
		       if(request.getAttribute("shoulder") != null){
		          String temp =  request.getAttribute("shoulder").toString();
		    %>
		    <input type="text" id="txtShoulder" name="shoulder" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtShoulder" name="shoulder">
		    <%
		       }
		    %>
		  </td>
		</tr>
		<tr>
		  <td>Chest/Body:</td>
		  <td>
		    <%
		       if(request.getAttribute("chest") != null){
		          String temp =  request.getAttribute("chest").toString();
		    %>
		    <input type="text" id="txtChest" name="chest" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtChest" name="chest">
		    <%
		       }
		    %>
		  <td>
		</tr>
		<tr>
		  <td>Back/Cloak:</td>
		  <td>
		    <%
		       if(request.getAttribute("back") != null){
		          String temp =  request.getAttribute("back").toString();
		    %>
		    <input type="text" id="txtBack" name="back" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtBack" name="back">
		    <%
		       }
		    %>
		  </td>
		</tr>
		<tr>
		  <td>Wrist:</td>
		  <td>
		    <%
		       if(request.getAttribute("wrist") != null){
		          String temp =  request.getAttribute("wrist").toString();
		    %>
		    <input type="text" id="txtWrist" name="wrist" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtWrist" name="wrist">
		    <%
		       }
		    %>
		  </td>
		</tr>
		<tr>
		  <td>Hands</td>
		  <td>
		    <%
		       if(request.getAttribute("hands") != null){
		          String temp =  request.getAttribute("hands").toString();
		    %>
		    <input type="text" id="txtHands" name="hands" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtHands" name="hands">
		    <%
		       }
		    %>
		  </td>
		</tr>
		<tr>
		  <td>Waist</td>
		  <td>
		    <%
		       if(request.getAttribute("waist") != null){
		          String temp =  request.getAttribute("waist").toString();
		    %>
		    <input type="text" id="txtWaist" name="waist" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtWaist" name="waist">
		    <%
		       }
		    %>
		  </td>
		</tr>
		<tr>
		  <td>Legs</td>
		  <td>
		    <%
		       if(request.getAttribute("legs") != null){
		          String temp =  request.getAttribute("legs").toString();
		    %>
		    <input type="text" id="txtLegs" name="legs" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtLegs" name="legs">
		    <%
		       }
		    %>
		  </td>
		</tr>
		<tr>
		  <td>Feet</td>
		  <td>
		    <%
		       if(request.getAttribute("feet") != null){
		          String temp =  request.getAttribute("feet").toString();
		    %>
		    <input type="text" id="txtFeet" name="feet" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtFeet" name="feet">
		    <%
		       }
		    %>
		  </td>
		</tr>
		<tr>
		  <th colspan="2">
		    Weapons
		  </th>
		</tr>
		<tr>
		  <td>Main Hand:</td>
		  <td>
		    <%
		       if(request.getAttribute("mainHand") != null){
		          String temp =  request.getAttribute("mainHand").toString();
		    %>
		    <input type="text" id="txtMainHand" name="maindHand" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtMainHand" name="mainHand">
		    <%
		       }
		    %>
		  </td>
		</tr>
		<tr>
		  <td>Off Hand:</td>
		  <td>
		    <%
		       if(request.getAttribute("offHand") != null){
		          String temp =  request.getAttribute("offHand").toString();
		    %>
		    <input type="text" id="txtOffHand" name="offHand" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtOffHand" name="offHand">
		    <%
		       }
		    %>
		  </td>
		</tr>
		<tr>
		  <th colspan="2">
		    Accessories
		  </th>
		</tr>
		<tr>
		  <td>Neck:</td>
		  <td>
		    <%
		       if(request.getAttribute("neck") != null){
		          String temp =  request.getAttribute("neck").toString();
		    %>
		    <input type="text" id="txtNeck" name="neck" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtNeck" name="neck">
		    <%
		       }
		    %>
		  </td>
		</tr>
		<tr>
		  <td>Trinket:</td>
		  <td>
		    <%
		       if(request.getAttribute("trinket1") != null){
		          String temp =  request.getAttribute("trinket1").toString();
		    %>
		    <input type="text" id="txtTrinket1" name="trinket1" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtTrinket1" name="trinket1">
		    <%
		       }
		    %>
		  </td>
		</tr>	
		<tr>
		  <td>Trinket:</td>
		  <td>
		    <%
		       if(request.getAttribute("trinket2") != null){
		          String temp =  request.getAttribute("trinket2").toString();
		    %>
		    <input type="text" id="txtTrinket2" name="trinket2" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtTrinket2" name="trinket2">
		    <%
		       }
		    %>
		  </td>
		</tr>
		<tr>
		  <td>Finger:</td>
		  <td>
		    <%
		       if(request.getAttribute("finger1") != null){
		          String temp =  request.getAttribute("finger1").toString();
		    %>
		    <input type="text" id="txtFinger1" name="finger1" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtFinger1" name="finger1">
		    <%
		       }
		    %>
		  </td>
		</tr>
		<tr>
		  <td>Finger:</td>
		  <td>
		    <%
		       if(request.getAttribute("finger2") != null){
		          String temp =  request.getAttribute("finger2").toString();
		    %>
		    <input type="text" id="txtFinger2" name="finger2" value="<%= temp %>" >
		    <%
		       }else{
		    %>
		    <input type="text" id="txtFinger2" name="finger2">
		    <%
		       }
		    %>
		  </td>
		</tr>
	      </table>
	    </td>
	    <td>
	      <table>
		<tr>
		  <td>STR:</td>
		  <td><%= mapStats.get(4) %></td>
		</tr>
		<tr>
		  <td>AGI:</td>
		  <td><%= mapStats.get(3) %></td>
		</tr>
		<tr>
		  <td>STA:</td>
		  <td><%= mapStats.get(7) %></td>
		</tr>
		<tr>
		  <td>INT:</td>
		  <td><%= mapStats.get(5) %></td>
		</tr>
		<tr>
		  <td>SPI:</td>
		  <td><%= mapStats.get(6) %></td>
		</tr>
	      </table>
	    </td>
	  </tr>
	  <tr>
	    <td>
	      <input type="submit" id="btnSubmit" value="Submit"></br>
	    </td>
	  </tr>
	</table>
      </div>
    </form>
  </body>
</html>
