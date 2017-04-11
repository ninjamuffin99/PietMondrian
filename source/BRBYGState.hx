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
	
	private var _red:FlxSprite;
	private var _yellow:FlxSprite;
	
	private var _horizLine1:FlxSprite;
	private var _horizLine2:FlxSprite;
	private var _horizLine3:FlxSprite;
	private var _horizLine4:FlxSprite;
	private var _horizLine5:FlxSprite;
	
	private var _vertLine1:FlxSprite;
	private var _vertLine2:FlxSprite;
	
	private var _vertLine4:FlxSprite;
	
	
	private var _vignette:FlxSprite;
	
	override public function create():Void 
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		
		bg = new FlxSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		add(bg);
		
		makeColor();
		
		makeLine();
		makeVertLine();
		
		_player = new Player(FlxG.width * 0.07, FlxG.height * 0.01);
		add(_player);
		
		_vignette = new FlxSprite(0, 0, "assets/images/vignetteresized.png");
		_vignette.alpha = 0.25;
		add(_vignette);
		
		super.create();
	}
	
	private function makeColor():Void
	{
		_red = new FlxSprite(FlxG.width * 0.1, FlxG.height * 0.1);
		_red.makeGraphic(Std.int(FlxG.width * 0.45), Std.int(FlxG.width * 0.45), FlxColor.RED);
		add(_red);
		
		_yellow = new FlxSprite(FlxG.width * 0.55, 0);
		_yellow.makeGraphic(Std.int(FlxG.width * 0.3), Std.int(FlxG.height * 0.4), FlxColor.YELLOW);
		add(_yellow);
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
		
		_horizLine5 = new FlxSprite(FlxG.width * 0.1, FlxG.height * 0.9);
		_horizLine5.makeGraphic(Std.int(FlxG.width * 0.5), lineThickness, FlxColor.BLACK);
		add(_horizLine5);
	}
	
	private function makeVertLine():Void
	{
		var lineThickness:Int = Std.int(FlxG.width * 0.02);
		var topPadding:Int = Std.int(FlxG.height * 0.025);
		
		_vertLine1 = new FlxSprite(FlxG.width * 0.1, FlxG.height * 0.1);
		_vertLine1.makeGraphic(lineThickness, FlxG.height, FlxColor.BLACK);
		add(_vertLine1);
		
		_vertLine2 = new FlxSprite(FlxG.width * 0.25, topPadding);
		_vertLine2.makeGraphic(lineThickness, Std.int(FlxG.height * 0.1), FlxColor.BLACK);
		add(_vertLine2);
		
		
		_vertLine4 = new FlxSprite(FlxG.width * 0.55, topPadding);
		_vertLine4.makeGraphic(lineThickness, Std.int(FlxG.height * 0.9), FlxColor.BLACK);
		add(_vertLine4);
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
