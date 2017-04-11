package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxSpriteAniRot;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class TableauState extends FlxState 
{
	private var bg:FlxSprite;
	private var _player:Player;
	
	private var _black:FlxSprite;
	private var _red:FlxSprite;
	
	private var _ground:FlxSprite;
	private var _groundBottom:FlxSprite;
	
	private var _vertLine1:FlxSprite;
	

	override public function create():Void 
	{
		bg = new FlxSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.height * 2);
		add(bg);
		
		_black = new FlxSprite(0, 0);
		_black.makeGraphic(Std.int(FlxG.width * 0.25), Std.int(FlxG.height * 0.2), FlxColor.BLACK);
		add(_black);
		
		_red = new FlxSprite(FlxG.width * 0.25, 0);
		_red.makeGraphic(FlxG.width, Std.int(FlxG.height * 0.6), FlxColor.RED);
		add(_red);
		
		makeLine();
		
		
		_player = new Player(FlxG.width * 0.01, FlxG.height * 0.1);
		add(_player);
		
		FlxG.camera.follow(_player, PLATFORMER);
		FlxG.camera.setScrollBoundsRect(0, 0, FlxG.width, FlxG.height * 2);
		FlxG.worldBounds.set(0, 0, FlxG.width, FlxG.height * 2.2);
		
		super.create();
	}
	
	private function makeLine():Void
	{
		var lineThickness:Int = Std.int(FlxG.height * 0.025);
		
		_ground = new FlxSprite(0, FlxG.height * 0.2);
		_ground.makeGraphic(Std.int(FlxG.width * 0.25), 10, FlxColor.BLACK);
		_ground.immovable = true;
		add(_ground);
		
		_groundBottom = new FlxSprite(FlxG.width * 0.25, FlxG.height * 1.95);
		_groundBottom.makeGraphic(FlxG.width, lineThickness, FlxColor.BLACK);
		_groundBottom.immovable = true;
		add(_groundBottom);
		
		_vertLine1 = new FlxSprite(FlxG.width * 0.25, 0);
		_vertLine1.makeGraphic(lineThickness, FlxG.height * 2, FlxColor.BLACK);
		add(_vertLine1);
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.collide(_ground, _player);
		FlxG.collide(_groundBottom, _player);
		
		super.update(elapsed);
	}
	
}