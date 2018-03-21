package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.text.FlxTypeText;
import flixel.group.FlxGroup.FlxTypedGroup;
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
	
	private var _title:FlxTypeText;
	private var _firstParagraph:FlxTypeText;
	private var _secondParagraph:FlxTypeText;
	private var _thirdParagraph:FlxTypeText;
	private var _fourthParagraph:FlxTypeText;
	private var _fifthParagraph:FlxTypeText;
	private var _sixthParagraph:FlxTypeText;
	
	private var listOfWorks:FlxText;
	private var listOfWorks2:FlxText;
	
	private var credits:FlxText;
	
	private var compWhiteRed:FlxSprite;
	private var CompA:FlxSprite;
	
	private var _canvas:FlxSprite;
	private var _vignette:FlxSprite;
	
	private var _grpArt:FlxTypedGroup<ArtSprite>;
	private var _grpParagraphs:FlxTypedGroup<FlxTypeText>;
	
	private var _paragraphArray:Array<String> =
	[
		"A dutch artist from Amersfoot, Netherlands. Born March 7th 1872 and died Febuary 1st 1944 in Manhattan, New York, where he lived for the last four years of his life.",
		"He was a part of the De Stijil art movement, also known as neoplasticism,  which was a minimalist art movement that advocated black lines on white, with primary colors. ",
		"In 1892 Mondrian began his career teaching primary education, but still practiced painting. At this point in time he’d only do impressionistic landscapes.",
		"It wasn’t until 1911 when Mondrian’s art became more abstract, when he moved to Paris, France and and became influenced by the cubist styles and works of Picasso and Braque.",
		"He moved back to The Netherlands in 1914, due to the fact that World War 1 had begun. He met Bart van der Leck and Theo van Doesburg at the Laren artist’s colony, where the three stayed. Mondrian, with Van der Leck, founded De Stijl.",
		"Mondrian left The Netherlands for London, but after only 2 years, he moved to Manhattan, New York. The black lines of his older works have now been replaced with colored ones, however the primary colored squares and rectangles stayed the same."
	];
	
	
	override public function create():Void
	{
		FlxG.mouse.visible = false;
		
		bg = new FlxSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.width);
		bg.scrollFactor.x = bg.scrollFactor.y = 0;
		
		FlxG.worldBounds.set(0, 0, FlxG.width * 10, 480);
		
		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic("assets/music/A2-01.mp3", 0.3, true);
		}
		
		_player = new Player(Player.X, Player.Y);
		
		_grpArt = new FlxTypedGroup<ArtSprite>();
		_grpParagraphs = new FlxTypedGroup<FlxTypeText>();
		
		
		ground = new FlxSprite(0, FlxG.height - 20);
		ground.makeGraphic(FlxG.width * 10, 15, FlxColor.BLACK);
		ground.immovable = true;
		
		museumRoof = new FlxSprite(1150, FlxG.height - 200);
		museumRoof.makeGraphic(FlxG.width * 10, 20, FlxColor.BLACK);
		
		var artHeight:Float = FlxG.height - 120;
		
		var compInRYB:ArtSprite = new ArtSprite(FlxG.width * 2.8, artHeight, "assets/images/CompWithRBY.png", "Composition II in Red Blue and Yellow, 1930");
		var compBRBYG:ArtSprite = new ArtSprite(FlxG.width * 3.8, artHeight, "assets/images/compBRBYG.png", "Composition with Large Red Plane, Yellow, Black, Gray and Blue (1921)");
		var tableau1:ArtSprite = new ArtSprite(FlxG.width * 4.8, artHeight, "assets/images/Tableau1.png", "Tableau I, 1921");
		var compWhiteRed:ArtSprite = new ArtSprite(FlxG.width * 5.8, artHeight, "assets/images/compwhitesmall.png", "Composition in Black White and Red, 1936");
		var CompA:ArtSprite = new ArtSprite(FlxG.width * 6.8, artHeight, "assets/images/CompAPixel.png", "Composition A, 1923");
		
		createWords();
		
		
		_vignette = new FlxSprite();
		_vignette.loadGraphic("assets/images/vignetteresized.png", false, 640, 480);
		_vignette.scrollFactor.x = 0;
		_vignette.alpha = 0.25;
		
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		
		add(bg);
		
		add(_grpArt);
		add(_grpParagraphs);
		
		_grpArt.add(compInRYB);
		_grpArt.add(compBRBYG);
		_grpArt.add(tableau1);
		_grpArt.add(compWhiteRed);
		_grpArt.add(CompA);
		
		add(museumRoof);
		add(_player);
		add(ground);
		
		add(_title);
		
		for (str in 0..._paragraphArray.length)
		{
			var _paragraph:FlxTypeText = new FlxTypeText(FlxG.width * (str + 0.1 + 1), Std.int(FlxG.height * 0.15), Std.int(FlxG.width * 0.8), _paragraphArray[str], 20);
			_paragraph.font = "assets/data/Nexa Light.otf";
			_paragraph.color = FlxColor.BLACK;
			_paragraph.setTypingVariation(0.1);
			_paragraph.start(0.02);
			_grpParagraphs.add(_paragraph);
		}
		/*
		add(_firstParagraph);
		add(_secondParagraph);
		add(_thirdParagraph);
		add(_fourthParagraph);
		add(_fifthParagraph);
		add(_sixthParagraph);
		*/
		add(listOfWorks);
		add(listOfWorks2);
		add(credits);
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
		var ArtFont:String = "";
		
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
		
		_fifthParagraph = new FlxTypeText(FlxG.width * 5.1, paragraphY, paragraphWidth, "He moved back to The Netherlands in 1914, due to the fact that World War 1 had begun. He met Bart van der Leck and Theo van Doesburg at the Laren artist’s colony, where the three stayed. Mondrian, with Van der Leck, founded De Stijl.", 20);
		_fifthParagraph.font = paragraphFont;
		_fifthParagraph.color = FlxColor.BLACK;
		_fifthParagraph.setTypingVariation(0.1);
		
		_sixthParagraph = new FlxTypeText(FlxG.width * 6.1, paragraphY, paragraphWidth, "Mondrian left The Netherlands for London, but after only 2 years, he moved to Manhattan, New York. The black lines of his older works have now been replaced with colored ones, however the primary colored squares and rectangles stayed the same.", 20);
		_sixthParagraph.font = paragraphFont;
		_sixthParagraph.color = FlxColor.BLACK;
		_sixthParagraph.setTypingVariation(0.1);
		
		
		listOfWorks = new FlxText(FlxG.width * 7.05, FlxG.height * 0.05, FlxG.width * 0.9, "List of Signifigant works \n \n Windmill In Sunlight (1908) \n \n Grey Tree (1911) \n \n Composition XIV Composition with Color Planes 5 (1917) \n \n Composition with Grey and Light Brown (1918) \n \n Composition with Large Red Plane, Yellow, Black, Gray and Blue (1921) \n \n ", 19);
		listOfWorks.font = paragraphFont;
		listOfWorks.color = FlxColor.BLACK;
		
		listOfWorks2 = new FlxText(FlxG.width * 8.05, FlxG.height * 0.05, FlxG.width * 0.9, "Tableau I (1921) \n \n Composition A (1923) \n \n Composition with Red Blue and Yellow (1930) \n \n Composition in White, Black, and Red (1936) \n \n Composition with Red, Yellow and Blue (1942) \n \n Broadway Boogie Woogie (1943) \n \n Victory Boogie Woogie (1944)", 19);
		listOfWorks2.font = paragraphFont;
		listOfWorks2.color = FlxColor.BLACK;
		
		credits = new FlxText(FlxG.width * 9.1, paragraphY, FlxG.width * 0.85, "Made by Cameron Taylor \n\n Song: A2-01 by DrFunkMonkey goo.gl/OIYGnV \n\n  (c) 2017 Mondrian/Holtzman Trust ", 20);
		credits.font = paragraphFont;
		credits.color = FlxColor.BLACK;
	}

	private function artChecks(a:ArtSprite):Void
	{
		if (FlxG.overlap(_player, a))
		{
			a.txtInfo.start(0.05);
		}
		else
		{
			a.txtInfo.erase(0.05);
		}
	}
	
	override public function update(elapsed:Float):Void
	{
		FlxG.collide(ground, _player);
		
		_grpArt.forEach(artChecks);
		
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
		
		if (_player.x >= FlxG.width * 5 && !TextBegun._fifthParagraphbegun)
		{
			_fifthParagraph.start(0.03);
			
			TextBegun._fifthParagraphbegun = true;
		}
		
		if (_player.x >= FlxG.width * 6 && !TextBegun._sixthParagraphbegun)
		{
			_sixthParagraph.start(0.03);
			
			TextBegun._sixthParagraphbegun = true;
		}
		
		
		
		if (_player.x <= 5)
		{
			_player.x = 6;
		}
		
		/* USE THIS FOR REFERENCE LATER
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
		*/
		
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