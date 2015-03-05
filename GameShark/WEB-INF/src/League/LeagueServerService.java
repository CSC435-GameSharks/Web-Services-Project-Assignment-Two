package League;

import javax.json.JsonObject;
import javax.json.JsonArray;

/**
 *@author kellymaestri
 */
public class LeagueServerService {

	private String name;
	private String status;//online, alert, offline or deploying
	private String slug;
	private LeagueServerIncident[] incidents;

	public LeagueServerService(JsonObject service){
		
		name = service.getString("name");
		status = service.getString("status");
		slug = service.getString("slug");	
		
		JsonArray inc = service.getJsonArray("incidents");
		int size = inc.size();
		incidents = new LeagueServerIncident[size];
		
		for(int i = 0; i < size; i++){
			JsonObject tmp = inc.getJsonObject(i);
			incidents[i] = new LeagueServerIncident(tmp);
			
			
		}
		
	}
	
	public String getName(){
		return name;
	}

	public String getStatus(){
		return status;
	}
	
	public String getSlug(){
		return slug;
	}
	
	public LeagueServerIncident[] getIncidents(){
		return incidents;
	}


}