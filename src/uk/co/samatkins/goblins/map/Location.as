package uk.co.samatkins.goblins.map 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author Samuel Atkins
	 */
	public class Location extends Entity 
	{
		[Embed(source = "../../../../../../assets/images/map/village.png")] private static const VILLAGE_PNG:Class;
		
		public static const TYPES:Object = {
			player: 	{image: '', description: "Your Fortress"},
			village: 	{image: VILLAGE_PNG, description: "Village"}
		};
		
		private var locationType:String;
		
		public function Location(x:uint, y:uint, myType:String) 
		{
			this.locationType = myType;
			super(x * MapWorld.MAPTILE_SIZE, y * MapWorld.MAPTILE_SIZE);
			setHitbox(MapWorld.MAPTILE_SIZE, MapWorld.MAPTILE_SIZE);
			type = "location";
			
			addGraphic( new Stamp(TYPES[this.locationType].image) );
			addGraphic( new Text("Derpville", -16, 16, {
				align: "center",
				size: "8",
				width: 48
			}));
		}
		
	}

}