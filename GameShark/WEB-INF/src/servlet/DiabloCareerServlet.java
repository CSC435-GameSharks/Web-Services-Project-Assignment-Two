/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import Diablo.Career;

/**
 *
 * @author csaroff
 */
@WebServlet(name = "DiabloCareerServlet", urlPatterns = {"/DiabloCareerServlet"})
public class DiabloCareerServlet extends HttpServlet {
    /*
     * The controller for the Diablo Career Viewer.
     */

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
        //try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //?battleTagName=faithpaladin&battleTagCode=1761
            HttpSession s = request.getSession();
            String battleTagName = "";
            String battleTagCode = "";
            
            //Check the session for a battle tag name
            if(s.getAttribute("battleTagName") != null){
                battleTagName = s.getAttribute("battleTagName").toString();
            }
            
            //Check the session for a battle tag code
            if(s.getAttribute("battleTagCode") != null){
                battleTagCode = s.getAttribute("battleTagCode").toString();
            }
            
            if(request.getParameter("battleTagName") != null){
                battleTagName = request.getParameter("battleTagName");
                s.setAttribute("battleTagName", battleTagName);
                
            }
            
            if(request.getParameter("battleTagCode") != null){
                battleTagCode = request.getParameter("battleTagCode");
                s.setAttribute("battleTagCode", battleTagCode );
            }

            //Check to see if we have valid information to make a request
            if(!(battleTagName.equals("")&&battleTagCode.equals(""))){
                request.setAttribute("career",makeServerAPIRequest(battleTagName, battleTagCode));
                request.setAttribute("dne", "true");
            }else{
                request.setAttribute("dne", "false");
            }
            RequestDispatcher rd = request.getRequestDispatcher("DiabloCareer.jsp");
            rd.forward(request,response);
        //}
    }     

    /**
     * @return A Diablo Career using the user supplied realm and character name
     */
    private Career makeServerAPIRequest(String  battleTagName, String battleTagCode){
        Career diabloPlayer = null;
        InputStream is = null;
        
        try{
            is = new URL("http://us.battle.net/api/d3/profile/" + battleTagName + "-" + battleTagCode + "/").openStream();
            JsonReader jsonReader = Json.createReader(is);
            JsonObject jsonObject = jsonReader.readObject();
            jsonReader.close();
            //if(jsonObject==null){
            //    return null;
            //}
            diabloPlayer = new Career(jsonObject);
            
        } 
        catch (MalformedURLException ex) {
            Logger.getLogger(DiabloCareerServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ioe){
            Logger.getLogger(DiabloCareerServlet.class.getName()).log(Level.SEVERE, null, ioe);
        } catch(Exception e){
            Logger.getLogger(DiabloCareerServlet.class.getName()).log(Level.SEVERE, null, e);
        }finally {
            try {
                is.close();
            } catch (IOException ex) {
                Logger.getLogger(DiabloCareerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return diabloPlayer;
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