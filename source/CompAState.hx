package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class CompAState extends FlxState 
{
	private var bg:FlxSprite;
	private var _horizLine1:FlxSprite;
	private var _horizLine2:FlxSprite;
	private var _horizLine3:FlxSprite;
	private var _horizLine4:FlxSprite;
	private var _horizLine5:FlxSprite;
	
	private var _vertLine1:FlxSprite;
	private var _vertLine2:FlxSprite;
	private var _vertLine3:FlxSprite;
	
	private var _yellow:FlxSprite;
	
	private var _player:Player;
	
	private var _vignette:FlxSprite;
	
	
	override public function create():Void 
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		
		//behind bg so it doesnt show up
		_yellow = new FlxSprite(620, 575);
		_yellow.makeGraphic(200, 100);
		add(_yellow);
		
		bg = new FlxSprite(0, 0);
		bg.loadGraphic("assets/images/CompAVector.png", false, 960, 720);
		add(bg);
		
		makeLines();
		
		_player = new Player(100, 20);
		add(_player);
		
		FlxG.camera.follow(_player, PLATFORMER);
		FlxG.camera.setScrollBoundsRect(0, 0, 960, 720);
		FlxG.worldBounds.set(0, 0, 960, 720);
		
		_vignette = new FlxSprite(0, 0);
		_vignette.loadGraphic("assets/images/vignetteresized.png", false, 640, 480);
		_vignette.alpha = 0.25;
		_vignette.scrollFactor.x = _vignette.scrollFactor.y = 0;
		add(_vignette);
		
		super.create();
	}
	
	private function makeLines():Void
	{
		_horizLine1 = new FlxSprite(0, 166);
		_horizLine1.makeGraphic(370, 5, FlxColor.BLACK);
		_horizLine1.immovable = true;
		add(_horizLine1);
		
		_horizLine2 = new FlxSprite(364, 327);
		_horizLine2.makeGraphic(490, 6, FlxColor.BLACK);
		_horizLine2.immovable = true;
		add(_horizLine2);
		
		_horizLine3 = new FlxSprite(0, 450);
		_horizLine3.makeGraphic(370, 6, FlxColor.BLACK);
		_horizLine3.immovable = true;
		add(_horizLine3);
		
		_horizLine4 = new FlxSprite(370, 570);
		_horizLine4.makeGraphic(FlxG.width * 2, 6, FlxColor.BLACK);
		_horizLine4.immovable = true;
		add(_horizLine4);
		
		_horizLine5 = new FlxSprite(176, 675);
		_horizLine5.makeGraphic(680, 6, FlxColor.BLACK);
		_horizLine5.immovable = true;
		add(_horizLine5);
		
		
		_vertLine1 = new FlxSprite(57, 0);
		_vertLine1.makeGraphic(6, 451, FlxColor.BLACK);
		_vertLine1.immovable = true;
		add(_vertLine1);
		
		_vertLine2 = new FlxSprite(178, 455);
		_vertLine2.makeGraphic(6, 451, FlxColor.BLACK);
		_vertLine2.immovable = true;
		add(_vertLine2);
		
		_vertLine3 = new FlxSprite(848, 0);
		_vertLine3.makeGraphic(6, FlxG.width * 2, FlxColor.BLACK);
		_vertLine3.immovable = true;
		add(_vertLine3);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.collide(_player, _horizLine1);
		FlxG.collide(_player, _horizLine2);
		FlxG.collide(_player, _horizLine3);
		FlxG.collide(_player, _horizLine4);
		FlxG.collide(_player, _horizLine5);
		
		FlxG.collide(_player, _vertLine1);
		FlxG.collide(_player, _vertLine2);
		FlxG.collide(_player, _vertLine3);
		
		if (FlxG.overlap(_player, _yellow))
		{
			FlxG.camera.fade(FlxColor.BLACK, 1, false, fadeOut);
		}
		
		FlxG.watch.addMouse();
		super.update(elapsed);
	}
	
	private function fadeOut():Void
	{
		FlxG.switchState(new PlayState());
	}
}