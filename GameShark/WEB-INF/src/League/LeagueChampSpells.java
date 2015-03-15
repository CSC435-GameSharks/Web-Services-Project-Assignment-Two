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
public class LeagueChampSpells {
    String name;
    String description;
    String costType;
    String image;
    
    public LeagueChampSpells(JsonObject json){
        name = json.getString("name");
        description = json.getString("description");
        costType = json.getString("costType");
        image = json.getJsonObject("image").getString("full");
 
    }
    
    public String getName(){
        
        return name;
    }
    
    public String getCostType(){
        return costType;
    }
    
    public String getDescription(){
     return description;   
    }
    
    public String getImage(){
        return image;
    }
    
    
    
}
