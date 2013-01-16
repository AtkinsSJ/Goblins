package uk.co.samatkins.goblins.map 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import uk.co.samatkins.goblins.NameGenerator;
	
	/**
	 * ...
	 * @author Samuel Atkins
	 */
	public class Location extends Entity 
	{
		[Embed(source = "../../../../../../assets/images/map/village.png")] private static const VILLAGE_PNG:Class;
		
		public static const TYPES:Object = {
			player: 	{image: '', 			description: "Your Fortress", popMin: 0, popMax: 0},
			village: 	{image: VILLAGE_PNG, 	description: "Village", 	  popMin: 5, popMax: 100}
		};
		
		private var locationType:String;
		private var population:uint;
		private var locationName:String;
		
		private var popup:Graphiclist;
		private var popupBack:Image;
		private var nameText:Text;
		private var popText:Text;
		private var descText:Text;
		
		public function Location(x:uint, y:uint, myType:String) 
		{
			locationType = myType;
			super(x * MapWorld.MAPTILE_SIZE, y * MapWorld.MAPTILE_SIZE);
			setHitbox(MapWorld.MAPTILE_SIZE, MapWorld.MAPTILE_SIZE);
			type = "location";
			
			population = Math.floor(Math.random() * (TYPES[locationType].popMax - TYPES[locationType].popMin)) + TYPES[locationType].popMin;
			locationName = NameGenerator.getPlaceName();
			
			addGraphic( new Stamp(TYPES[locationType].image) );
			
			popupBack = Image.createRect(50, 30, 0x0, 0.5);
			nameText = new Text(locationName, 0, 0, {
				size: 8,
				width: 48
			});
			popText = new Text(population.toString(), 0, 10, {
				size: 8,
				width: 48
			});
			descText = new Text(TYPES[locationType].description, 0, 20, {
				size: 8,
				width: 48
			});
			popup = new Graphiclist(popupBack, nameText, popText, descText);
			
			addGraphic(popup);
			popup.x = -17;
			popup.y = -30;
			popup.visible = false;
		}
		
		override public function update():void 
		{
			super.update();
			popup.visible = collidePoint(x, y, Input.mouseCameraX, Input.mouseCameraY);
		}
		
	}

}