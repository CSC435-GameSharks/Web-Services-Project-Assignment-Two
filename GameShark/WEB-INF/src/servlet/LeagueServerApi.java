package servlet;

import League.LeagueServer;
import League.LeagueServerIncMessage;
import League.LeagueServerIncident;
import League.LeagueServerService;
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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kellymaestri
 */
@WebServlet(name = "LeagueServerApi", urlPatterns = {"/api/LeagueServerApi"})
public class LeagueServerApi extends HttpServlet {

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
        response.setContentType("application/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            LeagueServer[] servers = makeAPIRequest();
            String strOut = "";

            if (servers == null) {
                strOut = "{\"error\":{\"code\":404}}";
            } else {
                strOut = makeServerJson(servers);
            }
            
            request.setAttribute("json", strOut);
            RequestDispatcher rd = request.getRequestDispatcher("/api/JsonResponseServ");
            rd.forward(request, response);

//            try {
//                out.println(strOut);
//            } catch (Exception ex) {
//                out.println(ex);
//                out.println("</body>");
//                out.println("</html>");
//            }

        }
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
                is = new URL("http://status.leagueoflegends.com/shards/" + regions.get(i)).openStream();
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

    private String makeServerJson(LeagueServer[] servers) {
        String strReturn = "";
        strReturn = "{\"servers\":[";

        for (int i = 0; i < servers.length; i++) {
            strReturn += "{";
            strReturn += "\"name\":\"" + servers[i].getName() + "\",";
            strReturn += "\"slug\":" + servers[i].getSlug() + ",";

            LeagueServerService[] services = servers[i].getServices();
            strReturn += "\"services\":[";
            for (int j = 0; j < services.length; j++) {
                strReturn += "{";
                strReturn += "\"name\":\"" + services[j].getName() + "\",";
                strReturn += "\"slug\":\"" + services[j].getSlug() + "\",";
                strReturn += "\"status\":\"" + services[j].getStatus() + "\",";

                strReturn += "\"incidents\":[";
                LeagueServerIncident[] inc = services[j].getIncidents();
                for (int k = 0; k < inc.length; k++) {
                    strReturn += "{";
                    strReturn += "\"id\":\"" + inc[k].getID() + "\",";
                    strReturn += "\"created\":\"" + inc[k].getCreatedAt() + "\",";
                    strReturn += "\"active\":\"" + inc[k].getActive() + "\",";

                    strReturn += "\"messages\":[";
                    LeagueServerIncMessage[] message = inc[k].getMessages();
                    for (int m = 0; m < message.length; m++) {
                        strReturn += "{";
                        strReturn += "\"severity\":\"" + message[m].getSeverity() + "\",";
                        strReturn += "\"id\":\"" + message[m].getID() + "\",";
                        strReturn += "\"author\":\"" + message[m].getAuthor() + "\",";
                        strReturn += "\"createdAt\":\"" + message[m].getCreatedAt() + "\",";
                        strReturn += "\"updatedAt\":\"" + message[m].getUpdatedAt() + "\",";
                        strReturn += "\"content\":\"" + message[m].getContent() + "\"";

                        if (m == message.length - 1) {
                            strReturn += "]}";
                        } else {
                            strReturn += "]},";
                        }
                    }
                    if (k == inc.length - 1) {
                        strReturn += "]}";
                    } else {
                        strReturn += "]},";
                    }

                }
                if (j == services.length - 1) {
                    strReturn += "]}";
                } else {
                    strReturn += "]},";
                }

            }
            if (i == servers.length - 1) {
                strReturn += "]}";
            } else {
                strReturn += "]},";
            }
        }
        strReturn += "]}";
        return strReturn;
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
