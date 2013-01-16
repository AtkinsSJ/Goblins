package uk.co.samatkins.goblins.map 
{
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Samuel Atkins
	 */
	public class MapWorld extends World 
	{
		[Embed(source = "../../../../../../assets/maptiles.png")] private static const MAPTILES_PNG:Class;
		
		public static const MAPTILE_SIZE:uint = 16;
		public static const TILES_W:uint = 25;
		public static const TILES_H:uint = 17;
		
		private var terrain:Tilemap;
		private var terrainGrid:Grid;
		
		public function MapWorld() 
		{
			terrain = new Tilemap(MAPTILES_PNG, MAPTILE_SIZE * TILES_W, MAPTILE_SIZE * TILES_H, MAPTILE_SIZE, MAPTILE_SIZE);
			addGraphic(terrain);
			setTerrain();
			terrainGrid = terrain.createGrid([1]);
			addMask(terrainGrid, "obstructed");
			
			populate();
		}
		
		public function setTerrain():void {
			// TODO: Actually accept input
			
			for (var x:int = 0; x < TILES_W; x++) 
			{
				for (var y:int = 0; y < TILES_H; y++) 
				{
					terrain.setTile(x, y, Math.floor(Math.random() * 2));
				}
			}
		}
		
		public function populate():void 
		{
			// TODO: Accept input
			
			// Add some towns and things
			for (var i:int = 0; i < 5; i++) 
			{
				var x:int = Math.floor(Math.random() * TILES_W),
					y:int = Math.floor(Math.random() * TILES_H);
				if (terrainGrid.getTile(x, y)) {
					i--;
				} else {
					add(new Location(x, y, "village"));
					terrainGrid.setTile(x, y, true);
				}
			}
		}
		
	}

}