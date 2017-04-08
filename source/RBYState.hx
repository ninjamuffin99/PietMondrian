package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.text.FlxTypeText;
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
	private var _vertLineRight:FlxSprite;
	
	private var _red:FlxSprite;
	private var _blue:FlxSprite;
	
	private var _player:Player;
	
	private var _secondParagraph:FlxTypeText;
	
	override public function create():Void 
	{
		
		
		bg = new FlxSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.height);
		add(bg);
		
		makeArt();
		
		_secondParagraph = new FlxTypeText(FlxG.width * 0.25, FlxG.height * 0.1, Std.int(FlxG.width * 0.7), "He was a part of the De Stijil art movement, also known as neoplasticism,  which was a minimalist art movement that advocated black lines on white, with primary colors.", 20);
		_secondParagraph.font = "assets/data/Nexa Light.otf";
		_secondParagraph.color = FlxColor.BLACK;
		_secondParagraph.setTypingVariation(0.25);
		add(_secondParagraph);
		
		_player = new Player(10, 10);
		add(_player);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.collide(_player, _horizLineLeft);
		FlxG.collide(_player, _horizLineLong);
		
		if (FlxG.overlap(_player, _vertLineLeft))
		{
			_secondParagraph.start(0.045);
		}
		
		super.update(elapsed);
	}
	
	private function makeArt():Void
	{
		var vertLineX:Int = Std.int(FlxG.width * 0.2);
		
		_red = new FlxSprite(vertLineX);
		_red.makeGraphic(FlxG.width, Std.int(FlxG.height * 0.7), FlxColor.RED);
		add(_red);
		
		_blue = new FlxSprite(0, FlxG.height * 0.7);
		_blue.makeGraphic(vertLineX, FlxG.height, FlxColor.BLUE);
		add(_blue);
		
		_horizLineLong = new FlxSprite(0, FlxG.height * 0.7);
		_horizLineLong.makeGraphic(FlxG.width, 15, FlxColor.BLACK);
		_horizLineLong.immovable = true;
		add(_horizLineLong);
		
		_horizLineLeft = new FlxSprite(0, FlxG.height * 0.3);
		_horizLineLeft.makeGraphic(vertLineX, 25, FlxColor.BLACK);
		_horizLineLeft.immovable = true;
		add(_horizLineLeft);
		
		_vertLineLeft = new FlxSprite(vertLineX, 0);
		_vertLineLeft.makeGraphic(15, FlxG.height, FlxColor.BLACK);
		add(_vertLineLeft);
		
		_vertLineRight = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.7);
		_vertLineRight.makeGraphic(18, FlxG.height, FlxColor.BLACK);
		add(_vertLineRight);
	}
}