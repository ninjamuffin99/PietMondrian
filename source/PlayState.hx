package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.text.FlxTypeText;
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
	
	private var compInRYBText:FlxTypeText;
	
	private var compInRYB:FlxSprite;
	
	override public function create():Void
	{
		bg = new FlxSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.width);
		bg.scrollFactor.x = bg.scrollFactor.y = 0;
		
		FlxG.worldBounds.set(0, 0, 4000, 480);
		
		FlxG.sound.playMusic("assets/music/A2-01.mp3", 0.2, true);
		
		_player = new Player(40, 400);
		
		ground = new FlxSprite(0, FlxG.height - 20);
		ground.makeGraphic(2000, 15, FlxColor.BLACK);
		ground.immovable = true;
		
		museumRoof = new FlxSprite(1150, FlxG.height - 200);
		museumRoof.makeGraphic(1000, 20, FlxColor.BLACK);
		
		compInRYB = new FlxSprite(1560, FlxG.height - 120);
		compInRYB.loadGraphic("assets/images/CompWithRBY.png", false, 64, 64);
		
		compInRYBText = new FlxTypeText(compInRYB.x - 65, compInRYB.y - 20, FlxG.width, "Composition in Red Blue and Yellow", 16);
		compInRYBText.color = FlxColor.BLACK;
		compInRYBText.font = "assets/data/NEXA BOLD.OTF";
		compInRYBText.setTypingVariation(0.1);
		
		add(bg);
		add(compInRYB);
		add(compInRYBText);
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
		
		if (FlxG.overlap(_player, compInRYB))
		{
			FlxG.log.add("overlapping");
			compInRYBText.start(0.07);
		}
		else
		{
			compInRYBText.erase(0.05);
		}
		super.update(elapsed);
	}
}