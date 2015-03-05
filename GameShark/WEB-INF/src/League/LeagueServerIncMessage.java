package League;

import javax.json.JsonObject;
/**
 *@author kellymaestri
 */

public class LeagueServerIncMessage {
	
	private String author;
	private String content;
	private String createdAt;
	private String severity;//info, alert or error
	private String id;
	private String updatedAt;
	
	public LeagueServerIncMessage(JsonObject message){
	
		author = message.get("author").toString();
		content = message.get("content").toString();
		createdAt = message.get("created_at").toString();
		id = message.get("id").toString();
		severity = message.get("severity").toString();
		updatedAt = message.get("updated_at").toString();  
		
		}
		
		
		public String getAuthor(){
			return author;
		}
		
		public String getContent(){
			return content;
		}
		
		public String getCreatedAt(){
			return createdAt;
		}
		
		public String getSeverity(){
			return severity;
		}
		
		public String getID(){
			return id;
		}
		
		public String getUpdatedAt(){
			return updatedAt;
		}

}