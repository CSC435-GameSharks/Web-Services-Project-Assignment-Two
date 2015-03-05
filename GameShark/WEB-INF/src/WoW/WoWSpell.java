package WoW;

/**
 *This class is used to make a WoW Spell object
 */
public class WoWSpell{
    private int lvl;
    private String sName;

    /**
     * @param sNameIn the name of the spell
     * @param lvlIn the min lvl needed for the spell
     */
    public WoWSpell(String sNameIn, int lvlIn){
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
