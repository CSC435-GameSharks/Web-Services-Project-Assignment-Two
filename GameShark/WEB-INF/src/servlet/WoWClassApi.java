package servlet;

import WoW.WoWClassDetail;
import WoW.WoWSpell;
import WoW.WoWTalent;
import WoW.WoWSpec;
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

@WebServlet(name = "WoWClassApi", urlPatterns = {"/wowClassApi"})

public class WoWClassApi extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
	Connection conn = null;
	Statement stmt = null;

	try {
	    WoWClassDetail wowClass;
	    String[] aryRoles;
	    WoWSpec[] arySpecs;
	    WoWSpell[] arySpells;
	    WoWTalent[] aryTalents;
	    int indexCounter = 0;
	    String sClassID = "1";
	    String sSpecID = "0";
	    String sOutput = "";
            RequestDispatcher rd = request.getRequestDispatcher("/api/wowDisplayApi");
	    
	    if(request.getParameter("classID") != null){
		    sClassID = request.getParameter("classID");
	    }

	    if(request.getParameter("spec") != null){
		sSpecID = request.getParameter("spec");
	    }

	    conn = DriverManager.getConnection(
			    "jdbc:mysql://localhost:3306/csc435", "root", "root");
		
	    stmt = conn.createStatement();
		
	    String sqlStr = "SELECT * FROM wowClass WHERE classID = " + sClassID;
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
	    arySpecs = new WoWSpec[rset.getInt("rowCount")];
	    
	    //reset the counter
	    indexCounter = 0;
	    sqlStr = "SELECT specName, specID FROM wowSpecializations WHERE classID = " + wowClass.getID();
	    rset = stmt.executeQuery(sqlStr);
	    while(rset.next()){
		arySpecs[indexCounter] = new WoWSpec(rset.getString("specName"),rset.getInt("specID"));
		indexCounter ++;
	    }

	    //Get the spells for the class and spec
	    sqlStr = "SELECT COUNT(*) AS rowCount FROM (SELECT lvl, spellName FROM wowClassSpells WHERE classID = " + wowClass.getID() + " UNION SELECT lvl, spellName FROM wowSpecSpells WHERE specID = " + sSpecID + ") temp";
	    rset = stmt.executeQuery(sqlStr);
	    rset.next();
	    arySpells = new WoWSpell[rset.getInt("rowCount")];
	    
	    //reset the counter
	    indexCounter = 0;
	    sqlStr = "SELECT lvl, spellName FROM (SELECT lvl, spellName FROM wowClassSpells WHERE classID = " + wowClass.getID() + " UNION SELECT lvl, spellName FROM wowSpecSpells WHERE specID = " + sSpecID + ") temp ORDER BY temp.lvl";
	    rset = stmt.executeQuery(sqlStr);
	    while(rset.next()){
	    arySpells[indexCounter] = new WoWSpell(rset.getString("spellName"), rset.getInt("lvl"));
	    indexCounter ++;
	    }
	    
	    //Get the talents for the class
	    sqlStr = "SELECT COUNT(*) AS rowCount FROM wowTalents WHERE classID = " + wowClass.getID() + " AND specID = " + sSpecID;
	    rset = stmt.executeQuery(sqlStr);
	    rset.next();
	    aryTalents = new WoWTalent[rset.getInt("rowCount")];
	    
	    //reset the counter
	    indexCounter = 0;
	    sqlStr = "SELECT talentName, lvl FROM wowTalents WHERE classID = " + wowClass.getID() +  " AND specID = " + sSpecID;
	    rset = stmt.executeQuery(sqlStr);
	    while(rset.next()){
		aryTalents[indexCounter] = new WoWTalent(rset.getString("talentName"), rset.getInt("lvl"));
		indexCounter ++;
	    }

	    wowClass.setRoles(aryRoles);
	    wowClass.setSpecs(arySpecs);
	    wowClass.setSpells(arySpells);
	    wowClass.setTalents(aryTalents);

	    sOutput = makeClassJson(wowClass, sSpecID);
	    request.setAttribute("json", sOutput);
	    rd.forward(request, response);
    
        }catch (Exception ex) {
	    //out.println(ex.toString());
	}finally{
	    //out.close();
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


    private String makeClassJson(WoWClassDetail wowClass, String sSpec){
	String sReturn = "";
	WoWSpec[] arySpecs = wowClass.getSpecs();
	WoWSpell[] arySpells = wowClass.getSpells();
	WoWTalent[] aryTalents = wowClass.getTalents();
	sReturn = "{\"class\":{";

	

	sReturn += "\"name\":\"" + wowClass.getName() + "\",";
	sReturn += "\"id\":" + wowClass.getID() + ",";
	sReturn += "\"roles\":\"" + wowClass.getRolesStringNoSpace() + "\",";
	
	sReturn += "\"specs\":[";
	for(int i = 0; i < arySpecs.length; i++){
	    sReturn += "{";
	    sReturn += "\"id\":" + arySpecs[i].getID() + ",";
	    sReturn += "\"name\":\"" + arySpecs[i].getName() + "\"";
	    if(i == arySpecs.length - 1){
		sReturn += "}";
	    }else{
		sReturn += "},";
	    }
	}
	sReturn += "],";

	sReturn += "\"spells\":[";
	for(int i = 0; i < arySpells.length; i++){
	    sReturn += "{";
	    sReturn += "\"name\":\"" + arySpells[i].getName() + "\",";
	    sReturn += "\"level\":" + arySpells[i].getLvl() + "";
	    if(i == arySpells.length - 1){
		sReturn += "}";
	    }else{
		sReturn += "},";
	    }
	}
	sReturn += "],";


	sReturn += "\"talents\":[";
	for(int i = 0; i < aryTalents.length; i++){
	    sReturn += "{";
	    sReturn += "\"name\":\"" + aryTalents[i].getName() + "\",";
	    sReturn += "\"level\":" + aryTalents[i].getLvl() + "";
	    if(i == aryTalents.length - 1){
		sReturn += "}";
	    }else{
		sReturn += "},";
	    }
	}
	sReturn += "]";

	sReturn += "}}";
	return sReturn;
    }
}
