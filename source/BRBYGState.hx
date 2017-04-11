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
	private var _horizLine2:FlxSprite;
	private var _horizLine3:FlxSprite;
	private var _horizLine4:FlxSprite;
	
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
		var lineThickness:Int = Std.int(FlxG.height * 0.03);
		var rightPadding:Int = Std.int(FlxG.width * 0.9);
		
		_horizLine1 = new FlxSprite(0, FlxG.height * 0.1);
		_horizLine1.makeGraphic(rightPadding, lineThickness, FlxColor.BLACK);
		_horizLine1.immovable = true;
		add(_horizLine1);
		
		_horizLine2 = new FlxSprite(0, FlxG.height * 0.4);
		_horizLine2.makeGraphic(rightPadding, lineThickness, FlxColor.BLACK);
		add(_horizLine2);
		
		_horizLine3 = new FlxSprite(FlxG.width * 0.1, FlxG.height * 0.6);
		_horizLine3.makeGraphic(rightPadding, lineThickness, FlxColor.BLACK);
		add(_horizLine3);
		
		_horizLine4 = new FlxSprite(0, FlxG.height * 0.75);
		_horizLine4.makeGraphic(FlxG.width, lineThickness, FlxColor.BLACK);
		add(_horizLine4);
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.collide(_player, _horizLine1);
		
		if (_player.y <= 3)
		{
			_player.y = 4;
		}
		if (_player.x <= 5)
		{
			_player.x = 6;
		}
		
		super.update(elapsed);
	}
}