package servlet;

import Diablo.Career;
import Diablo.Hero;
import Diablo.Item;
import Diablo.ItemBuilder;
import Diablo.Database;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
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
@WebServlet(name = "DiabloHeroBuilderServlet", urlPatterns = {"/DiabloHeroBuilderServlet"})
public class DiabloHeroBuilderServlet extends HttpServlet {
private static final Logger logger = Logger.getLogger(DiabloHeroBuilderServlet.class.getName());

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
        int NUM_ITEMS=10;
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
            items.add(getItemFromID(itemId));
        }
        ItemBuilder itemBuild = new ItemBuilder(items);
        request.setAttribute("itemBuild", itemBuild);
        RequestDispatcher rd = request.getRequestDispatcher("DiabloHeroBuilder.jsp");

        rd.forward(request,response);
    }
    //private Hero makeServerAPIRequest(String battleID, String strHero){
    //    Hero diabloHero = null;
    //    InputStream is = null;
    //    
    //    try{
    //        is = new URL("http://us.battle.net/api/d3/profile/" + battleID + "/hero/" + strHero).openStream();
    //        //System.out.println("http://us.battle.net/api/d3/profile/" + battleID + "/hero/" + strHero);
    //        
    //        JsonReader jsonReader = Json.createReader(is);
    //        JsonObject jsonObject = jsonReader.readObject();
    //        jsonReader.close();
    //        
    //        diabloHero = new Hero(jsonObject);
    //        
    //    }catch (MalformedURLException ex) {
    //        Logger.getLogger(WoWServServ.class.getName()).log(Level.SEVERE, null, ex);
    //    }catch (IOException ioe){
    //        Logger.getLogger(WoWCharServ.class.getName()).log(Level.SEVERE, null, ioe);
    //    }catch(Exception e){
    //        Logger.getLogger(WoWCharServ.class.getName()).log(Level.SEVERE, null, e);
    //    }finally {
    //        try {
    //            is.close();
    //        } catch (IOException ex) {
    //            Logger.getLogger(WoWCharServ.class.getName()).log(Level.SEVERE, null, ex);
    //        }
    //    }
    //    return diabloHero;
    //}
    private Item getItemFromID(String id){
        Item diabloItem = null;
        InputStream is = null;
        diabloItem = Database.getItem(id);
        if(diabloItem!=null){return diabloItem;}
        try{
            is = new URL("http://us.battle.net/api/d3/data/item/" + id).openStream();
            //System.out.println("http://us.battle.net/api/d3/data/item/" + id);
            JsonReader jsonReader = Json.createReader(is);
            JsonObject jsonObject = jsonReader.readObject();
            jsonReader.close();
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
                is.close();
            } catch (IOException ex) {
                Logger.getLogger(DiabloHeroBuilderServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return diabloItem;
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