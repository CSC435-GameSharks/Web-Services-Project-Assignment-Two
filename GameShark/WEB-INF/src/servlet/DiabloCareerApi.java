/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.json.*;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Diablo.Career;
import Diablo.*;

/**
 *
 * @author csaroff
 */
@WebServlet(name = "DiabloCareerApi", urlPatterns = {"/api/DiabloCareer"})
public class DiabloCareerApi extends HttpServlet {
    /*
     * The controller for the Diablo Career Viewer.
     */

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //?battleTagName=faithpaladin&battleTagCode=1761
        response.setContentType("application/json; charset=UTF-8");

        HttpSession s = request.getSession();
        String battleTagName = "";
        String battleTagCode = "";
        Career career=null;
        if(request.getParameter("battleTagName") != null){
            battleTagName = request.getParameter("battleTagName");
        }
        
        if(request.getParameter("battleTagCode") != null){
            battleTagCode = request.getParameter("battleTagCode");
        }
        //Check to see if we have valid information to make a request
        if(!(battleTagName.equals("")&&battleTagCode.equals(""))){
            career = makeServerAPIRequest(battleTagName, battleTagCode);
            //request.setAttribute("career", makeServerAPIRequest(battleTagName, battleTagCode));
            //System.out.println(toJSON(career));
        }else{
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        if(career==null){
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        try(JsonWriter writer = Json.createWriter(response.getWriter())){
            writer.writeObject(toJsonObject(career));
        }
    }     

    /**
     * This data should not be cached since an update of a user's career profile 
     * would change the response.  i.e., this api call is not idempotent.
     * @return A Diablo Career using the user supplied realm and character name
     */
    private static Career makeServerAPIRequest(String  battleTagName, String battleTagCode){
        Career diabloPlayer = null;
        InputStream is = null;
        
        try{
            is = new URL("http://us.battle.net/api/d3/profile/" + battleTagName + "-" + battleTagCode + "/").openStream();
            System.out.println("http://us.battle.net/api/d3/profile/" + battleTagName + "-" + battleTagCode + "/");
            JsonReader jsonReader = Json.createReader(is);
            JsonObject jsonObject = jsonReader.readObject();
            String errorCode = jsonObject.getString("code", null);
            if(jsonObject==null||(errorCode!=null&&errorCode.equals("NOTFOUND"))){
                System.out.println("jsonObject contained error message");
                return null;
            }
            diabloPlayer = new Career(jsonObject);
            jsonReader.close();

        } 
        catch (MalformedURLException ex) {
            Logger.getLogger(DiabloCareerServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ioe){
            Logger.getLogger(DiabloCareerServlet.class.getName()).log(Level.SEVERE, null, ioe);
        } catch(Exception e){
            Logger.getLogger(DiabloCareerServlet.class.getName()).log(Level.SEVERE, null, e);
        }finally {
            try {
                is.close();
            } catch (IOException ex) {
                Logger.getLogger(DiabloCareerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return diabloPlayer;
    }
    /**
     * Converts a Diablo.Career to a JSON string
     * @param  career The Career to be stringified
     * @return        a JSON String representing the Diablo.Career
     */
    private JsonObject toJsonObject(Career career){
        JsonBuilderFactory factory = Json.createBuilderFactory(null);
        JsonObjectBuilder tempObj = factory.createObjectBuilder()
        .add("battleTag", career.getBattleTag())
        .add("paragonLevel", career.getParagonLevel())
        .add("paragonLevelHardcore", career.getParagonLevelHardcore())
        .add("paragonLevelSeason", career.getParagonLevelSeason())
        .add("paragonLevelSeasonHardcore", career.getParagonLevelSeasonHardcore())
        .add("lastHeroPlayed", career.getLastHeroPlayed())
        .add("lastUpdated", career.getLastUpdated())
        .add("kills", factory.createObjectBuilder()
            .add("monsters", career.getKills().getMonsters())
            .add("elites", career.getKills().getElites())
            .add("hardcoreMonsters", career.getKills().getHardcoreMonsters()));
        JsonArrayBuilder heroArray = factory.createArrayBuilder();
        for(AbbreviatedHero hero : career.getHeroes()){
            heroArray.add(factory.createObjectBuilder()
                .add("name",hero.getName())
                .add("id",hero.getId())
                .add("level",hero.getLevel())
                .add("hardcore",hero.isHardcore())
                .add("gender",hero.getGender())
                .add("lastUpdated",hero.getLastUpdated())
                .add("dead",hero.isDead()));
        }
        tempObj.add("heroes", heroArray);
        return tempObj.build();
        
    }

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