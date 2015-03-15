/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import League.Item;
import League.LeagueBasicChampion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
@WebServlet(name = "LeagueChampionApi", urlPatterns = {"/api/LeagueChampionApi"})
public class LeagueChampionApi extends HttpServlet {

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
        response.setContentType("application/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             HttpSession s = request.getSession();
            // this.setUpChampTable(out);
            //this.setUpItemTable(out);
            ArrayList<LeagueBasicChampion> champs = getChampions(out);
            ArrayList<Item> items = getItems(out);
            out.print("got items and champs?");

            String sOutput = "PROBLEM";
            sOutput = makeJson(champs, items, out);

            request.setAttribute("json", sOutput);
            RequestDispatcher rd = request.getRequestDispatcher("/api/JsonResponseServ");
            rd.forward(request, response);

        }
    }
    
    private String makeJson(ArrayList<LeagueBasicChampion> champs, ArrayList<Item> items, PrintWriter out){
        String sReturn = "";
        out.print("HAVING SOME FUCKING ISSUES MAN");
        
        sReturn = "{\"champions\":[";
        for(int i = 0; i< champs.size();i++){
            sReturn += "{";
            sReturn += "\"name\":\"" + champs.get(i).getName() + "\",";
            sReturn += "\"id\":" + champs.get(i).getID() + ",";
            sReturn += "\"image\":\"" + champs.get(i).getImage() + "\"";
            if (i == champs.size() - 1) {
                 sReturn += "}";
             } else {
                 sReturn += "},";
             }
        }sReturn +="],";
        
        sReturn += "\"items\":[";
        for(int i = 0; i< items.size();i++){
            sReturn += "{";
            sReturn += "\"name\":\"" + items.get(i).getName() + "\",";
            sReturn += "\"id\":" + items.get(i).getID() + ",";
            sReturn += "\"image\":\"" + items.get(i).getImage() + "\",";
            sReturn += "\"stats\":{";
                sReturn += "\"armor\":" + items.get(i).armor + ",";
                sReturn += "\"attackSpeed\":" + items.get(i).attackSpeed + ",";
                sReturn += "\"block\":" + items.get(i).block + ",";
                sReturn += "\"critDamage\":" + items.get(i).critDamage + ",";
                sReturn += "\"critChance\":" + items.get(i).critChance + ",";
                sReturn += "\"hp\":" + items.get(i).hp + ",";
                sReturn += "\"hpRegen\":" + items.get(i).hpRegen + ",";
                sReturn += "\"mp\":" + items.get(i).mp + ",";
                sReturn += "\"mpRegen\":" + items.get(i).mpRegen + ",";
                sReturn += "\"magicDamage\":" + items.get(i).magicDamage + ",";
                sReturn += "\"movementSpeed\":" + items.get(i).movementSpeed + ",";
                sReturn += "\"physicalDamage\":" + items.get(i).physicalDamage + ",";
                sReturn += "\"spellBlock\":" + items.get(i).spellBlock + ",";
                sReturn += "\"parmor\":" + items.get(i).parmor + ",";
                sReturn += "\"pattackSpeed\":" + items.get(i).pattackSpeed + ",";
                sReturn += "\"pblock\":" + items.get(i).pblock + ",";
                sReturn += "\"pdodge\":" + items.get(i).pdodge + ",";
                sReturn += "\"pcritChance\":" + items.get(i).pcritChance + ",";
                sReturn += "\"pcritDamage\":" + items.get(i).pcritDamage + ",";
                sReturn += "\"php\":" + items.get(i).php + ",";
                sReturn += "\"phpRegen\":" + items.get(i).phpRegen + ",";
                sReturn += "\"pmp\":" + items.get(i).pmp + ",";
                sReturn += "\"pmpRegen\":" + items.get(i).pmpRegen + ",";
                sReturn += "\"plifeSteal\":" + items.get(i).plifeSteal + ",";
                sReturn += "\"pmagicDamage\":" + items.get(i).pmagicDamage + ",";
                sReturn += "\"pmovementSpeed\":" + items.get(i).pmovementSpeed + ",";
                sReturn += "\"pphysicalDamage\":" + items.get(i).physicalDamage + ",";
                sReturn += "\"pspellBlock\":" + items.get(i).pspellBlock + ",";
                sReturn += "\"pspellVamp\":" + items.get(i).pspellVamp + "}";
            if (i == items.size() - 1) {
                 sReturn += "}";
             } else {
                 sReturn += "},";
             }
        }sReturn +="]}";        
        
        return sReturn;
    }
    
       private ArrayList<LeagueBasicChampion> getChampions(PrintWriter out) {
        Connection conn = null;
        Statement stmt = null;

        ArrayList<LeagueBasicChampion> champions = new ArrayList<>();

        try {
           // out.println("<br>Getting champions");
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csc435", "kelly", "kelly");

            //out.println("connection made");

            stmt = (Statement) conn.createStatement();

            // Step 3: Execute a SQL SELECT query
            String sqlStr = "select * from lolChampions";
            ResultSet rset = stmt.executeQuery(sqlStr);  // Send the query to the server
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
