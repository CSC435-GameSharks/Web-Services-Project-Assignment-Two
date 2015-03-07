
package League;

import javax.json.JsonObject;

/**
 *
 * @author kellymaestri
 */
public class LeagueSummoner {
    String name;
    String id;
    String profileIcon;
    String level;
    
    public LeagueSummoner(JsonObject summoner){
        name = summoner.get("name").toString().replace("\"", "");
        id = summoner.get("id").toString();
        level = summoner.get("summonerLevel").toString();
        profileIcon = summoner.get("ptofileIconId").toString();
        
        
    }
    
    public String getName(){
        return name;
    }
    
    public String getID(){
        return id;
    }
    
    public String getLevel(){
        return level;
    }
    
    public String getProfileIcon(){
        return profileIcon;
    }
    
    
}
