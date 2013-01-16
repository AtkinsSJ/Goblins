package uk.co.samatkins.goblins 
{
	import flash.utils.ByteArray;
	/**
	 * ...
	 * @author Samuel Atkins
	 */
	public class NameGenerator 
	{
		[Embed(source = "../../../../../assets/data/placenames.csv", mimeType = "application/octet-stream")] public static const PLACENAMES_JSON:Class;
		
		public static var placeNames:Object;
		
		public static function getPlaceName():String {
			if (placeNames == null) {
				placeNames = {
					start: [],
					end: []
				};
				
				var bytes:ByteArray = new PLACENAMES_JSON as ByteArray;
				var csvString:String = bytes.readUTFBytes(bytes.length);
				var lines:Array = csvString.split("\n");
				lines[0] = lines[0].substr(0, lines[0].length -1); // remove newline char
				
				placeNames.start = lines[0].split(",");
				placeNames.end = lines[1].split(",");
			}
			
			return placeNames.start[Random.randomIndex(placeNames.start)] + placeNames.end[Random.randomIndex(placeNames.end)];
		}
	}

}