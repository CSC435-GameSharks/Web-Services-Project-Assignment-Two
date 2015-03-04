package WoW;

/**
 *This class is used to make a WoW Talent Object
 */
public class WoWTalent{
    private int lvl;
    private String sName;

    /**
     * @param sNameIn the name of the talent
     * @param lvlIn the min lvl needed for the spell
     */
    public WoWTalent(String sNameIn, int lvlIn){
	this.sName = sNameIn;
	this.lvl = lvlIn;
    }


    public String getName(){
	return sName;
    }

    public int getLvl(){
	return lvl;
    }
}
