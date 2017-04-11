package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class BRBYGState extends FlxState 
{
	private var bg:FlxSprite;
	private var _player:Player;
	
	private var _horizLine1:FlxSprite;
	
	override public function create():Void 
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		
		bg = new FlxSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		add(bg);
		
		makeLine();
		
		_player = new Player(FlxG.width * 0.07, FlxG.height * 0.01);
		add(_player);
		
		super.create();
	}
	
	private function makeLine():Void
	{
		_horizLine1 = new FlxSprite(0, FlxG.height * 0.1);
		_horizLine1.makeGraphic(FlxG.width, Std.int(FlxG.height * 0.04), FlxColor.BLACK);
		_horizLine1.immovable = true;
		add(_horizLine1);
	}
	
}