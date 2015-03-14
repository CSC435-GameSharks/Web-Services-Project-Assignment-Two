/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import League.Item;
import League.LeagueBasicChampion;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kellymaestri
 */
@WebServlet(name = "LeagueChampionServ", urlPatterns = {"/LeagueChampionServ"})
public class LeagueChampionServ extends HttpServlet {

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
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {

            HttpSession s = request.getSession();
            // this.setUpChampTable(out);
            //this.setUpItemTable(out);
            ArrayList<LeagueBasicChampion> champs = getChampions(out);
            ArrayList<Item> items = getItems(out);
            ArrayList<Item> selectedItems = new ArrayList<Item>(5);

            if (items == null) {
                out.print("items null");
            }
            if (champs == null) {
                out.print("champs null");
            }

            s.setAttribute("itemList", items);
            s.setAttribute("selectedItems", selectedItems);
            request.setAttribute("champList", champs);
            RequestDispatcher rd = request.getRequestDispatcher("LeagueChampions.jsp");
            rd.forward(request, response); 
        }
    }

    private void setUpChampTable(PrintWriter out) {
        Connection conn = null;
        Statement stmt = null;
        InputStream is = null;
        out.println("setting up table");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csc435", "kelly", "kelly");
            out.println("<br>about to update ");
            stmt = (Statement) conn.createStatement();
            String sqlStr = "TRUNCATE TABLE lolChampions";
            stmt.execute(sqlStr);
            is = new URL("https://na.api.pvp.net/api/lol/na/v1.2/champion?api_key=cc288bed-bfa3-4158-9642-6b276a1381d7").openStream();

            JsonReader jsonReader = Json.createReader(is);
            JsonObject json = jsonReader.readObject();
            JsonArray champions = json.getJsonArray("champions");
            out.println("<br> champs gotten: " + champions.size());
            for (int i = 0; i < champions.size(); i++) {

                String name;
                String id;
                String image;
                JsonObject chmp = champions.getJsonObject(i);
                id = chmp.get("id").toString();
                out.println("<br>" + id);

                try {
                    is = new URL("https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion/" + id + "?champData=image&api_key=cc288bed-bfa3-4158-9642-6b276a1381d7").openStream();

                    jsonReader = Json.createReader(is);
                    json = jsonReader.readObject();
                    name = json.getString("name").replace("\"", "").replace("'", "\\'");
                    JsonObject im = json.getJsonObject("image");
                    image = im.getString("full");
                    out.println("<br>" + name);

                    jsonReader.close();

                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csc435", "kelly", "kelly");
                    stmt = (Statement) conn.createStatement();
                    sqlStr = "insert into lolChampions values (" + id + ", '" + name + "', '" + image + "')";
                    stmt.executeUpdate(sqlStr);
                } catch (IOException ex) {
                    out.println("<br>Invalid ID Found");
                }

            }
        } catch (SQLException ex) {
            out.println(ex.toString());
        } catch (ClassNotFoundException ex) {
            out.println(ex.toString());
        } catch (MalformedURLException ex) {
            out.println(ex.toString());
        } catch (IOException ex) {
            Logger.getLogger(LeagueChampionServ.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (is != null) {
                is.close();
            }

        } catch (SQLException ex) {
            out.println(ex.toString());
        } catch (IOException ex) {
            Logger.getLogger(LeagueChampionServ.class.getName()).log(Level.SEVERE, null, ex);
        }
        out.println("table set up");
    }

    private void setUpItemTable(PrintWriter out) {
        Connection conn = null;
        Statement stmt = null;
        InputStream is = null;
        out.println("<BR>setting up item table");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csc435", "kelly", "kelly");
            stmt = (Statement) conn.createStatement();
            String sqlStr = "DROP TABLE IF EXISTS lolItemStats";
            stmt.execute(sqlStr);
            
            stmt = (Statement) conn.createStatement();
            sqlStr = "DROP TABLE IF EXISTS lolItems";
            stmt.execute(sqlStr);
            
            stmt = (Statement) conn.createStatement();
            sqlStr = "CREATE TABLE lolItems(id int,"
                                       + " name varchar(50),"
                                       + " description varchar(1024),"
                                       + " image varchar(50),"
                                       + " PRIMARY KEY(id) )";
            stmt.execute(sqlStr);
            
            stmt = (Statement) conn.createStatement();
            sqlStr = "CREATE TABLE lolItemStats(id int,"
                                        +" armor  double, attackSpeed double, block double, critDamage double,"
                                        +" critChance double, hp double, hpRegen double, mp double, mpRegen double,"
                                        +" magicDamage double,  movementSpeed double, physicalDamage double, spellBlock double,"
                                        +" pArmor double, pAttackSpeed double, pBlock double, pCritDamage double, pCritChance double,"
                                        +" pHP double, pHPRegen double, pMP double, pMPRegen double, pLifeSteal double, pMagicDamage double,"
                                        +" pMovementSpeed double, pPhysicalDamage double, pSpellBlock double, pSpellVamp double, pDodge double,"
                                        +" PRIMARY KEY (id),"
                                        +" FOREIGN KEY (id) REFERENCES lolItems(id))";
            stmt.execute(sqlStr);

            is = new URL("https://global.api.pvp.net/api/lol/static-data/na/v1.2/item?itemListData=all&api_key=cc288bed-bfa3-4158-9642-6b276a1381d7").openStream();

            JsonReader jsonReader = Json.createReader(is);
            JsonObject json = jsonReader.readObject();
            jsonReader.close();

            JsonObject data = json.getJsonObject("data");
            out.println("<BR>Got Item data: " + data.size());

            for (String id : data.keySet()) {
                JsonObject tmp = data.getJsonObject(id);
                String name = tmp.getString("name").replace("\"", "").replace("'", "\\'");
                boolean bool;
                if(tmp.get("consumed")!= null){
                    bool = tmp.getBoolean("consumed");
                }else if(tmp.get("requiredChampion")!= null){
                    bool = true;
                }else if(tmp.get("inStore")!= null){
                    bool = !tmp.getBoolean("inStore");
                }else if(name.contains("(Trinket)")){
                    bool = true;
                }
                else{
                    bool = false;
                }
                
                if (!name.startsWith("Enchantment") && !bool) {
                    out.println("<BR>" + name);
                    double armor, attackSpeed, block, critDamage, critChance,  hp;
                    double hpRegen, mp, mpRegen, magicDamage, movementSpeed, physicalDamage;
                    double spellBlock, parmor, pattackSpeed, pblock,pcritDamage, pcritchance;
                    double  php, phpRegen, pmp, pmpRegen, plifeSteal, pmagicDamage;
                    double pmovementSpeed, pphysicalDamage, pspellBlock, pspellVamp, pdodge;

                    String itemID = tmp.get("id").toString();
                    String desc = tmp.getString("plaintext").replace("\"", "").replace("'", "\\'");
                    JsonObject stats = tmp.getJsonObject("stats");
                    if(stats != null){
                    
                    if (stats.get("FlatArmorMod") != null) {
                        armor = Double.parseDouble(stats.get("FlatArmorMod").toString());
                    } else {
                        armor = 0;
                    }
                    if (stats.get("FlatAttackSpeedMod") != null) {
                        attackSpeed = Double.parseDouble(stats.get("FlatAttackSPeedMod").toString());
                    } else {
                        attackSpeed = 0;
                    }
                    if (stats.get("FlatBlockMod") != null) {
                        block = Double.parseDouble(stats.get("FlatBlockMod").toString());
                    } else {
                        block = 0;
                    }
                    if (stats.get("FlatCritChanceMod") != null) {
                        critChance = Double.parseDouble(stats.get("FlatCritChanceMod").toString());
                    } else {
                        critChance = 0;
                    }
                    if (stats.get("FlatCritDamagekMod") != null) {
                        critDamage = Double.parseDouble(stats.get("FlatCritDamageMod").toString());
                    } else {
                        critDamage = 0;
                    }
                    if (stats.get("FlatHPPoolMod") != null) {
                        hp = Double.parseDouble(stats.get("FlatHPPoolMod").toString());
                    } else {
                        hp = 0;
                    }
                    if (stats.get("FlatHPRegenMod") != null) {
                        hpRegen = Double.parseDouble(stats.get("FlatHPRegenMod").toString());
                    } else {
                        hpRegen = 0;
                    }
                    if (stats.get("FlatMPPoolMod") != null) {
                        mp = Double.parseDouble(stats.get("FlatMPPoolMod").toString());
                    } else {
                        mp = 0;
                    }
                    if (stats.get("FlatMPRegenMod") != null) {
                        mpRegen = Double.parseDouble(stats.get("FlatMPRegenMod").toString());
                    } else {
                        mpRegen = 0;
                    }
                    if (stats.get("FlatMagicDamageMod") != null) {
                        magicDamage = Double.parseDouble(stats.get("FlatMagicDamageMod").toString());
                    } else {
                        magicDamage = 0;
                    }
                    if (stats.get("FlatMovementSpeedMod") != null) {
                        movementSpeed = Double.parseDouble(stats.get("FlatMovementSpeedMod").toString());
                    } else {
                        movementSpeed = 0;
                    }
                    if (stats.get("FlatPhysicalDamageMod") != null) {
                        physicalDamage = Double.parseDouble(stats.get("FlatPhysicalDamageMod").toString());
                    } else {
                        physicalDamage = 0;
                    }
                    if (stats.get("FlatSpellBlockMod") != null) {
                        spellBlock = Double.parseDouble(stats.get("FlatSpellBlockMod").toString());
                    } else {
                        spellBlock = 0;
                    }
                    if (stats.get("PercentArmorMod") != null) {
                        parmor = Double.parseDouble(stats.get("PercentArmorMod").toString());
                    } else {
                        parmor = 0;
                    }
                    if (stats.get("PercentAttackSpeedMod") != null) {
                        pattackSpeed = Double.parseDouble(stats.get("PercentAttackSpeedMod").toString());
                    } else {
                        pattackSpeed = 0;
                    }
                    if (stats.get("PercentBlockMod") != null) {
                        pblock = Double.parseDouble(stats.get("PercentBlockMod").toString());
                    } else {
                        pblock = 0;
                    }
                    if (stats.get("PercentCritChanceMod") != null) {
                        pcritchance = Double.parseDouble(stats.get("PercentCritChanceMod").toString());
                    } else {
                        pcritchance = 0;
                    }
                    if (stats.get("PercentCritDamageMod") != null) {
                        pcritDamage = Double.parseDouble(stats.get("PercentCritDamageMod").toString());
                    } else {
                        pcritDamage = 0;
                    }
                    if (stats.get("PercentHPPoolMod") != null) {
                        php = Double.parseDouble(stats.get("PercentHPPoolMod").toString());
                    } else {
                        php = 0;
                    }
                    if (stats.get("PercentHPRegenMod") != null) {
                        phpRegen = Double.parseDouble(stats.get("PercentHPRegenMod").toString());
                    } else {
                        phpRegen = 0;
                    }
                    if (stats.get("PercentLifeStealMod") != null) {
                        plifeSteal = Double.parseDouble(stats.get("PercentLifeStealMod").toString());
                    } else {
                        plifeSteal = 0;
                    }
                    if (stats.get("PercentMPPoolMod") != null) {
                        pmp = Double.parseDouble(stats.get("PercentMPPoolMod").toString());
                    } else {
                        pmp = 0;
                    }
                    if (stats.get("PercentMPRegenMod") != null) {
                        pmpRegen = Double.parseDouble(stats.get("PercentMPRegenMod").toString());
                    } else {
                        pmpRegen = 0;
                    }
                    if (stats.get("PercentMagicDamageMod") != null) {
                        pmagicDamage = Double.parseDouble(stats.get("PercentMagicDamageMod").toString());
                    } else {
                        pmagicDamage = 0;
                    }
                    if (stats.get("PercentMovementSpeedMod") != null) {
                        pmovementSpeed = Double.parseDouble(stats.get("PercentMovementSpeedMod").toString());
                    } else {
                        pmovementSpeed = 0;
                    }
                    if (stats.get("PercentPhysicalDamageMod") != null) {
                        pphysicalDamage = Double.parseDouble(stats.get("PercentPhysicalDamageMod").toString());
                    } else {
                        pphysicalDamage = 0;
                    }
                    if (stats.get("PercentSpellBlockMod") != null) {
                        pspellBlock = Double.parseDouble(stats.get("PercentSpellBlockMod").toString());
                    } else {
                        pspellBlock = 0;
                    }
                    if (stats.get("PercentSpellVampMod") != null) {
                        pspellVamp = Double.parseDouble(stats.get("PercentSpellVampMod").toString());
                    } else {
                        pspellVamp = 0;
                    }
                    if (stats.get("PercentDodgeMod") != null) {
                        pdodge = Double.parseDouble(stats.get("PercentDodgeMod").toString());
                    } else {
                        pdodge = 0;
                    
                    }
                    }else{
                        out.print("<BR>everything is 0");
                     armor=0; attackSpeed=0; block=0; critDamage=0; critChance=0;  hp=0;
                    hpRegen=0; mp=0; mpRegen=0; magicDamage=0; movementSpeed=0; physicalDamage=0;
                    spellBlock=0; parmor=0; pattackSpeed=0; pblock=0;pcritDamage=0; pcritchance=0;
                     php=0; phpRegen=0; pmp=0; pmpRegen=0; plifeSteal=0; pmagicDamage=0;
                    pmovementSpeed=0; pphysicalDamage=0; pspellBlock=0; pspellVamp=0; pdodge=0;
                    }
                    

                    JsonObject im = tmp.getJsonObject("image");
                    String image = im.getString("full");
 
                    // conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csc435", "kelly", "kelly");
                    stmt = (Statement) conn.createStatement();
                    sqlStr = "insert into lolItems values (" + itemID + ",'" + name + "', '" + desc + "', '" + image + "')";
                    stmt.executeUpdate(sqlStr);
                
                    stmt = (Statement) conn.createStatement();
                    sqlStr = "insert into lolItemStats values ("+itemID+","+armor+","+ attackSpeed+","+ block+","+ critDamage+","+ critChance+","+  hp+","+
                    hpRegen+","+ mp+","+ mpRegen+","+ magicDamage+","+ movementSpeed+","+ physicalDamage+","+
                    spellBlock+","+ parmor+","+ pattackSpeed+","+ pblock+","+pcritDamage+","+ pcritchance+","+
                    php+","+ phpRegen+","+ pmp+","+ pmpRegen+","+ plifeSteal+","+ pmagicDamage+","+
                    pmovementSpeed+","+ pphysicalDamage+","+ pspellBlock+","+ pspellVamp+","+ pdodge+")";
                    stmt.executeUpdate(sqlStr);
                    out.print("<BR>everything inserted into tables");
                }
            }

        } catch (SQLException ex) {
            out.println(ex.toString());
        } catch (ClassNotFoundException ex) {
            out.println(ex.toString());
        } catch (MalformedURLException ex) {
            out.println(ex.toString());
        } catch (IOException ex) {
            out.println(ex.toString());
        }
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (is != null) {
                is.close();
            }
        } catch (SQLException ex) {
            out.println(ex.toString());
        } catch (IOException ex) {
            out.println(ex.toString());
        }
        out.println("<BR>item table set up");
    }

    private ArrayList<LeagueBasicChampion> getChampions(PrintWriter out) {
        Connection conn = null;
        Statement stmt = null;

        ArrayList<LeagueBasicChampion> champions = new ArrayList<>();

        try {
            out.println("<br>Getting champions");
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csc435", "kelly", "kelly");

            out.println("connection made");

            stmt = (Statement) conn.createStatement();

            // Step 3: Execute a SQL SELECT query
            String sqlStr = "select * from lolChampions";
            ResultSet rset = stmt.executeQuery(sqlStr);  // Send the query to the server
            out.println("results gotten");
            // Step 4: Process the query result set
            while (rset.next()) {
                // Print a paragraph <p>...</p> for each record
                String id = rset.getString("id");
                String name = rset.getString("name");
                String image = rset.getString("image");
               // out.println(id + " : " + name);
                LeagueBasicChampion champ = new LeagueBasicChampion(name, id, image);
                champions.add(champ);

            }

        } catch (SQLException ex) {
            out.println(ex.toString());
        } catch (ClassNotFoundException ex) {
            out.println(ex.toString());
        }
        out.println("return");
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
        if (champions.isEmpty()) {
            champions = null;
        }
        return champions;
    }

    private ArrayList<Item> getItems(PrintWriter out) {
       Connection conn = null;
        Statement stmt = null;

        ArrayList<Item> items = new ArrayList<>();

        try {
            out.println("<br>Getting items");
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csc435", "kelly", "kelly");

            out.println("connection made");

            stmt = (Statement) conn.createStatement();
            String sqlStr = "select * from lolItems";
            ResultSet rset = stmt.executeQuery(sqlStr); 

            while (rset.next()) {

                String id = rset.getString("id");
                String name = rset.getString("name");
                String image = rset.getString("image");
                String desc = rset.getString("description");
                out.println(id + " : " + name);
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
        out.println("return");
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
        out.println("got " + items.size() + "items");
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
