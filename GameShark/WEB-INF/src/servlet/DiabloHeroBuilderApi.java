package servlet;

import Diablo.Career;
import Diablo.Hero;
import Diablo.Item;
import Diablo.ItemBuilder;
import Diablo.Database;
import Diablo.ItemBuilder;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
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
/**
 * @author csaroff
 */
@WebServlet(name = "DiabloHeroBuilderApi", urlPatterns = {"/api/DiabloHeroBuilder"})
public class DiabloHeroBuilderApi extends HttpServlet {

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
        int NUM_ITEMS=13;
        HttpSession s = request.getSession();
        String battleID = "";
        ArrayList<String> itemIds = new ArrayList<String>();
        ArrayList<Item> items = new ArrayList<Item>();
        for(int i=0; i<NUM_ITEMS; i++){
            if(request.getParameter(i+"")!=null&&!request.getParameter(i+"").equals("")){
                itemIds.add(request.getParameter(i+""));
            }
        }
        for(String itemId : itemIds){
            Item item = getItemFromID(itemId);
            if(item!=null)
                items.add(item);
        }
        ItemBuilder itemBuild = new ItemBuilder(items);
        try(JsonWriter writer = Json.createWriter(response.getWriter())){
            writer.writeObject(toJsonObject(itemBuild));
        }


    }
    private Item getItemFromID(String id){
        Item diabloItem = null;
        InputStream is = null;
        diabloItem = Database.getItem(id);
        if(diabloItem!=null){return diabloItem;}
        try{
            URL url = new URL("http://us.battle.net/api/d3/data/item/" + id);
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
            diabloItem = new Item(jsonObject);
            Database.cacheItem(diabloItem);
        }catch (MalformedURLException ex) {
            Logger.getLogger(DiabloHeroBuilderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }catch (IOException ioe){
            Logger.getLogger(DiabloHeroBuilderServlet.class.getName()).log(Level.SEVERE, null, ioe);
        }catch(Exception e){
            Logger.getLogger(DiabloHeroBuilderServlet.class.getName()).log(Level.SEVERE, null, e);
        }finally {
            try {
                if(is!=null)
                    is.close();
            } catch (IOException ex) {
                Logger.getLogger(DiabloHeroBuilderServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return diabloItem;
    }
    private JsonObject toJsonObject(ItemBuilder itemBuild){
        JsonBuilderFactory factory = Json.createBuilderFactory(null);
        JsonObjectBuilder stats = factory.createObjectBuilder();
        for(String statName : itemBuild.getStats().keySet()){
            stats
                .add(statName, itemBuild.getStats().get(statName));
        }
        return stats.build();
        
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