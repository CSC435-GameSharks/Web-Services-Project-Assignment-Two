package WoW;

import javax.json.JsonObject;
import javax.json.JsonArray;

/**
 * This is just a simple WoW item class
 */
public class WoWItem {
    //4
    private int intSTR;
    //3
    private int intAGI;
    //7
    private int intSTA;
    //5
    private int intINT;
    //6
    private int intSPI;

    public WoWItem(JsonArray objIn){

    }
    
    //getters and setters
    public int getSTR(){
	return intSTR;
    }

    public int getAGI(){
	return intAGI;
    }
    
    public int getSTA(){
	return intSTA;
    }

    public int getINT(){
	return intINT;
    }

    public int getSPI(){
	return intSPI;
    }

}
