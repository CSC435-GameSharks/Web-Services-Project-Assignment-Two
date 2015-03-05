
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author kellymaestri
 */
@WebServlet(name = "LServServ", urlPatterns = {"/LServServ"})
public class LeagueServerStatus extends HttpServlet {

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

		LeagueServer[] leagueServers = makeServerAPIRequest();
        request.setAttribute("serverList", leagueServers);
	    RequestDispatcher rd = request.getRequestDispatcher("LeagueServer.jsp");
	    rd.forward(request,response);
    }



    private LeagueServer[] makeAPIRequest() {
        InputStream is = null;
        LeagueServer[] servers = null;
        ArrayList<String> regions = new ArrayList<String>();		
		try {
            is = new URL("http://status.leagueoflegends.com/shards").openStream();
            JsonReader jsonReader = Json.createReader(is);
            JsonArray json = jsonReader.readArray();
			
			//first api call to get all the server "slugs"            
			for (int i = 0; i < json.size(); i++) {
                JsonObject temp = json.getJsonObject(i);
                String blah = temp.get("slug").toString();
                blah = blah.replace("\"", "");
                regions.add(blah);
            }
            servers = new LeagueServer[regions.size()];

			//second api call using the slugs from above
			for (int i = 0; i < regions.size(); i++) {
                is = new URL("http://status.leagueoflegends.com/shards/" +regions.get(i)).openStream();
                jsonReader = Json.createReader(is);
                JsonObject jsonO = jsonReader.readObject();
                servers[i] = new LeagueServer(jsonO);
            }

            jsonReader.close();

        } catch (MalformedURLException ex) {
            Logger.getLogger(LeagueServerStatus.class.getName()).log(Level.SEVERE, null, ex);

        } catch (IOException ioe) {
            Logger.getLogger(LeagueServerStatus.class.getName()).log(Level.SEVERE, null, ioe);

        } catch (Exception e) {
            Logger.getLogger(LeagueServerStatus.class.getName()).log(Level.SEVERE, null, e);

        } finally {
            try {
                is.close();
            } catch (IOException ex) {
                Logger.getLogger(LeagueServerStatus.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return servers;
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
