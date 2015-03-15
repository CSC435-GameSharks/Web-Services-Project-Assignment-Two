/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import League.Item;
import League.LeagueChampion;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
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
@WebServlet(name = "LeagueBuildABuildServ", urlPatterns = {"/LeagueBuildABuildServ"})
public class LeagueBuildABuildServ extends HttpServlet {

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
        // response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession s = request.getSession();
            out.println("In build a build serv");
            String selectedChampID = "";
            String image = "";
            String item = "";
            LeagueChampion cmp;
            ArrayList<Item> items;
            ArrayList<Item> selectedItems;

            if (request.getParameter("championID") != null && s.getAttribute("currentChampion") != null) {
                selectedChampID = request.getParameter("championID");
                LeagueChampion tmp = (LeagueChampion) s.getAttribute("currentChampion");
                if (tmp.getIDasString().equals(selectedChampID)) {
                    out.println("session champ = requested champ");
                    cmp = tmp;
                } else {
                    out.println("making api call");
                    image = request.getParameter("championImage");
                    cmp = makeAPIRequest(out, selectedChampID, image);
                }
                s.setAttribute("currentChampion", cmp);
                request.setAttribute("championObject", cmp);
            } else if (request.getParameter("championID") != null) {
                image = request.getParameter("championImage");
                selectedChampID = request.getParameter("championID");
                cmp = makeAPIRequest(out, selectedChampID, image);
                s.setAttribute("currentChampion", cmp);
                request.setAttribute("championObject", cmp);
            }else if(s.getAttribute("currentChampion") != null){
                request.setAttribute("championObject", s.getAttribute("currentChampion"));
            }

            if (s.getAttribute("itemList") != null && s.getAttribute("selectedItems") != null) {
                cmp = (LeagueChampion)s.getAttribute("currentChampion");
                out.println("got items and selected items");
                items = (ArrayList<Item>) s.getAttribute("itemList");
                selectedItems = (ArrayList<Item>) s.getAttribute("selectedItems");

                //handle selected item clicked to unselect
                if (request.getParameter("selectedItem") != null) {
                    //edit champion stats
                    item = (String) request.getParameter("selectedItem");
                    int itemID = Integer.parseInt(item);
                    Item tmp = selectedItems.get(itemID);
                    cmp.updateStats(false, tmp);
                    s.setAttribute("currentChampion", cmp);
                    request.setAttribute("championObject", cmp);
                    selectedItems.remove(itemID);

                }

                //handle item clicked to select
                if (request.getParameter("item") != null) {
                    if (selectedItems.size() < 6) {
                        item = (String) request.getParameter("item");
                        int itemID = Integer.parseInt(item);
                        Item tmp = items.get(itemID);
                        if(!selectedItems.contains(tmp)){

                        cmp.updateStats(true, tmp);
                        s.setAttribute("currentChampion", cmp);
                        request.setAttribute("championObject", cmp);
                        selectedItems.add(tmp);
                        }
                    }

                }
                request.setAttribute("itemList", items);
                out.println("got " + items.size() + "items");
                s.setAttribute("selectedItems", selectedItems);
                request.setAttribute("selectedItems", selectedItems);
            }

            RequestDispatcher rd = request.getRequestDispatcher("LeagueBuildABuild.jsp");
            rd.forward(request, response);
        }
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
