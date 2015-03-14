/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package League;

/**
 *
 * @author kellymaestri
 */
public class LeagueBasicChampion {
    String name;
    String id;
    String image;

    public LeagueBasicChampion(String n, String i, String im){
        name = n;
        id = i;
        image = im;
    }
    
    public String getID(){
     return id;   
    }
    
    
    public String getName(){
        return name;
    }
    
    public String getImage(){
        return image;
    }
    
}