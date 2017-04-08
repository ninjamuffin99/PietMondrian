package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var _player:Player;
	public var ground:FlxSprite;
	private var museumRoof:FlxSprite;
	private var bg:FlxSprite;
	
	override public function create():Void
	{
		bg = new FlxSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.width);
		bg.scrollFactor.x = bg.scrollFactor.y = 0;
		
		FlxG.worldBounds.set(0, 0, 4000, 480);
		
		FlxG.sound.playMusic("assets/music/717073_A2-01.mp3", 0.1, true);
		
		_player = new Player(40, 400);
		
		ground = new FlxSprite(0, FlxG.height - 20);
		ground.makeGraphic(2000, 15, FlxColor.BLACK);
		ground.immovable = true;
		
		museumRoof = new FlxSprite(1150, FlxG.height - 200);
		museumRoof.makeGraphic(1000, 20, FlxColor.BLACK);
		
		
		add(bg);
		add(museumRoof);
		add(_player);
		add(ground);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		FlxG.collide(ground, _player);
		
		if (_player.x <= 5)
		{
			_player.x = 6;
		}
		
		super.update(elapsed);
	}
}