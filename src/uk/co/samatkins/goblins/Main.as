package uk.co.samatkins.goblins
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import uk.co.samatkins.goblins.game.GameWorld;
	import uk.co.samatkins.goblins.map.MapWorld;
	import uk.co.samatkins.goblins.menu.MenuWorld;
	import net.flashpunk.utils.Key;

	/**
	 * ...
	 * @author Samuel Atkins
	 */
	public class Main extends Engine 
	{
		private var gameWorld:GameWorld;
		private var mapWorld:MapWorld;
		
		public function Main():void 
		{
			super(400, 300, 30, false);
			FP.screen.scale = 2;
			FP.screen.color = 0xffffff;
			trace("RUNNING!");
			
			FP.world = new MenuWorld;
			FP.volume = 0.5;
			
			//FP.console.enable();
			FP.console.toggleKey = Key.F1;
		}
		
		public function getGameWorld():GameWorld {
			if (gameWorld == null) { gameWorld = new GameWorld(); }
			
			return gameWorld;
		}
		
		public function getMapWorld():MapWorld {
			if (mapWorld == null) { mapWorld = new MapWorld(); }
			
			return mapWorld;
		}
	}

}