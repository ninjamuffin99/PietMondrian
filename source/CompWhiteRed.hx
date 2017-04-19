package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class CompWhiteRed extends FlxState 
{
	private var bg:FlxSprite;
	private var _player:Player;
	private var _vignette:FlxSprite;
	
	private var _horizLine1:FlxSprite;
	private var _horizLine2:FlxSprite;
	private var _horizLine3:FlxSprite;
	
	private var _vertLine1:FlxSprite;
	private var _vertLine2:FlxSprite;
	
	private var _red:FlxSprite;
	
	private var _bottom:FlxSprite;
	
	override public function create():Void 
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		
		_bottom = new FlxSprite(0, 476);
		_bottom.makeGraphic(FlxG.width, 3);
		_bottom.immovable = true;
		add(_bottom);
		
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/CompWhiteRedVECTOR.png", false, 640, 480);
		add(bg);
		
		_red = new FlxSprite(248, 460);
		_red.makeGraphic(280, 40, FlxColor.RED);
		_red.alpha = 0;
		add(_red);
		
		_player = new Player(30, 40);
		add(_player);
		
		makeLines();
		
		_vignette = new FlxSprite(0, 0);
		_vignette.loadGraphic("assets/images/vignetteresized.png", false, 640, 480);
		_vignette.alpha = 0.25;
		add(_vignette);
		
		super.create();
	}
	
	private function makeLines():Void
	{
		_horizLine1 = new FlxSprite(0, 208);
		_horizLine1.makeGraphic(243, 8, FlxColor.BLACK);
		_horizLine1.immovable = true;
		add(_horizLine1);
		
		_horizLine2 = new FlxSprite(245, 345);
		_horizLine2.makeGraphic(380, 6, FlxColor.BLACK);
		_horizLine2.immovable = true;
		add(_horizLine2);
		
		_horizLine3 = new FlxSprite(240, 460);
		_horizLine3.makeGraphic(380, 8, FlxColor.BLACK);
		add(_horizLine3);
		
		_vertLine1 = new FlxSprite(25, 0);
		_vertLine1.makeGraphic(8, FlxG.height, FlxColor.BLACK);
		_vertLine1.immovable = true;
		add(_vertLine1);
		
		_vertLine2 = new FlxSprite(619, 0);
		_vertLine2.makeGraphic(8, FlxG.height, FlxColor.BLACK);
		_vertLine2.immovable = true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.collide(_player, _horizLine1);
		FlxG.collide(_player, _vertLine1);
		FlxG.collide(_player, _vertLine2);
		FlxG.collide(_player, _horizLine2);
		FlxG.collide(_player, _bottom);
		
		if (FlxG.overlap(_red, _player))
		{
			FlxG.camera.fade(FlxColor.BLACK, 0.5, false, fadeDone);
		}
		
		FlxG.watch.addMouse();
		
		super.update(elapsed);
	}
	
	private function fadeDone():Void
	{
		FlxG.switchState(new PlayState());
	}
	
}