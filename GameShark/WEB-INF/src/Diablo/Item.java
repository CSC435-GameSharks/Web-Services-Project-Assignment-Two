package Diablo;

import javax.json.*;
public class Item{
	public static final String IMAGE_URL_PREFIX="http://media.blizzard.com/d3/icons/items/large/";
	private String id;
	private String name; 	
	private String icon;
	private String displayColor;
	private String tooltipParams;

	public Item(JsonObject objIn){
		this.id=objIn.getString("id");
		this.name=objIn.getString("name");
		this.icon=objIn.getString("icon");
		this.displayColor=objIn.getString("displayColor");
		this.tooltipParams=objIn.getString("tooltipParams");
		this.tooltipParams=tooltipParams.substring(tooltipParams.indexOf("/")+1);
	}
	public String toHtmlString(){
        StringBuilder sbReturn = new StringBuilder();
        sbReturn.append("           </br>\n");
        sbReturn.append("Name:    " + this.getName()+ "</br>\n");
        sbReturn.append("<img src=\"" + IMAGE_URL_PREFIX + this.getIcon() + ".png\">" + "</br>\n");
        return sbReturn.toString();
	}

	public String getId(){
		return id;
	}
	public String getName(){
		return name;
	}
	public String getIcon(){
		return icon;
	}
	public String getDisplayColor(){
		return displayColor;
	}
	public String getTooltipParams(){
		return tooltipParams;
	}
}