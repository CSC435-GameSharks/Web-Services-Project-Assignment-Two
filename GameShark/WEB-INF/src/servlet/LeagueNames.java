package servlet;

import League.LeagueSummoner;
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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kellymaestri
 */
@WebServlet(name = "LeagueSummonerServ", urlPatterns = {"/LeagueSummonerServ"})
public class LeagueNames extends HttpServlet {

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
            throws ServletException {

        try (PrintWriter out = response.getWriter()) {

            HttpSession s = request.getSession();
            String sName = "";

            //Check the session for a current summoner name
            out.println("Look for name from session");
            if (s.getAttribute("sessionName") != null) {
                sName = s.getAttribute("sessionName").toString();

            }

            //check for a new summoner name
            //will want to use over current session summoner name
            out.println("Look for name from request");
            if (request.getParameter("name") != null) {
                sName = request.getParameter("name").toLowerCase();
                s.setAttribute("sessionName", sName);

            }

            out.println(sName);

            LeagueSummoner sum = makeAPIRequest(sName, out);
            request.setAttribute("summoner", sum);
            RequestDispatcher rd = request.getRequestDispatcher("LeagueSummoner.jsp");
            rd.forward(request, response);

        } catch (IOException ex) {

            Logger.getLogger(LeagueNames.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private LeagueSummoner makeAPIRequest(String n, PrintWriter out) {
        InputStream is = null;
        LeagueSummoner summoner = null;
        try {

            is = new URL("https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/" + n + "?api_key=cc288bed-bfa3-4158-9642-6b276a1381d7").openStream();

            JsonReader jsonReader = Json.createReader(is);
            JsonObject json = jsonReader.readObject();
            JsonObject summonerObject = json.getJsonObject(n);
            summoner = new LeagueSummoner(summonerObject);
            out.println("first api call done");
            String id = summoner.getID();
            is = new URL("https://na.api.pvp.net/api/lol/na/v1.3/stats/by-summoner/" + id + "/summary?season=SEASON2015&api_key=cc288bed-bfa3-4158-9642-6b276a1381d7").openStream();
            out.println("second api call done");
            jsonReader = Json.createReader(is);
            json = jsonReader.readObject();
            JsonArray tmp = json.getJsonArray("playerStatSummaries");
            summoner.updateSummonerStats(tmp, out);
            
            jsonReader.close();
            is.close();
        } catch (MalformedURLException ex) {
            out.println(ex.toString());
            return summoner;

        } catch (IOException ioe) {
            out.println(ioe.toString());
            return summoner;

        } catch (Exception e) {
            out.println(e.toString());
            return summoner;

        }
        return summoner;

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
