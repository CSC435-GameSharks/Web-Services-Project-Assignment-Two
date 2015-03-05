package League;

import javax.json.JsonObject;
import javax.json.JsonArray;

/**
 *@author kellymaestri
 */

public class LeagueServerIncident{
	private boolean active;
	private String createdAt;
	private String id;
	private LeagueServerIncMessage[] messages;
	
	
	public LeagueServerIncident(JsonObject incident){
		active = incident.getBoolean("active");
		createdAt = incident.get("created_at").toString();
		id = incident.get("id").toString();
		
		JsonArray updates = incident.getJsonArray("updates");
		int size = updates.size();
		messages = new LeagueServerIncMessage[size];
		
		for(int i = 0; i < size; i++){
			JsonObject tmp = updates.getJsonObject(i);
			messages[i] = new LeagueServerIncMessage(tmp);
			
		}
		
		
	}
	
	public String getActive(){
		if(active){
			return "true";	
		}else{
			return "false";
		}
	}
	
	public String getCreatedAt(){
		return createdAt;
	}
	
	public String getID(){
		return id;
	}
	
	public LeagueServerIncMessage[] getMessages(){
		return messages;
	}
	
}