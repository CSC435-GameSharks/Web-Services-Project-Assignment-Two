/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package League;

import java.io.PrintWriter;
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
    
    
    public LeagueSummonerStats(JsonObject json,PrintWriter out){
      // out.println("in summoner stats");
        statSummaryType = json.getString("playerStatSummaryType");
        wins = json.get("wins").toString();
       
        if(json.get("losses")!= null){
            losses = json.get("losses").toString();
        }else{
            losses = "0";
        }

        JsonObject tmp = json.getJsonObject("aggregatedStats");
       // out.println(tmp.toString());
        if(tmp.get("totalChampionKills") != null){
            totalChampKills = tmp.get("totalChampionKills").toString();
        }else{
            totalChampKills = "0";
        }
       // out.println("1");
        if(tmp.get("totalMinionKills")!= null){
            totalMinionKills = tmp.get("totalMinionKills").toString();
        }else{
            totalMinionKills = "0";
        }
       // out.println("2");
        if(tmp.get("totalTurrentsKilled") != null){
            totalTurrentKills = tmp.get("totalTurrentsKilled").toString();
        }else{
            totalTurrentKills = "0";
        }
       // out.println("3");
        if(tmp.get("totalNeutralMinionsKilled") != null){
            totalNeutralMinionsKilled = tmp.get("totalNeutralMinionsKilled").toString();  
        }else{
            totalNeutralMinionsKilled = "0";
        }
       // out.println("4");
        if(tmp.get("totalAssists") != null){
            totalAssists = tmp.get("totalAssists").toString();
        }else{
            totalAssists = "0";
        }
        //out.println("done in summoner stats");
        
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
