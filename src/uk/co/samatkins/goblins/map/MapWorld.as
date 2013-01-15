package uk.co.samatkins.goblins.map 
{
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Samuel Atkins
	 */
	public class MapWorld extends World 
	{
		[Embed(source = "../../../../../../assets/maptiles.png")] private static const MAPTILES_PNG:Class;
		
		private static const MAPTILE_SIZE:uint = 16;
		
		private var terrain:Tilemap;
		
		public function MapWorld() 
		{
			terrain = new Tilemap(MAPTILES_PNG, MAPTILE_SIZE * 10, MAPTILE_SIZE * 10, MAPTILE_SIZE, MAPTILE_SIZE);
			addGraphic(terrain);
		}
		
	}

}