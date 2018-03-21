package;

import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class ArtSprite extends FlxSpriteGroup
{
	private var sprArt:FlxSprite;
	public var txtInfo:FlxTypeText;

	public function new(?X:Float = 0, ?Y:Float = 0, artPath:String = "", artInfo:String = "")
	{
		super();
		/*
		x = X;
		y = Y;
		*/
		sprArt = new FlxSprite(X, Y).loadGraphic(artPath, false);
		add(sprArt);
		
		txtInfo = new FlxTypeText(sprArt.x - 285, sprArt.y + 20, artInfo.length * 6, artInfo, 16);
		txtInfo.color = FlxColor.BLACK;
		txtInfo.font = "assets/data/NEXA BOLD.OTF";
		add(txtInfo);
		
	}

}