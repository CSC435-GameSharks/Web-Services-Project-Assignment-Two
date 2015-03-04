package WoW;

/**
 *This class is used to make a detaled WoW Class Object
 *I'll be honest I didn't really think the other WoWClass class
 *throu 100%
 */
public class WoWClassDetail {
    private int intID;
    private String sName;
    private String sBio;
    private String[] aryRoles;
    private String[] arySpecs;
    private WoWSpell[] arySpells;
    private WoWTalent[] aryTalents;

    /**
     * @param sNameIn the name of the WoW Class
     * @param intIDIn the id for the WoW Class
     */
    public WoWClassDetail(String sNameIn, int intIDIn, String sBioIn){
	this.sName = sNameIn;
	this.intID = intIDIn;
	this.sBio = sBioIn;
	this.aryRoles = null;
	this.arySpecs = null;
	this.arySpells = null;
	this.aryTalents = null;

    }
    
    /**
     * @return the classes Name
    */
    public String getName(){
	return sName;
    }
    
    /**
     * @return the classes ID
    */
    public int getID(){
	return intID;
    }

    /**
     * @return an array of roles that are the classes
     * roles
    */
    public String[] getRoles(){
	return aryRoles;
    }
    
    public void setRoles(String[] aryIn){
	this.aryRoles = aryIn;
    }
    /**
     * @return an array of strings that are the classes
     * specs
    */
    public String[] getSpecs(){
	return arySpecs;
    }
    
    public void setSpecs(String[] aryIn){
	this.arySpecs = aryIn;
    }
    
    /**
     * @return an array of WoWSpell objects
    */
    public WoWSpell[] getSpells(){
	return arySpells;
    }

    /**
     * @return an array of WoWTalent objects
    */
    public WoWTalent[] getTalents(){
	return aryTalents;
    }
}
