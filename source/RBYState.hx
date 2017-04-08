package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class RBYState extends FlxState 
{
	private var bg:FlxSprite;
	private var _horizLineLong:FlxSprite;
	private var _horizLineLeft:FlxSprite;
	private var _vertLineLeft:FlxSprite;
	private var _red:FlxSprite;
	private var _player:Player;
	
	override public function create():Void 
	{
		bg = new FlxSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.height);
		add(bg);
		
		_red = new FlxSprite(FlxG.width * 0.1);
		_red.makeGraphic(FlxG.width, Std.int(FlxG.height * 0.7), FlxColor.RED);
		add(_red);
		
		_player = new Player(10, 10);
		add(_player);
		
		_horizLineLong = new FlxSprite(0, FlxG.height * 0.7);
		_horizLineLong.makeGraphic(FlxG.width, 15, FlxColor.BLACK);
		add(_horizLineLong);
		
		_horizLineLeft = new FlxSprite(0, FlxG.height * 0.3);
		_horizLineLeft.makeGraphic(Std.int(FlxG.width * 0.1), 20, FlxColor.BLACK);
		_horizLineLeft.immovable = true;
		add(_horizLineLeft);
		
		_vertLineLeft = new FlxSprite(FlxG.width * 0.1, 0);
		_vertLineLeft.makeGraphic(15, FlxG.height, FlxColor.BLACK);
		add(_vertLineLeft);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.collide(_player, _horizLineLeft);
		
		/*if (FlxG.overlap(_player, _vertLineLeft)
		{
			
		}*/
		
		super.update(elapsed);
	}
}