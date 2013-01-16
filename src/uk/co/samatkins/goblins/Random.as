package uk.co.samatkins.goblins 
{
	/**
	 * ...
	 * @author Samuel Atkins
	 */
	public class Random 
	{
		public static function randomInt(min:int, max:int):int {
			return Math.floor(Math.random() * (max - min)) + min;
		}
		
		public static function fromArray(arr:Array):* {
			return arr[randomInt(0, arr.length)];
		}
		
	}

}