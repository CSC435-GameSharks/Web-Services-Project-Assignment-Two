package League;

import javax.json.JsonObject;
import javax.json.JsonArray;

/**
 *@author kellymaestri
 */

public class LeagueServer {

	private String serverName;
	private String slug;
	private LeagueServerService[] services;

	public LeagueServer(JsonObject server){
		serverName = server.get("name").toString().replace("\"","");
		slug = server.get("slug").toString();
		
		JsonArray serv = server.getJsonArray("services");
		int size = serv.size();
		services = new LeagueServerService[size];
		
		for (int i = 0; i < size; i++) {
		    JsonObject tmp = serv.getJsonObject(i);
		    services[i] = new LeagueServerService(tmp);



		}		
	}
	
	public String getName(){
		return serverName;
	}
	
	public String getSlug(){
		return slug;
	}
	
	public LeagueServerService[] getServices(){
		return services;
		
	}


}