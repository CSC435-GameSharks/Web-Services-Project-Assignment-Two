
<%@page import="League.Item"%>
<%@page import="java.util.ArrayList"%>
<html>
    <head>

        <style>
            #rightside {
                position: fixed;
                line-height:30px;
                float:left;
                padding:5px;
                background-color: #eeeeee;
            }


            #skillsection {
                float:left;
                width: 95%;
                border: 5px solid gray;
                margin: 0px;

            }
            .skillImages{
                float:left;
                width: 15%;
                padding:25px;
                border: 5px black;
                margin: 0px;
            }
            #section{       
                float:left;
                padding-left:250px;
            }
            #itemsection{       
                float:left;
                width: 95%;
                border: 1px solid gray;
                margin: 5px;
            }
            #itemSelectSection{       
                float:left;
                width: 80%;
                height:15%;
              //  border: 1px solid gray;
            }
            .itemSelectionImage{
                float:left;
              //  width:50px;
               // height:50px;
                padding:25px;
                background-color:#eeeeee;
            }
            .itemImages{
                float:left;
                width:50px;
                height:50px;
                padding:25px;
                margin: 0px;
            }
            #stats{
                display:block;
                text-align:left;
                margin:auto auto;
                position:relative;
                width:200px;
                border:1px solid #bbb;
                list-style-type:none;
            }
            #stats td{
                width:190px;
                padding:5px 6px 6px 5px;
                border-bottom:1px solid #bbb;
                border-top:1px solid #fff;
                font-size:14px;
            }
            .labelText{
                color: #0099cc;
                float:right;
                font-weight: bold;
                
            }
            #lvl{
                position:absolute;
                top:115px;
                font-size:15px;
                left:132px;
            }


        </style>
        <%@page import="League.LeagueChampion"%>
        <%
                if (request.getAttribute("championObject") != null) {
                    LeagueChampion champ = (LeagueChampion) request.getAttribute("championObject");
 
                    %>
        <title>
            <%out.print(champ.getName());%>: Build-A-Build
        </title>
    </head>
    <body>
        <div id='rightside'>
<%
                    out.print("<h1>" + champ.getName() + "</h1>");
                    out.print("<img src='http://ddragon.leagueoflegends.com/cdn/5.2.1/img/champion/" + champ.getImage() + "'/>");
            %>
 <div id="lvl">
  <form method="POST" action="LeagueBuildABuildServ">
      
<select name="level">
        <option>Lvl</option>
        <option value="18">18</option>
        <option value="17">17</option>
        <option value="16">16</option>
        <option value="15">15</option>
        <option value="14">14</option>
        <option value="13">13</option>
        <option value="12">12</option>
        <option value="11">11</option>
        <option value="10">10</option>
        <option value="9">9</option>
        <option value="8">8</option>
        <option value="7">7</option>
        <option value="6">6</option>
        <option value="5">5</option>
        <option value="4">4</option>
        <option value="3">3</option>
        <option value="2">2</option>
        <option value="1">1</option>
    </select> 
      <%out.print(champ.getLevel());%>
      <input type="submit">
  </form>
            </div>
            <table id="stats">
                <tr>
                    <td>Health: <span class="labelText" id='health'><%out.print(champ.getHealth());%></span></td></tr>
                <tr>
                    <td>Health Regen: <label class="labelText" id='healthregen'><%out.print(champ.getHealthRegen());%></label></td></tr>
                <tr>
                    <td>Mana: <label class="labelText" id='mana'><%out.print(champ.getMana());%></label></td></tr>
                <tr>
                    <td>Mana Regen: <label class="labelText" id='manaregen'><%out.print(champ.getManaRegen());%></label></td></tr>
                <tr>
                    <td>Armor: <label class="labelText" id='armor'><%out.print(champ.getArmor());%></label></td></tr>
                <tr>
                    <td>Magic Resist: <label class="labelText" id='magicresist'><%out.print(champ.getMagicResist());%></label></td></tr>
                <tr>
                    <td>Dodge: <label class="labelText" id='magicresist'><%out.print(champ.getDodge());%></label></td></tr>
                <tr>
                    <td>Movement Speed: <label class="labelText" id='movementspeed'><%out.print(champ.getMovementSpeed());%></label></td> </tr>
                <tr>
                    <td>Attack Damage: <label class="labelText" id='attackdamage'><%out.print(champ.getAttackDamage());%></label></td></tr>
                <tr>
                    <td>Attack Speed: <label class="labelText" id='attackspeed'><%out.print(champ.getAttackSpeed());%></label></td></tr>
                <tr>
                    <td>Crit Chance: <label class="labelText" id='crit'><%out.print(champ.getCritChance());%></label></td></tr>
                <tr>
                    <td>Crit Damage: <label class="labelText" id='hcritdamage'><%out.print(champ.getCritDamage());%></label></td></tr>
                <tr>
                    <td>Ability Power: <label class="labelText" id='abilitypower'><%out.print(champ.getAP());%></label></td></tr>
                <tr>
                    <td>Armor Pen: <label class="labelText" id='armorpen'><%out.print(champ.getArmorPen());%></label></td></tr>
                <tr>
                    <td>Magic Pen: <label class="labelText" id='magicpen'><%out.print(champ.getMagicPen());%></label></td></tr>
             <tr>
                    <td>Life Steal: <label class="labelText" id='magicpen'><%out.print(champ.getLifeSteal());%></label></td></tr>
             <tr>
                    <td>Spell Vamp: <label class="labelText" id='magicpen'><%out.print(champ.getSpellVamp());%></label></td></tr>
            
            </table>
        </div>
        <div id="section">
            <div id="skillsection">

                <div class='skillImages'>
                    <img  src='http://ddragon.leagueoflegends.com/cdn/5.2.1/img/passive/<%out.print(champ.getPassiveImage());%>'>
                    <span><br><b><%out.print(champ.getPassiveName());%></b>
                        <p><%out.print(champ.getPassiveDesc());%></p>

                    </span>

                </div>
                <div class='skillImages' ><img src='http://ddragon.leagueoflegends.com/cdn/5.2.1/img/spell/<%out.print(champ.getSkillQImage());%>'>
                    <span><br><b><%out.print(champ.getSkillQName());%></b>
                        <p><%out.print(champ.getSkillQDesc());%></p>
                </div>
                <div class='skillImages'><img src='http://ddragon.leagueoflegends.com/cdn/5.2.1/img/spell/<%out.print(champ.getSkillWImage());%>'>
                    <span><br><b><%out.print(champ.getSkillWName());%></b>
                        <p><%out.print(champ.getSkillWDesc());%></p>

                </div>
                <div class='skillImages'><img src='http://ddragon.leagueoflegends.com/cdn/5.2.1/img/spell/<%out.print(champ.getSkillEImage());%>'>
                    <span><br><b><%out.print(champ.getSkillEName());%></b>
                        <p><%out.print(champ.getSkillEDesc());%></p>
                </div>
                <div class='skillImages'><img src='http://ddragon.leagueoflegends.com/cdn/5.2.1/img/spell/<%out.print(champ.getSkillRImage());%>'>
                    <span><br><b><%out.print(champ.getSkillRName());%></b>
                        <p><%out.print(champ.getSkillRDesc());%></p>
                </div>
            </div>
                        <%
                    ArrayList<Item> items;
                    ArrayList<Item> selectedItems;
                         if(request.getAttribute("itemList") != null){
                             items = (ArrayList<Item>) request.getAttribute("itemList");
                         }else{
                             items = (ArrayList<Item>) session.getAttribute("itemList");
                         }
                         if(request.getAttribute("selectedItems") != null){
                             selectedItems = (ArrayList<Item>) request.getAttribute("selectedItems");
                         }else{
                             selectedItems = (ArrayList<Item>) session.getAttribute("selectedItems");
                         }    
                             
                        %>
                        
                        
                <div>
                    Selected Items
                    
                </div>
            <div id='itemSelectSection'>
                <%
                  for(int i = 0; i < 6; i++){
                      if(i<selectedItems.size()){
                          
                      
                %>

                <form class='itemSelectionImage' method="POST" action="LeagueBuildABuildServ">
                    <input type='hidden' name='selectedItem' value='<% out.print(i);%>'>
                    <input  type='image' src='http://ddragon.leagueoflegends.com/cdn/5.2.1/img/item/<%out.print(selectedItems.get(i).getImage());%>' alt='Submit Form'/>
                </form>
                    <%
                  }else{
                          %>
                          <div class='itemSelectionImage'>
                    <input type='hidden' name='selectedItem' value='blah'>
                    <input  type='image' src='images/1001.png'/></div>
                      <%
                        }
                }
                    %>

            </div>


            <div id="itemsection">

                <%
                    for (int i = 0; i < items.size(); i++) {
                        
                %>

                <div class="itemImages">
                    
                    <form method="POST" action="LeagueBuildABuildServ">
                    
                        <input type='hidden' name='item' value='<%out.print(i);%>'>
                        <input type='image' src='http://ddragon.leagueoflegends.com/cdn/5.2.1/img/item/<%out.print(items.get(i).getImage());%>' alt='Submit Form'/>
                   
                    </form>

                </div>

                <%

                    }


                %>



            </div>      


            <%                } else {
                    out.print("DEBUG: something went wrong");
                }
            %>
        </div>
    </body>
</html>
