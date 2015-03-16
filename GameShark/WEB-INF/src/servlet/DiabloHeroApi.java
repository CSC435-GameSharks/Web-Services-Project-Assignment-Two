package servlet;

import Diablo.Career;
import Diablo.Hero;
import Diablo.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.FileNotFoundException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.*;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.json.*;
import javax.json.stream.*;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * @author csaroff
 */
@WebServlet(name = "DiabloHeroApi", urlPatterns = {"/api/DiabloHero"})
public class DiabloHeroApi extends HttpServlet {

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
        response.setContentType("application/json; charset=UTF-8");
        Hero hero = null;

        String battleID = "";
        if(request.getParameter("battleID") != null){
            battleID=request.getParameter("battleID");
        }
        String strHero = "";
        if(request.getParameter("hero") != null){
             strHero = request.getParameter("hero");
        }

        hero = makeServerAPIRequest(battleID, strHero);
        if(hero==null){
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        try(JsonWriter writer = Json.createWriter(response.getWriter())){
            writer.writeObject(toJsonObject(hero));
        }
        
    }
    private Hero makeServerAPIRequest(String battleID, String strHero){
        Hero diabloHero = null;
        InputStream is = null;
        
        try{
            URL url = new URL("http://us.battle.net/api/d3/profile/" + battleID + "/hero/" + strHero);
            System.out.println("http://us.battle.net/api/d3/profile/" + battleID + "/hero/" + strHero);
            int code = ((HttpURLConnection)url.openConnection()).getResponseCode();
            if(code<200 || code>299){
                return null;
            }
            is = url.openStream();
            JsonReader jsonReader = Json.createReader(is);
            JsonObject jsonObject = jsonReader.readObject();
            jsonReader.close();
            String errorCode = jsonObject.getString("code", null);
            if(jsonObject==null||(errorCode!=null&&errorCode.equals("NOTFOUND"))){
                return null;
            }
            diabloHero = new Hero(jsonObject);
        }catch(Exception e){
            Logger.getLogger(DiabloHeroServlet.class.getName()).log(Level.SEVERE, null, e);
        }finally {
            try {
                if(is!=null)
                    is.close();
            }catch (IOException ex) {
                Logger.getLogger(DiabloHeroServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return diabloHero;
    }
    private JsonObject toJsonObject(Hero hero){
        Map<String, Object> properties = new HashMap<String, Object>();
        //properties.put("javax.json.stream.JsonGenerator.prettyPrinting", Boolean.valueOf(true));
        properties.put(JsonGenerator.PRETTY_PRINTING, true);
        
            JsonBuilderFactory factory = Json.createBuilderFactory(properties);
        JsonObjectBuilder tempObj = factory.createObjectBuilder()
        .add("id", hero.getId())
        .add("name", hero.getName())
        .add("className", hero.getClassName())
        .add("gender", hero.getGender())
        .add("level", hero.getLevel())
        .add("hardcore", hero.isHardcore())
        .add("lastUpdated", hero.getLastUpdated());
        JsonArrayBuilder activeSkillArray = factory.createArrayBuilder();
        for(Skill skill : hero.getActiveSkills()){
            activeSkillArray.add(factory.createObjectBuilder()
                .add("slug",skill.getSlug())
                .add("name",skill.getName())
                .add("icon",skill.getIcon())
                .add("level",skill.getLevel())
                .add("tooltipUrl",skill.getTooltipUrl())
                .add("description",skill.getDescription())
                .add("skillCalcId",skill.getSkillCalcId()));
        }
        tempObj.add("activeSkills", activeSkillArray);
        JsonArrayBuilder passiveSkillArray = factory.createArrayBuilder();
        for(Skill skill : hero.getPassiveSkills()){
            passiveSkillArray.add(factory.createObjectBuilder()
                .add("slug",skill.getSlug())
                .add("name",skill.getName())
                .add("icon",skill.getIcon())
                .add("level",skill.getLevel())
                .add("tooltipUrl",skill.getTooltipUrl())
                .add("description",skill.getDescription())
                .add("skillCalcId",skill.getSkillCalcId()));
        }
        tempObj.add("passiveSkills", passiveSkillArray);
        

        JsonObjectBuilder itemsBuilder = factory.createObjectBuilder();
        Map<String, Item> items = hero.getItems();
        for(String itemName : items.keySet()){
            Item item = items.get(itemName);
            itemsBuilder.add(itemName, factory.createObjectBuilder()
                .add("id", item.getId())
                .add("name", item.getName())
                .add("icon", item.getIcon())
                .add("displayColor", item.getDisplayColor())
                .add("tooltipParams", item.getTooltipParams())
                //Add raw attributes here.
                );
        }
        tempObj.add("items", itemsBuilder);

        JsonObjectBuilder statsBuilder = factory.createObjectBuilder();
        Map<String, Double> stats = hero.getStats();
        for(String statName : stats.keySet()){
            statsBuilder.add(statName, stats.get(statName)); 
        }
        tempObj.add("stats", statsBuilder);

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