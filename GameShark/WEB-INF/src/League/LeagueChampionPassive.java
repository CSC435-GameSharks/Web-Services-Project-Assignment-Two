/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package League;

import javax.json.JsonObject;

/**
 *
 * @author kellymaestri
 */
public class LeagueChampionPassive {
    
    String name;
    String description;
    String image;//image then full
    
    
    public LeagueChampionPassive(JsonObject json){
       name = json.getString("name");
       description = json.getString("description");
       image = json.getJsonObject("image").getString("full");
    }
    
    public String getName(){
        return name;
    }
    
    public String getDesc(){
        return description;
    }
    
    public String getImage(){
        return image;
    }
    
}
