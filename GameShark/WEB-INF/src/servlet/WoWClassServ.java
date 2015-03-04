package servlet;

import WoW.WoWClassDetail;
import WoW.WoWSpell;
import WoW.WoWTalent;
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
import java.sql.*;

@WebServlet(name = "WoWClassServ", urlPatterns = {"/WoWClassServ"})

public class WoWClassServ extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
	response.setContentType("text/html");
	Connection conn = null;
	Statement stmt = null;
	PrintWriter out = response.getWriter();
       

	try {
	    WoWClassDetail wowClass;
	    String[] aryRoles;
	    String[] arySpecs;
	    int indexCounter = 0;

	    conn = DriverManager.getConnection(
			    "jdbc:mysql://localhost:3306/csc435", "kirito", "spaz1991");
		
	    stmt = conn.createStatement();
		
	    String sqlStr = "SELECT * FROM wowClass WHERE classID = 1";
	    ResultSet rset = stmt.executeQuery(sqlStr);
		
	    //Make Inital Class
	    rset.next();
	    wowClass = new WoWClassDetail(rset.getString("className"),  rset.getInt("classID"), rset.getString("classBio"));

	    //Get Roles for class
	    sqlStr = "SELECT COUNT(*) AS rowCount FROM wowClassRoles WHERE classID = " + wowClass.getID();
	    rset = stmt.executeQuery(sqlStr);
	    rset.next();
	    aryRoles = new String[rset.getInt("rowCount")];

	    sqlStr = "SELECT r.roleID, r.roleName FROM wowRoles r INNER JOIN wowClassRoles cr ON r.roleID = cr.roleID WHERE cr.classID = " +  wowClass.getID();
	    rset = stmt.executeQuery(sqlStr);
	    while(rset.next()){
		aryRoles[indexCounter] = rset.getString("roleName");
		indexCounter ++;
	    }


	    //Get Specs for the class
	    sqlStr = "SELECT COUNT(*) AS rowCount FROM wowSpecializations WHERE classID = " + wowClass.getID();
	    rset = stmt.executeQuery(sqlStr);
	    rset.next();
	    arySpecs = new String[rset.getInt("rowCount")];
	    
	    //reset the counter
	    indexCounter = 0;
	    sqlStr = "SELECT specName FROM wowSpecializations WHERE classID = " + wowClass.getID();
	    rset = stmt.executeQuery(sqlStr);
	    while(rset.next()){
		arySpecs[indexCounter] = rset.getString("specName");
		indexCounter ++;
	    }

	    //Get the spells for the class and spec
	    
	    sqlStr = "SELECT COUNT(*) AS rowCount FROM (SELECT lvl, spellName FROM wowClassSpells WHERE classID = " + wowClass.getID() + "UNION SELECT lvl, spellName FROM wowSpecSpells WHERE specID = 0) temp";
	    rset = stmt.executeQuery(sqlStr);
	    rset.next();
	    arySpells = new WoWSpell[rset.getInt("rowCount")];
	    
	    //reset the counter
	    indexCounter = 0;
	    sqlStr = "SELECT lvl, spellName FROM (SELECT lvl, spellName FROM wowClassSpells WHERE classID = " + wowClass.getID() + "UNION SELECT lvl, spellName FROM wowSpecSpells WHERE specID = 0) temp ORDER BY temp.lvl";

	    wowClass.setRoles(aryRoles);
	    wowClass.setSpecs(arySpecs);
        }catch (Exception ex) {
	    out.println(ex.toString());
	}finally{
	    out.close();
	    try{
		if(stmt != null){
		    stmt.close();
		}

		if(conn != null){
		    conn.close();
		}
	    
	    }catch (SQLException ex){
		//
	    }
	}

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
	processRequest(request, response);
    }
}
