package servlet;

import WoW.WoWCharacter;
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

/**
 * This servlet is used to get the WoW Server information from the API
 * 
 */
@WebServlet(name = "WoWCharApi", urlPatterns = {"/api/wowCharApi"})
public class WoWCharApi extends HttpServlet {

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

	//http://us.battle.net/api/wow/character/firetree/joepaterno
        //?name=name&realm=realm
        HttpSession s = request.getSession();
        String sCharName = "";
        String sCharRealm = "";
	String sOutput = "";
	WoWCharacter wowChar = null;
	RequestDispatcher rd = request.getRequestDispatcher("/api/wowDisplayApi");
	
        //Check the session for a realm
        if(s.getAttribute("charRealm") != null){
            sCharRealm = s.getAttribute("charRealm").toString();
        }
	    
	//Check the session for a name
        if(s.getAttribute("charName") != null){
            sCharName = s.getAttribute("charName").toString();
        }

            
        //Check if there are any quert string infromation
        //if we have these we want to use them instead of what
        //we got from the session.  We also want to overwrite the session
	if(request.getParameter("name") != null){
            sCharName = request.getParameter("name");
            s.setAttribute("charName", sCharName);
            
        }
            
	if(request.getParameter("realm") != null){
            sCharRealm = request.getParameter("realm");
            s.setAttribute("charRealm", sCharRealm );
        }
            
            
        //Start building the output
        //Check to see if we have valid information to make a request
        if(sCharName == "" || sCharRealm == "" ){
            sOutput += "{\"error\":{\"code\":404, \"message\":\"please provide a character name and realm\"}}";
	    request.setAttribute("json",sOutput);
        }else{
            wowChar = makeServerAPIRequest(sCharName, sCharRealm);
	    if(wowChar == null){
	        sOutput += "{\"error\":{\"code\":404}}";
		request.setAttribute("json",sOutput);
 	    }else{
		sOutput = makeCharacterJson(wowChar);
		request.setAttribute("json",sOutput);
	    }
        }
	
        rd.forward(request, response);
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
    }
    
    /**
     * 
     * @return A WoWCharacter using the user supplied realm and character name
     */
    private WoWCharacter makeServerAPIRequest(String sCharName, String sCharRealm){
        WoWCharacter wowChar = null;
        InputStream is = null;
        
        try{
            is = new URL("http://us.battle.net/api/wow/character/" + sCharRealm + "/" + sCharName).openStream();
            JsonReader jsonReader = Json.createReader(is);
            JsonObject jsonObject = jsonReader.readObject();
            jsonReader.close();
            
            wowChar = new WoWCharacter(jsonObject);
            
            
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
        
        return wowChar;
    }

    private String makeCharacterJson(WoWCharacter charIn){
	String sReturn = "";
	sReturn = "{\"character\":{";
	
	sReturn += "\"name\":\"" + charIn.getName()  + "\",";
	sReturn += "\"realm\":\"" + charIn.getRealm()  + "\",";
	sReturn += "\"battlegroup\":\"" + charIn.getBattleGroup()  + "\",";
	sReturn += "\"class\":\"" + charIn.getCharClass()  + "\",";
	sReturn += "\"race\":\"" + charIn.getRace()  + "\",";
	sReturn += "\"gender\":" + charIn.getGender()  + ",";
	sReturn += "\"level\":" + charIn.getLevel()  + ",";
	sReturn += "\"achievementpoints\":" + charIn.getAchievementPoints()  + ",";
	sReturn += "\"thumbnail\":\"" + charIn.getThumbnail()  + "\",";
	sReturn += "\"honorablekills\":\"" + charIn.getHonorableKills()  + "\"";

	sReturn += "}}";
	return sReturn;
    }
}
