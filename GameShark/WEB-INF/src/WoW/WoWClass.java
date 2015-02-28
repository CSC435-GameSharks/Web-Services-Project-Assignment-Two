package WoW;

import javax.json.JsonObject;

/**
 *This class is used to make a WoW Class Object.  Ex Paladin, Mage
 */
public class WoWClass {
    private int intID;
    private String sMask;
    private String sPowerType;
    private String sName;
    
    /**
     * Creates an WoWClass object 
     * @param objIn, JsonObject
     */
    WoWClass(JsonObject objIn){
        intID = objIn.getInt("id");
        sMask = objIn.getString("mask");
        sPowerType = objIn.getString("powerType");
        sName = objIn.getString("name");
        
    }
    
    /**
     * 
     * @return the class id
     */
    public int getID(){
        return intID;
    }
    
    /**
     * 
     * @return the class mask
     */
    public String getMask(){
        return sMask;
    }

    /**
     * 
     * @return the class powertype
     */
    public String getPowerType(){
        return sPowerType;
    }
    
    /**
     * 
     * @return the class name
     */
    public String getName(){
        return sName;
    }
    
    
    
}
