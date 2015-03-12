package servlet;

import WoW.WoWItem;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
/**
 *
 *
 */
@WebServlet(name = "WoWItemServ", urlPatterns = {"/WoWItemServ"})
public class WoWItemServ extends HttpServlet {
    HashMap<Integer, Integer> mapStats = new HashMap<Integer, Integer>();


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
	intit();
        
	try (PrintWriter out = response.getWriter()) {
		out.println("start");
		if(request.getParameter("head") != null){
		    if(request.getParameter("head") != ""){
			int tempID = Integer.parseInt(request.getParameter("head"));
			makeServerAPIRequest(tempID);
			request.setAttribute("head", tempID);
		    }
		}
		out.println("</br>head done");
		if(request.getParameter("shoulder") != null){
		    if(request.getParameter("shoulder") != ""){
			int tempID = Integer.parseInt(request.getParameter("shoulder"));
			makeServerAPIRequest(tempID);
			request.setAttribute("shoulder", tempID);
		    }
		}

		out.println("</br> shoulder done");
		if(request.getParameter("chest") != null){
		    if(request.getParameter("chest") != ""){
			int tempID = Integer.parseInt(request.getParameter("chest"));
			makeServerAPIRequest(tempID);
			request.setAttribute("chest", tempID);
		    }
		}
		out.println("");

		if(request.getParameter("back") != null){
		    if(request.getParameter("back") != ""){
			int tempID = Integer.parseInt(request.getParameter("back"));
			makeServerAPIRequest(tempID);
			request.setAttribute("back", tempID);
		    }
		}

		out.println("");
		if(request.getParameter("wrist") != null){
		    if(request.getParameter("wrist") != ""){
			int tempID = Integer.parseInt(request.getParameter("wrist"));
			makeServerAPIRequest(tempID);
			request.setAttribute("wrist", tempID);
		    }
		}

		if(request.getParameter("hands") != null){
		    if(request.getParameter("hands") != ""){
			int tempID = Integer.parseInt(request.getParameter("hands"));
			makeServerAPIRequest(tempID);
			request.setAttribute("hands", tempID);
		    }
		}

		if(request.getParameter("waist") != null){
		    if(request.getParameter("waist") != ""){
			int tempID = Integer.parseInt(request.getParameter("waist"));
			makeServerAPIRequest(tempID);
			request.setAttribute("waist", tempID);
		    }
		}

		if(request.getParameter("legs") != null){
		    if(request.getParameter("legs") != ""){
			int tempID = Integer.parseInt(request.getParameter("legs"));
			makeServerAPIRequest(tempID);
			request.setAttribute("legs", tempID);
		    }
		}

		if(request.getParameter("feet") != null){
		    if(request.getParameter("feet") != ""){
			int tempID = Integer.parseInt(request.getParameter("feet"));
			makeServerAPIRequest(tempID);
			request.setAttribute("feet", tempID);
		    }
		}

		if(request.getParameter("mainHand") != null){
		    if(request.getParameter("mainHand") != ""){
			int tempID = Integer.parseInt(request.getParameter("mainHand"));
			makeServerAPIRequest(tempID);
			request.setAttribute("mainHand", tempID);
		    }
		}

		if(request.getParameter("offHand") != null){
		    if(request.getParameter("offHand") != ""){
			int tempID = Integer.parseInt(request.getParameter("offHand"));
			makeServerAPIRequest(tempID);
			request.setAttribute("offHand", tempID);
		    }
		}

		if(request.getParameter("neck") != null){
		    if(request.getParameter("neck") != ""){
			int tempID = Integer.parseInt(request.getParameter("neck"));
			makeServerAPIRequest(tempID);
			request.setAttribute("neck", tempID);
		    }
		}

		if(request.getParameter("trinket1") != null){
		    if(request.getParameter("trinket1") != ""){
			int tempID = Integer.parseInt(request.getParameter("trinket1"));
			makeServerAPIRequest(tempID);
			request.setAttribute("trinket1", tempID);
		    }
		}

		if(request.getParameter("trinket2") != null){
		    if(request.getParameter("trinket2") != ""){
			int tempID = Integer.parseInt(request.getParameter("trinket2"));
			makeServerAPIRequest(tempID);
			request.setAttribute("trinket2", tempID);
		    }
		}

		if(request.getParameter("finger1") != null){
		    if(request.getParameter("finger1") != ""){
			int tempID = Integer.parseInt(request.getParameter("finger1"));
			makeServerAPIRequest(tempID);
			request.setAttribute("finger1", tempID);
		    }
		}

		if(request.getParameter("finger2") != null){
		    if(request.getParameter("finger2") != ""){
			int tempID = Integer.parseInt(request.getParameter("finger2"));
			makeServerAPIRequest(tempID);
			request.setAttribute("finger2", tempID);
		    }
		}
		
		request.setAttribute("mapStats", mapStats);
		
		RequestDispatcher rd = request.getRequestDispatcher("WoWItem.jsp");
		rd.forward(request, response);
       }
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

    private void intit(){
	//set the base values we need in the map
	mapStats.put(3, new Integer(0));
	mapStats.put(4, new Integer(0));
	mapStats.put(5, new Integer(0));
	mapStats.put(6, new Integer(0));
	mapStats.put(7, new Integer(0));
    }

    private void makeServerAPIRequest(int intItemID){
	WoWItem wowItem = null;
	InputStream is = null;

	try{
	    is = new URL("http://us.battle.net/api/wow/item/" + intItemID).openStream();
	    JsonReader jsonReader = Json.createReader(is);
	    JsonObject jsonObject = jsonReader.readObject();
	    JsonArray jsonArray = jsonObject.getJsonArray("bonusStats");
	    jsonReader.close();
	    
	    for(int i = 0; i < jsonArray.size(); i++){
		JsonObject obj = jsonArray.getJsonObject(i);
		if(mapStats.containsKey(obj.getInt("stat"))){
		    Integer temp = mapStats.get(obj.getInt("stat"));
		    temp += obj.getInt("amount");
		    mapStats.put(obj.getInt("stat"), temp);

		}
	    }
	    
	} catch (MalformedURLException ex) {
            Logger.getLogger(WoWServServ.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ioe){
            Logger.getLogger(WoWCharServ.class.getName()).log(Level.SEVERE, null, ioe);
        } catch(Exception e){
            Logger.getLogger(WoWCharServ.class.getName()).log(Level.SEVERE, null, e);
        }finally {
            try {
                is.close();
            } catch (IOException ex) {
                Logger.getLogger(WoWCharServ.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}
