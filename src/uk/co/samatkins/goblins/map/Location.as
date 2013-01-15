package uk.co.samatkins.goblins.map 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author Samuel Atkins
	 */
	public class Location extends Entity 
	{
		
		public static const TYPES:Object = {
			player: 	{image: '', description: "Your Fortress"},
			village: 	{image: '', description: "Village"}
		};
		
		private var locationType:String;
		
		public function Location(x:uint, y:uint, type:String) 
		{
			this.locationType = type;
			super(x * MapWorld.MAPTILE_SIZE, y * MapWorld.MAPTILE_SIZE);
			setHitbox(MapWorld.MAPTILE_SIZE, MapWorld.MAPTILE_SIZE);
			type = "location";
		}
		
	}

}