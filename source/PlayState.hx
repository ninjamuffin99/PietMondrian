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
	private var _title:FlxTypeText;
	private var _firstParagraph:FlxTypeText;
	
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
		
		compInRYBText = new FlxTypeText(compInRYB.x - 65, compInRYB.y - 20, FlxG.width, "Composition II in Red Blue and Yellow", 16);
		compInRYBText.color = FlxColor.BLACK;
		compInRYBText.font = "assets/data/NEXA BOLD.OTF";
		compInRYBText.setTypingVariation(0.1);
		
		_title = new FlxTypeText(FlxG.width / 10, 110, Std.int(FlxG.width * 0.6), "Piet Mondrian", 80);
		_title.font = "assets/data/NEXA BOLD.OTF";
		_title.color = FlxColor.BLACK;
		_title.setTypingVariation(0.1);
		_title.start(0.2);
		
		_firstParagraph = new FlxTypeText(670, 110, Std.int(FlxG.width * 0.8), "A dutch artist from Amersfoot, Netherlands. Born March 7th 1872 and died Febuary 1st 1944 in Manhattan, New York, where he lived for the last four years of his life.", 20);
		_firstParagraph.font = "assets/data/Nexa Light.otf";
		_firstParagraph.color = FlxColor.BLACK;
		_firstParagraph.setTypingVariation(0.1);
		
		
		add(bg);
		add(compInRYB);
		add(compInRYBText);
		add(museumRoof);
		add(_player);
		add(ground);
		add(_title);
		add(_firstParagraph);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		FlxG.collide(ground, _player);
		
		if (_player.x >= 680)
		{
			_firstParagraph.start(0.045);
		}
		
		if (_player.x <= 5)
		{
			_player.x = 6;
		}
		
		if (FlxG.overlap(_player, compInRYB))
		{
			compInRYBText.start(0.05);
			if (FlxG.keys.anyJustPressed([UP, W, SPACE]))
			{
				FlxG.switchState(new RBYState());
			}
		}
		else
		{
			compInRYBText.erase(0.05);
		}
		super.update(elapsed);
	}
}