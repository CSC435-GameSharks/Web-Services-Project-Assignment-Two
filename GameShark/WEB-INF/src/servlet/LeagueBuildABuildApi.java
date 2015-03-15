/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import League.Item;
import League.LeagueChampSpells;
import League.LeagueChampion;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kellymaestri
 */
public class LeagueBuildABuildApi extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String selectedChampID = "";
            String image = "";
            String item = "";
            LeagueChampion cmp;
            ArrayList<Item> items;
            ArrayList<Item> selectedItems;
            String sOutput = "problem";

            if(request.getParameter("championID") != null && request.getParameter("championImage") !=null) {
                image = request.getParameter("championImage");
                selectedChampID = request.getParameter("championID");
                cmp = makeAPIRequest(out, selectedChampID, image);
                items = this.getItems(out);
                selectedItems = new ArrayList<Item>();
                

                //handle item clicked to select
                if (request.getParameter("item1") != null) {
                        item = (String) request.getParameter("item");
                        int itemID = Integer.parseInt(item);
                        Item tmp = items.get(itemID);
                        if(!selectedItems.contains(tmp)){
                        cmp.updateStats(true, tmp);
                        selectedItems.add(tmp);
                        }
                }
                if (request.getParameter("item2") != null) {
                        item = (String) request.getParameter("item");
                        int itemID = Integer.parseInt(item);
                        Item tmp = items.get(itemID);
                        if(!selectedItems.contains(tmp)){
                        cmp.updateStats(true, tmp);
                        selectedItems.add(tmp);
                        }
                }
                if (request.getParameter("item3") != null) {
                        item = (String) request.getParameter("item");
                        int itemID = Integer.parseInt(item);
                        Item tmp = items.get(itemID);
                        if(!selectedItems.contains(tmp)){
                        cmp.updateStats(true, tmp);
                        selectedItems.add(tmp);
                        }
                }
                if (request.getParameter("item4") != null) {
                        item = (String) request.getParameter("item");
                        int itemID = Integer.parseInt(item);
                        Item tmp = items.get(itemID);
                        if(!selectedItems.contains(tmp)){
                        cmp.updateStats(true, tmp);
                        selectedItems.add(tmp);
                        }
                }
                if (request.getParameter("item5") != null) {
                        item = (String) request.getParameter("item");
                        int itemID = Integer.parseInt(item);
                        Item tmp = items.get(itemID);
                        if(!selectedItems.contains(tmp)){
                        cmp.updateStats(true, tmp);
                        selectedItems.add(tmp);
                        }
                }
                if (request.getParameter("item6") != null) {
                        item = (String) request.getParameter("item");
                        int itemID = Integer.parseInt(item);
                        Item tmp = items.get(itemID);
                        if(!selectedItems.contains(tmp)){
                        cmp.updateStats(true, tmp);
                        selectedItems.add(tmp);
                        }
                }
                sOutput = makeJson(cmp, selectedItems);
            }
            request.setAttribute("json", sOutput);
                RequestDispatcher rd = request.getRequestDispatcher("/api/JsonResponseServ");
                rd.forward(request, response);
        }
    }
    private String makeJson(LeagueChampion cmp, ArrayList<Item> selectedItems){
        String sReturn="";
        sReturn = "{\""+cmp.getName().toLowerCase()+"\":{";
        sReturn += "\"id\":" + cmp.getID() + ",";
        sReturn += "\"name\":\"" + cmp.getName() + "\",";
        sReturn += "\"lore\":\"" + cmp.getLore()+ "\",";
        sReturn += "\"title\":\"" + cmp.getTitle() + "\",";
        sReturn += "\"image\":\"" + cmp.getImage() + "\",";
        
        sReturn += "\"stats\":{";
            sReturn += "\"armor\":" + cmp.getArmor() + ",";
            sReturn += "\"attackDamage\":" + cmp.getAttackDamage() + ",";
            sReturn += "\"attackDamagePerLevel\":" + cmp.getID() + ",";
            sReturn += "\"attackSpeed\":" + cmp.getAttackSpeed() + ",";
            sReturn += "\"critChance\":" + cmp.getCritChance() + ",";
            sReturn += "\"critDamage\":" + cmp.getCritDamage() + ",";
            sReturn += "\"hp\":" + cmp.getHealth() + ",";
            sReturn += "\"hpRegen\":" + cmp.getHealthRegen() + ",";
            sReturn += "\"mp\":" + cmp.getMana() + ",";
            sReturn += "\"mpRegen\":" + cmp.getManaRegen() + ",";
            sReturn += "\"moveSpeed\":" + cmp.getMovementSpeed() + ",";
            sReturn += "\"spellBlock\":" + cmp.getMagicResist() + ",";
            sReturn += "\"spellVamp\":" + cmp.getSpellVamp() + ",";
            sReturn += "\"dodge\":" + cmp.getDodge() + ",";
            sReturn += "\"tenacity\":" + cmp.getTenacity() + ",";
            sReturn += "\"abilityPower\":" + cmp.getAP() + ",";
            sReturn += "\"armorPen\":" + cmp.getArmorPen() + ",";
            sReturn += "\"magicPen\":" + cmp.getMagicPen() + ",";
            sReturn += "\"lifeSteal\":" + cmp.getLifeSteal() + ",";
            sReturn += "\"currentLevel\":" + cmp.getLevel() + "},";
        
            LeagueChampSpells[] spells = cmp.getSkills();
        sReturn += "\"spells\":[";
            for(int i = 0; i<spells.length;i++){
                sReturn += "{";
                sReturn += "\"name\":\"" + spells[i].getName() + "\",";
                sReturn += "\"description\":\"" + spells[i].getDescription() + "\",";
                sReturn += "\"costType\":\"" + spells[i].getCostType() + "\",";
                sReturn += "\"image\":\"" + spells[i].getImage() + "\"";
                if (i == spells.length -1) {
                 sReturn += "}";
             } else {
                 sReturn += "},";
             }

            }sReturn +="],";
            
        sReturn += "\"passive\":{";
            sReturn += "\"name\":\"" + cmp.getPassiveName() + "\",";
            sReturn += "\"description\":\"" + cmp.getPassiveDesc() + "\",";
            sReturn += "\"image\":\"" + cmp.getPassiveImage() + "\"},";
        
 
        
        sReturn += "\"selectedItems\":[";
        for(int i = 0; i< selectedItems.size();i++){
            sReturn += "{";
            sReturn += "\"name\":\"" + selectedItems.get(i).getName() + "\",";
            sReturn += "\"id\":" + selectedItems.get(i).getID() + ",";
            sReturn += "\"image\":\"" + selectedItems.get(i).getImage() + "\"";
            sReturn += "\"stats\":{";
                sReturn += "\"armor\":" + selectedItems.get(i).armor + ",";
                sReturn += "\"attackSpeed\":" + selectedItems.get(i).attackSpeed + ",";
                sReturn += "\"block\":" + selectedItems.get(i).block + ",";
                sReturn += "\"critDamage\":" + selectedItems.get(i).critDamage + ",";
                sReturn += "\"critChance\":" + selectedItems.get(i).critChance + ",";
                sReturn += "\"hp\":" + selectedItems.get(i).hp + ",";
                sReturn += "\"hpRegen\":" + selectedItems.get(i).hpRegen + ",";
                sReturn += "\"mp\":" + selectedItems.get(i).mp + ",";
                sReturn += "\"mpRegen\":" + selectedItems.get(i).mpRegen + ",";
                sReturn += "\"magicDamage\":" + selectedItems.get(i).magicDamage + ",";
                sReturn += "\"movementSpeed\":" + selectedItems.get(i).movementSpeed + ",";
                sReturn += "\"physicalDamage\":" + selectedItems.get(i).physicalDamage + ",";
                sReturn += "\"spellBlock\":" + selectedItems.get(i).spellBlock + ",";
                sReturn += "\"parmor\":" + selectedItems.get(i).parmor + ",";
                sReturn += "\"pattackSpeed\":" + selectedItems.get(i).pattackSpeed + ",";
                sReturn += "\"pblock\":" + selectedItems.get(i).pblock + ",";
                sReturn += "\"pdodge\":" + selectedItems.get(i).pdodge + ",";
                sReturn += "\"pcritChance\":" + selectedItems.get(i).pcritChance + ",";
                sReturn += "\"pcritDamage\":" + selectedItems.get(i).pcritDamage + ",";
                sReturn += "\"php\":" + selectedItems.get(i).php + ",";
                sReturn += "\"phpRegen\":" + selectedItems.get(i).phpRegen + ",";
                sReturn += "\"pmp\":" + selectedItems.get(i).pmp + ",";
                sReturn += "\"pmpRegen\":" + selectedItems.get(i).pmpRegen + ",";
                sReturn += "\"plifeSteal\":" + selectedItems.get(i).plifeSteal + ",";
                sReturn += "\"pmagicDamage\":" + selectedItems.get(i).pmagicDamage + ",";
                sReturn += "\"pmovementSpeed\":" + selectedItems.get(i).pmovementSpeed + ",";
                sReturn += "\"pphysicalDamage\":" + selectedItems.get(i).physicalDamage + ",";
                sReturn += "\"pspellBlock\":" + selectedItems.get(i).pspellBlock + ",";
                sReturn += "\"pspellVamp\":" + selectedItems.get(i).pspellVamp + "}";
            if (i == selectedItems.size() - 1) {
                 sReturn += "}";
             } else {
                 sReturn += "},";
             }
        }sReturn +="]}}";  

        return sReturn;
    }
    
      private LeagueChampion makeAPIRequest(PrintWriter out, String id, String image) {
        InputStream is = null;
        LeagueChampion champion = null;
        try {
            out.println("Making build a build api request");
            is = new URL("https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion/" + id + "?champData=all&api_key=cc288bed-bfa3-4158-9642-6b276a1381d7").openStream();
            JsonReader jsonReader = Json.createReader(is);
            JsonObject json = jsonReader.readObject();
            champion = new LeagueChampion(json, image);

            jsonReader.close();
            is.close();
        } catch (MalformedURLException ex) {
            Logger.getLogger(LeagueNames.class.getName()).log(Level.SEVERE, null, ex);
            return champion;

        } catch (IOException ioe) {
            return champion;

        } catch (Exception e) {
            Logger.getLogger(LeagueNames.class.getName()).log(Level.SEVERE, null, e);
            return champion;
        }
        return champion;
    }
      
          private ArrayList<Item> getItems(PrintWriter out) {
       Connection conn = null;
        Statement stmt = null;

        ArrayList<Item> items = new ArrayList<>();

        try {
            //out.println("<br>Getting items");
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csc435", "kelly", "kelly");

           // out.println("connection made");

            stmt = (Statement) conn.createStatement();
            String sqlStr = "select * from lolItems";
            ResultSet rset = stmt.executeQuery(sqlStr); 

            while (rset.next()) {

                String id = rset.getString("id");
                String name = rset.getString("name");
                String image = rset.getString("image");
                String desc = rset.getString("description");
              //  out.println(id + " : " + name);
                Item item = new Item(name, id, image, desc);
                
                stmt = (Statement) conn.createStatement();
                sqlStr = "SELECT * FROM lolItemStats WHERE id="+id;
                ResultSet rset2 = stmt.executeQuery(sqlStr);
                if(rset2.first()){
                    item.updateStats(rset2);
                }
                items.add(item);

            }

        } catch (SQLException ex) {
            out.println(ex.toString());
        } catch (ClassNotFoundException ex) {
            out.println(ex.toString());
        }
        //out.println("return");
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }

        } catch (SQLException ex) {
            out.println(ex.toString());
        }
         if (items.isEmpty()) {
            items = null;
        }
       // out.println("got " + items.size() + "items");
        return items;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
