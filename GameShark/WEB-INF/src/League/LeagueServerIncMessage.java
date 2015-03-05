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
	private long id;
	private String updatedAt;
	
	public LeagueServerIncMessage(JsonObject message){
	
		author = message.get("author");
		content = message.get("content");
		createdAt = message.get("created_at");
		id = message.get("id");
		severity = message.get("severity");
		updatedAt = message.get("updated_at")    
		
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
		
		public long getID(){
			return id;
		}
		
		public String getUpdatedAt(){
			return updatedAt;
		}

}