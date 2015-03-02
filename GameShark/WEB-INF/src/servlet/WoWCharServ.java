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
@WebServlet(name = "WoWCharServ", urlPatterns = {"/WoWCharServ"})
public class WoWCharServ extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
	    //http://us.battle.net/api/wow/character/firetree/joepaterno
            //?name=name&realm=realm
            HttpSession s = request.getSession();
            String sCharName = "";
            String sCharRealm = "";
	    
	    out.println("checking for charRealm");
            //Check the session for a realm
            if(s.getAttribute("charRealm") != null){
                sCharRealm = s.getAttribute("charRealm").toString();
            }
	    
	    out.println("checking for charName");
            //Check the session for a name
            if(s.getAttribute("charName") != null){
                sCharName = s.getAttribute("charName").toString();
            }

            
            //Check if there are any quert string infromation
            //if we have these we want to use them instead of what
            //we got from the session.  We also want to overwrite the session
	    out.println("checking for request name");
            if(request.getParameter("name") != null){
                sCharName = request.getParameter("name");
                s.setAttribute("charName", sCharName);
                
            }
            
	    out.println("checking for request realm");
            if(request.getParameter("realm") != null){
                sCharRealm = request.getParameter("realm");
                s.setAttribute("charRealm", sCharRealm );
            }
            
            
            //Start building the output
            WoWCharacter wowChar = null;
	    out.println(sCharName);
	    out.println(sCharRealm);
            //Check to see if we have valid information to make a request
            if(sCharName == "" || sCharRealm == "" ){
                //sOutput += "</br>ERROR: Bad User or Realm  ";
		out.println("Error");
            }else{
		out.println("about to make char");
                wowChar = makeServerAPIRequest(sCharName, sCharRealm);
		request.setAttribute("userChar",wowChar);
		RequestDispatcher rd = request.getRequestDispatcher("WoWChar.jsp");
		rd.forward(request, response);
            }
                        
            /*try{
                //out.println(sOutput);
            } catch (Exception ex) {
                System.out.println(ex);
                out.println(ex);
                out.println("</body>");
                out.println("</html>");
		}*/
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
}
