package servlet;

import WoW.WoWServer;
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

/**
 *
 * This Servlet 
 */
@WebServlet(name = "WoWServApi", urlPatterns = {"/api/wowServApi"})
public class WoWServApi extends HttpServlet {

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
 
            WoWServer[] aryServer = makeServerAPIRequest();
            String strOut = "";
	    RequestDispatcher rd = request.getRequestDispatcher("/api/wowDisplayApi");

	    if(aryServer == null){
		strOut = "{\"error\":{\"code\":404}}";
	    }else{
		strOut = makeServerJson(aryServer);
	    }

	    request.setAttribute("json", strOut);
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
     * @return an array of WoW Servers
     */
    private WoWServer[] makeServerAPIRequest() {
        InputStream is = null;
        WoWServer[] aryServer = null;
        try {
            //?realms=Medivh
            is = new URL("http://us.battle.net/api/wow/realm/status").openStream();
            JsonReader jsonReader = Json.createReader(is);
            JsonObject jsonObject = jsonReader.readObject();
            JsonArray jsonArray = jsonObject.getJsonArray("realms");
            jsonReader.close();

            aryServer = new WoWServer[jsonArray.size()];
            for(int i = 0; i < jsonArray.size(); i++){
                JsonObject obj = jsonArray.getJsonObject(i);
                aryServer[i] = new WoWServer(obj);
                
            }
        
        } catch (MalformedURLException ex) {
            Logger.getLogger(WoWServServ.class.getName()).log(Level.SEVERE, null, ex);
        
        } catch (IOException ioe){
            Logger.getLogger(WoWServServ.class.getName()).log(Level.SEVERE, null, ioe);
        
        } catch(Exception e){
            Logger.getLogger(WoWServServ.class.getName()).log(Level.SEVERE, null, e);
            
        }finally {
            try {
                is.close();
            } catch (IOException ex) {
                Logger.getLogger(WoWServServ.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return aryServer;
    }

    private String makeServerJson(WoWServer[] aryIn){
	String strReturn = "";
	strReturn = "{\"realms\":[";

	for(int i = 0; i < aryIn.length; i++){
	    strReturn += "{";
	    strReturn += "\"name\":\"" + aryIn[i].getName() + "\",";
	    strReturn += "\"type\":\"" + aryIn[i].getType() + "\",";
	    strReturn += "\"population\":\"" + aryIn[i].getPopulation() + "\",";
	    strReturn += "\"queue\":\"" + aryIn[i].getQueue() + "\",";
	    strReturn += "\"status\":\"" + aryIn[i].getStatus() + "\",";
	    strReturn += "\"locale\":\"" + aryIn[i].getLocale() + "\",";
	    strReturn += "\"timezone\":\"" + aryIn[i].getTimeZone() + "\"";

	    if(i == aryIn.length - 1){
		strReturn += "}";
	    }else{
		strReturn += "},";
	    }
	}
	strReturn += "]}";
	return strReturn;
    }

}
