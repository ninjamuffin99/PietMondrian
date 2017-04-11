package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/NEXA BOLD.OTF", "assets/data/NEXA BOLD.OTF");
			type.set ("assets/data/NEXA BOLD.OTF", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/data/Nexa Light.otf", "assets/data/Nexa Light.otf");
			type.set ("assets/data/Nexa Light.otf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/images/canvas.jpg", "assets/images/canvas.jpg");
			type.set ("assets/images/canvas.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/compBRBYG.png", "assets/images/compBRBYG.png");
			type.set ("assets/images/compBRBYG.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/CompWithRBY.ase", "assets/images/CompWithRBY.ase");
			type.set ("assets/images/CompWithRBY.ase", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/images/CompWithRBY.png", "assets/images/CompWithRBY.png");
			type.set ("assets/images/CompWithRBY.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/vignetteresized.png", "assets/images/vignetteresized.png");
			type.set ("assets/images/vignetteresized.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/A2-01.mp3", "assets/music/A2-01.mp3");
			type.set ("assets/music/A2-01.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
