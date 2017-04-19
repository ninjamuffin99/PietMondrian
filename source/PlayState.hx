package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.text.FlxTypeText;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import openfl.display.BlendMode;

class PlayState extends FlxState
{
	private var _player:Player;
	public var ground:FlxSprite;
	private var museumRoof:FlxSprite;
	private var bg:FlxSprite;
	
	private var compInRYBText:FlxTypeText;
	private var compInBRBYGText:FlxTypeText;
	private var tableau1Text:FlxTypeText;
	
	private var _title:FlxTypeText;
	private var _firstParagraph:FlxTypeText;
	private var _secondParagraph:FlxTypeText;
	private var _thirdParagraph:FlxTypeText;
	private var _fourthParagraph:FlxTypeText;
	
	private var listOfWorks:FlxText;
	private var listOfWorks2:FlxText;
	
	private var compInRYB:FlxSprite;
	private var compBRBYG:FlxSprite;
	private var tableau1:FlxSprite;
	private var compWhiteRed:FlxSprite;
	private var CompA:FlxSprite;
	
	private var _canvas:FlxSprite;
	private var _vignette:FlxSprite;
	
	override public function create():Void
	{
		bg = new FlxSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.width);
		bg.scrollFactor.x = bg.scrollFactor.y = 0;
		
		FlxG.worldBounds.set(0, 0, FlxG.width * 10, 480);
		
		FlxG.sound.playMusic("assets/music/A2-01.mp3", 0.2, true);
		
		_player = new Player(Player.X, Player.Y);
		
		ground = new FlxSprite(0, FlxG.height - 20);
		ground.makeGraphic(FlxG.width * 10, 15, FlxColor.BLACK);
		ground.immovable = true;
		
		museumRoof = new FlxSprite(1150, FlxG.height - 200);
		museumRoof.makeGraphic(FlxG.width * 10, 20, FlxColor.BLACK);
		
		compInRYB = new FlxSprite(FlxG.width * 2.8, FlxG.height - 120);
		compInRYB.loadGraphic("assets/images/CompWithRBY.png", false, 64, 64);
		
		compBRBYG = new FlxSprite(FlxG.width * 3.8, FlxG.height - 120);
		compBRBYG.loadGraphic("assets/images/compBRBYG.png", false, 64, 64);
		
		tableau1 = new FlxSprite(FlxG.width * 4.8, FlxG.height - 150);
		tableau1.loadGraphic("assets/images/Tableau1.png", false, 66, 102);
		
		compWhiteRed = new FlxSprite(FlxG.width * 5.8, FlxG.height - 105);
		compWhiteRed.loadGraphic("assets/images/compwhitesmall.png", false, 64, 48);
		
		CompA = new FlxSprite(FlxG.width * 6.8, FlxG.height - 120);
		CompA.loadGraphic("assets/images/CompAPixel.png", false, 66, 66);
		
		
		createWords();
		
		
		_vignette = new FlxSprite();
		_vignette.loadGraphic("assets/images/vignetteresized.png", false, 640, 480);
		_vignette.scrollFactor.x = 0;
		_vignette.alpha = 0.25;
		
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		
		add(bg);
		add(compInRYB);
		add(compBRBYG);
		add(tableau1);
		add(CompA);
		add(compWhiteRed);
		
		add(compInRYBText);
		add(compInBRBYGText);
		add(tableau1Text);
		
		add(museumRoof);
		add(_player);
		add(ground);
		
		add(_title);
		add(_firstParagraph);
		add(_secondParagraph);
		add(_thirdParagraph);
		add(_fourthParagraph);
		
		add(listOfWorks);
		add(listOfWorks2);
		add(_vignette);
		
		
		if (TextBegun._secondParagraphBegun)
		{
			_secondParagraph.start(0.03);
			FlxG.log.add("Text Began");
			_secondParagraph.skip();
		}
		if (TextBegun._thirdParagraphBegun)
		{
			_thirdParagraph.start(0.1);
			_thirdParagraph.skip();
		}
		
