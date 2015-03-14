/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package League;

import javax.json.JsonArray;
import javax.json.JsonObject;

/**
 *
 * @author kellymaestri
 */
public class LeagueSummonerStats {
    //More stats can be added to the summoner stats
    String statSummaryType;
    String wins;
    String losses;
    String totalChampKills;
    String totalTurrentKills;
    String totalAssists;
    String totalMinionKills;
    String totalNeutralMinionsKilled;
    
    
    public LeagueSummonerStats(JsonObject json){
       
        statSummaryType = json.getString("playerStatSummaryType");
        wins = json.get("wins").toString();
        if(json.getString("losses")!= null){
            losses = json.get("losses").toString();
        }
        JsonObject tmp = json.getJsonObject("aggregatedStats");
        if(tmp.get("totalChampionKills") != null){
            totalChampKills = tmp.get("totalChampionKills").toString();
        }
        if(tmp.get("totalMinionKills")!= null){
            totalMinionKills = tmp.get("totalMinionKills").toString();
        }
        if(tmp.get("totalTurrentsKilled") != null){
            totalTurrentKills = tmp.get("totalTurrentsKilled").toString();
        }
        if(tmp.get("totalNeutralMinionsKilled") != null){
            totalNeutralMinionsKilled = tmp.get("totalNeutrlMinionsKilled").toString();  
        }
        if(tmp.get("totalAssists") != null){
            totalAssists = tmp.get("totalAssists").toString();
        }
        
    }
    
    public String getType(){
        return statSummaryType;
    }
    
    public String getWins(){
        return wins;
    }
    
    public String getChampKills(){
        return totalChampKills;
    }
    public String getTurrentKills(){
        return totalTurrentKills;
    }
    
    public String getMinionKills(){
        return totalMinionKills;
    }
    public String getNMKills(){
        return totalNeutralMinionsKilled;
    }
    
    public String getAssists(){
        return totalAssists;
    }
    
}
