package servlet;


import Diablo.Career;
import Diablo.Follower;
import Diablo.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.json.*;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * @author csaroff
 */
@WebServlet(name = "DiabloFollowerApi", urlPatterns = {"/api/DiabloFollower"})
public class DiabloFollowerApi extends HttpServlet {

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
        String strFollower = "";
        Follower follower = null;
        if(request.getParameter("follower") != null){
             strFollower = request.getParameter("follower");
        }
        if(strFollower.equals("enchantress")||strFollower.equals("scoundrel")||strFollower.equals("templar")){
            follower = makeServerAPIRequest(strFollower);
        }

        if(follower==null){
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        try(JsonWriter writer = Json.createWriter(response.getWriter())){
            writer.writeObject(toJsonObject(follower));
        }
    }
    private Follower makeServerAPIRequest(String strFollower){
        Follower diabloFollower = null;
        InputStream is = null;
        try{
            URL url = new URL("http://us.battle.net/api/d3/data/follower/" + strFollower);
            int code = ((HttpURLConnection)url.openConnection()).getResponseCode();
            if(code<200 || code>299){
                return null;
            }
            is = url.openStream();
            JsonReader jsonReader = Json.createReader(is);
            JsonObject jsonObject = jsonReader.readObject();
            jsonReader.close();
            String errorCode = jsonObject.getString("code", null);
            if(jsonObject==null||(errorCode!=null&&errorCode.equals("NOTFOUND"))){
                System.out.println("jsonObject contained error message");
                return null;
            }
            diabloFollower = new Follower(jsonObject);
            
        } catch (MalformedURLException ex) {
            Logger.getLogger(DiabloFollowerServlet.class.getName()).log(Level.SEVERE, null, ex);
        
        } catch (IOException ioe){
            Logger.getLogger(DiabloFollowerServlet.class.getName()).log(Level.SEVERE, null, ioe);
        
        } catch(Exception e){
            Logger.getLogger(DiabloFollowerServlet.class.getName()).log(Level.SEVERE, null, e);
            
        }finally {
            try {
                is.close();
            } catch (IOException ex) {
                Logger.getLogger(DiabloFollowerServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return diabloFollower;
    }
    private JsonObject toJsonObject(Follower follower){
        JsonBuilderFactory factory = Json.createBuilderFactory(null);
        JsonObjectBuilder tempObj = factory.createObjectBuilder()
        .add("slug", follower.getSlug())
        .add("name", follower.getName())
        .add("realName", follower.getRealName())
        .add("portrait", follower.getPortrait());
        JsonArrayBuilder skills = factory.createArrayBuilder();
        for(ActiveSkill skill : follower.getActiveSkills()){
            skills.add(factory.createObjectBuilder()
                .add("slug",skill.getSlug())
                .add("name",skill.getName())
                .add("icon",skill.getIcon())
                .add("level",skill.getLevel())
                .add("tooltipUrl",skill.getTooltipUrl())
                .add("description",skill.getDescription())
                .add("skillCalcId",skill.getSkillCalcId()));
        }
        tempObj.add("skills", skills);
        return tempObj.build();
        
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
}