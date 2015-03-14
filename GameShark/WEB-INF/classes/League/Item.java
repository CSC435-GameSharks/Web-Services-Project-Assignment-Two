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
public class Item {
    
    String id;
    String description;
    String name;
    String image;
    String stats;
    
    public Item(JsonObject json){
        name = json.getString("name");
        id = json.getString("id");
        description = json.getString("description");
        
    }
    
    
    public Item(String nam, String iD, String im){
        name = nam;
        id = iD;
        image = im;
    }
    
    public String getImage(){
        return image;
    }
    
    public String getID(){
        return id;
    }
    
    public String getName(){
        return name;
    }
    
    
    
}