		super.create();
	}
	
	private function createWords():Void
	{
		var ArtFont:String = "assets/data/NEXA BOLD.OTF";
		
		compInRYBText = new FlxTypeText(compInRYB.x - 300, compInRYB.y + 20, Std.int(FlxG.width * 0.5), "Composition II in Red Blue and Yellow, 1930", 16);
		compInRYBText.color = FlxColor.BLACK;
		compInRYBText.font = ArtFont;
		compInRYBText.setTypingVariation(0.1);
		
		compInBRBYGText = new FlxTypeText(compBRBYG.x - 300, compBRBYG.y + 20, Std.int(FlxG.width * 0.5), "Composition with Large Red Plane, Yellow, Black, Gray and Blue (1921)", 16);
		compInBRBYGText.color = FlxColor.BLACK;
		compInBRBYGText.font = ArtFont;
		compInBRBYGText.setTypingVariation(0.1);
		
		tableau1Text = new FlxTypeText(tableau1.x - 130, tableau1.y + 20, Std.int(FlxG.width * 0.4), "Tableau I, 1921", 16);
		tableau1Text.color = FlxColor.BLACK;
		tableau1Text.font = ArtFont;
		tableau1Text.setTypingVariation(0.1);
		
		_title = new FlxTypeText(FlxG.width / 10, 110, Std.int(FlxG.width * 0.6), "Piet Mondrian", 80);
		_title.font = "assets/data/NEXA BOLD.OTF";
		_title.color = FlxColor.BLACK;
		_title.setTypingVariation(0.1);
		_title.start(0.15);
		
		var paragraphY:Int = Std.int(FlxG.height * 0.15);
		var paragraphWidth:Int = Std.int(FlxG.width * 0.8);
		var paragraphFont:String = "assets/data/Nexa Light.otf";
		
		_firstParagraph = new FlxTypeText(FlxG.width * 1.1, paragraphY, paragraphWidth, "A dutch artist from Amersfoot, Netherlands. Born March 7th 1872 and died Febuary 1st 1944 in Manhattan, New York, where he lived for the last four years of his life.", 20);
		_firstParagraph.font = paragraphFont;
		_firstParagraph.color = FlxColor.BLACK;
		_firstParagraph.setTypingVariation(0.1);
		
		_secondParagraph = new FlxTypeText(FlxG.width * 2.1, paragraphY, paragraphWidth, "He was a part of the De Stijil art movement, also known as neoplasticism,  which was a minimalist art movement that advocated black lines on white, with primary colors. ", 20);
		_secondParagraph.font = paragraphFont;
		_secondParagraph.color = FlxColor.BLACK;
		_secondParagraph.setTypingVariation(0.1);
		
		_thirdParagraph = new FlxTypeText(FlxG.width * 3.1, paragraphY, paragraphWidth, "In 1892 Mondrian began his career teaching primary education, but still practiced painting. At this point in time he’d only do impressionistic landscapes.", 20);
		_thirdParagraph.font = paragraphFont;
		_thirdParagraph.color = FlxColor.BLACK;
		_thirdParagraph.setTypingVariation(0.1);
		
		_fourthParagraph = new FlxTypeText(FlxG.width * 4.1, paragraphY, paragraphWidth, "It wasn’t until 1911 when Mondrian’s art became more abstract, when he moved to Paris, France and and became influenced by the cubist styles and works of Picasso and Braque.", 20);
		_fourthParagraph.font = paragraphFont;
		_fourthParagraph.color = FlxColor.BLACK;
		_fourthParagraph.setTypingVariation(0.1);
		
		
		listOfWorks = new FlxText(FlxG.width * 7.05, FlxG.height * 0.05, FlxG.width * 0.9, "List of Signifigant works \n \n Windmill In Sunlight (1908) \n \n Grey Tree (1911) \n \n Composition XIV Composition with Color Planes 5 (1917) \n \n Composition with Grey and Light Brown (1918) \n \n Composition with Large Red Plane, Yellow, Black, Gray and Blue (1921) \n \n ", 19);
		listOfWorks.font = paragraphFont;
		listOfWorks.color = FlxColor.BLACK;
		
		listOfWorks2 = new FlxText(FlxG.width * 8.05, FlxG.height * 0.05, FlxG.width * 0.9, "Tableau I (1921) \n \n Composition A (1923) \n \n Composition with Red Blue and Yellow (1930) \n \n Composition in White, Black, and Red (1936) \n \n Composition with Red, Yellow and Blue (1942) \n \n Broadway Boogie Woogie (1943) \n \n Victory Boogie Woogie (1944)", 19);
		listOfWorks2.font = paragraphFont;
		listOfWorks2.color = FlxColor.BLACK;
	}

	override public function update(elapsed:Float):Void
	{
		FlxG.collide(ground, _player);
		
		if (_player.x >= FlxG.width)
		{
			_firstParagraph.start(0.03);
		}
		if (_player.x >= FlxG.width * 2 && !TextBegun._secondParagraphBegun)
		{
			_secondParagraph.start(0.03);
			TextBegun._secondParagraphBegun = true;
		}
		if (_player.x >= FlxG.width * 3 && !TextBegun._thirdParagraphBegun)
		{
			_thirdParagraph.start(0.03);
			TextBegun._thirdParagraphBegun = true;
		}
		if (_player.x >= FlxG.width * 4 && !TextBegun._fourthParagraphbegun)
		{
			_fourthParagraph.start(0.03);
			
			TextBegun._fourthParagraphbegun = true;
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
				Player.X = Std.int(_player.x);
				Player.Y = Std.int(_player.y);
				
				FlxG.camera.fade(FlxColor.BLACK, 0.5, false, fadeRYB);
			}
		}
		else
		{
			compInRYBText.erase(0.05);
		}
		
		if (FlxG.overlap(_player, compBRBYG))
		{
			compInBRBYGText.start(0.05);
			if (FlxG.keys.anyJustPressed([UP, W, SPACE]))
			{
				Player.X = Std.int(_player.x);
				Player.Y = Std.int(_player.y);
				
				FlxG.camera.fade(FlxColor.BLACK, 0.5, false, fadeBRB);
			}
		}
		else
		{
			compInBRBYGText.erase(0.05);
		}
		
		if (FlxG.overlap(_player, tableau1))
		{
			tableau1Text.start(0.05);
			if (FlxG.keys.anyJustPressed([UP, W, SPACE]))
			{
				Player.X = Std.int(_player.x);
				Player.Y = Std.int(_player.y);
				
				FlxG.camera.fade(FlxColor.BLACK, 0.5, false, fadeTab);
			}
		}
		else
			tableau1Text.erase(0.05);
		
		if (FlxG.overlap(_player, compWhiteRed))
		{
			if (FlxG.keys.anyJustPressed([UP, W, SPACE]))
			{
				Player.X = Std.int(_player.x);
				Player.Y = Std.int(_player.y);
				
				FlxG.camera.fade(FlxColor.BLACK, 0.5, false, fadeCompWhite);
			}
		}
		
		if (FlxG.overlap(_player, CompA))
		{
			if (FlxG.keys.anyJustPressed([UP, W, SPACE]))
			{
				Player.X = Std.int(_player.x);
				Player.Y = Std.int(_player.y);
				
				FlxG.camera.fade(FlxColor.BLACK, 0.5, false, fadeCompA);
			}
		}
		
		super.update(elapsed);
	}
	
	private function fadeRYB():Void
	{
		FlxG.switchState(new RBYState());
	}
	
	private function fadeBRB():Void
	{
		FlxG.switchState(new BRBYGState());
	}
	
	private function fadeTab():Void
	{
		FlxG.switchState(new TableauState());
	}
	
	private function fadeCompWhite():Void
	{
		FlxG.switchState(new CompWhiteRed());
	}
	
	private function fadeCompA():Void
	{
		FlxG.switchState(new CompAState());
	}
}