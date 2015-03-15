/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import League.LeagueSummoner;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
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
 @WebServlet(name = "LeagueSummonerApi", urlPatterns = {"/api/LeagueSummonerApi"})
public class LeagueNamesApi extends HttpServlet {

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
            
            String sName = "";
            String sOutput = "";

            //check for a new summoner name
            //will want to use over current session summoner name
           // out.println("Look for name from request");
            if (request.getParameter("name") != null) {
                sName = request.getParameter("name").toLowerCase();
            }

            //Start building the output
            LeagueSummoner summoner = null;
	    //Check to see if we have valid information to make a request
            if(sName.equals("")){
                sOutput += "{\"error\":{\"code\":404, \"message\":\"please provide a valid summoner name\"}}";
            }else{
                summoner = makeAPIRequest(sName, out);
		if(summoner== null){
		    sOutput += "{\"error\":{\"code\":404}}";
		
		}else{
		    sOutput = makeSummonerJson(summoner);

		}
            }
            request.setAttribute("json", sOutput);
            RequestDispatcher rd = request.getRequestDispatcher("/api/JsonResponseServ");
            rd.forward(request, response);
            
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
           // out.println("first api call done");
            String id = summoner.getID();
            is = new URL("https://na.api.pvp.net/api/lol/na/v1.3/stats/by-summoner/" + id + "/summary?season=SEASON2015&api_key=cc288bed-bfa3-4158-9642-6b276a1381d7").openStream();
           // out.println("second api call done");
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
     
     private String makeSummonerJson(LeagueSummoner summoner){
         String sReturn = "";
         sReturn = "{\""+summoner.getName().toLowerCase()+"\":{";
         sReturn += "\"id\":" + summoner.getID()  + ",";
         sReturn += "\"name\":\"" + summoner.getName()  + "\",";
         sReturn += "\"profileIconId\":\"" + summoner.getProfileIcon()  + "\",";
         sReturn += "\"summonerLevel\":" + summoner.getLevel()  + ",";
         
        sReturn += "\"playerStatSummaries\":[";
        int size = summoner.getStatsSize();
        for (int i = 0; i < size; i++) {
             sReturn += "{";
             sReturn += "\"playerStatSummaryType\":\"" + summoner.getStatType(i) + "\",";
             sReturn += "\"wins\":" + summoner.getStatWins(i) + ",";
             sReturn += "\"totalChampionKills\":" + summoner.getStatChampKills(i) + ",";
             sReturn += "\"totalAssists\":" + summoner.getStatAssists(i) + ",";
             sReturn += "\"totalMinionKills\":" + summoner.getStatMinionKills(i) + ",";
             sReturn += "\"totalNeutralMinionsKilled\":" + summoner.getStatNMKills(i) + ",";
             sReturn += "\"totalTurrentsKilled\":" + summoner.getStatTurrentKills(i) + "";

             if (i == size - 1) {
                 sReturn += "}";
             } else {
                 sReturn += "},";
             }
         }
        sReturn += "]}}";
      return sReturn;  
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
