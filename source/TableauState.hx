package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxSpriteAniRot;
import flixel.addons.text.FlxTypeText;
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
	private var _black2:FlxSprite;
	private var _yellow:FlxSprite;
	private var _blue:FlxSprite;
	private var _red:FlxSprite;
	
	private var _ground:FlxSprite;
	private var _horizLine2:FlxSprite;
	private var _horizLine3:FlxSprite;
	private var _horizLine3Through:FlxSprite;
	private var _horizLine4:FlxSprite;
	private var _groundBottom:FlxSprite;
	
	private var _groundInvisible:FlxSprite;
	
	
	private var _vertLine1:FlxSprite;
	private var _vertLineLeft:FlxSprite;
	private var _vertLine3:FlxSprite;
	
	private var _vertLine4:FlxSprite;

	private var _firstParagraph:FlxTypeText;
	private var _wordStarted:Bool = false;
	private var _wordStarted2:Bool = false;
	
	private var _secondParagraph:FlxTypeText;
	
	
	private var _vignette:FlxSprite;
	

	override public function create():Void 
	{
		
		
		bg = new FlxSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.height * 3);
		add(bg);
		
		_black = new FlxSprite(0, 0);
		_black.makeGraphic(Std.int(FlxG.width * 0.3), Std.int(FlxG.height * 0.2), FlxColor.BLACK);
		add(_black);
		
		_yellow = new FlxSprite(0, FlxG.height * 1.5);
		_yellow.makeGraphic(Std.int(FlxG.width * 0.1), FlxG.height * 2, FlxColor.YELLOW);
		add(_yellow);
		
		_black2 = new FlxSprite(0, FlxG.height * 1.5);
		_black2.makeGraphic(Std.int(FlxG.width * 0.1), Std.int(FlxG.height * 0.2), FlxColor.BLACK);
		add(_black2);
		
		_blue = new FlxSprite(FlxG.width * 0.8, FlxG.height * 2);
		_blue.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLUE);
		add(_blue);
		
		_red = new FlxSprite(FlxG.width * 0.3, 0);
		_red.makeGraphic(FlxG.width, Std.int(FlxG.width * 0.7), FlxColor.RED);
		add(_red);
		
		makeLine();
		
		
		_player = new Player(FlxG.width * 0.01, FlxG.height * 0.1);
		add(_player);
		
		_firstParagraph = new FlxTypeText(FlxG.width * 0.35, FlxG.height * 0.4, Std.int(FlxG.width * 0.65), "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porttitor sem in sapien tempor, faucibus molestie eros viverra. Nullam commodo lacinia ex, in interdum orci dignissim sit amet. Nullam ultrices varius enim, quis auctor neque tempor nec. Aenean dignissim massa eget quam cursus cursus. Vestibulum sit amet molestie erat. Phasellus rutrum nulla non consequat semper. Aenean nec elit sapien.", 20);
		_firstParagraph.font = "assets/data/Nexa Light.otf";
		_firstParagraph.color = FlxColor.BLACK;
		add(_firstParagraph);
		
		_secondParagraph = new FlxTypeText(FlxG.width * 0.35, Std.int(FlxG.height * 1.55), Std.int(FlxG.width * 0.61), "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porttitor sem in sapien tempor, faucibus molestie eros viverra. Nullam commodo lacinia ex, in interdum orci dignissim sit amet. Nullam ultrices varius enim, quis auctor neque tempor nec. Aenean dignissim massa eget quam cursus cursus. Vestibulum sit amet molestie erat. Phasellus rutrum nulla non consequat semper. Aenean nec elit sapien.", 20);
		_secondParagraph.font = "assets/data/Nexa Light.otf";
		_secondParagraph.color = FlxColor.BLACK;
		add(_secondParagraph);
		
		
		FlxG.camera.follow(_player, PLATFORMER);
		FlxG.camera.setScrollBoundsRect(0, 0, FlxG.width, FlxG.height * 2.5);
		FlxG.worldBounds.set(0, 0, FlxG.width, FlxG.height * 2.5);
		
		_vignette = new FlxSprite(0, 0);
		_vignette.loadGraphic("assets/images/vignetteresized.png", false, 640, 480);
		_vignette.scrollFactor.x = _vignette.scrollFactor.y = 0;
		_vignette.alpha = 0.25;
		add(_vignette);
		
		_groundInvisible = new FlxSprite(0, Std.int(FlxG.height * 2.48));
		_groundInvisible.makeGraphic(FlxG.width, 1);
		_groundInvisible.immovable = true;
		_groundInvisible.alpha = 0;
		add(_groundInvisible);
		
		super.create();
	}
	
	private function makeLine():Void
	{
		var lineThickness:Int = Std.int(FlxG.height * 0.025);
		
		_ground = new FlxSprite(0, FlxG.height * 0.2);
		_ground.makeGraphic(Std.int(FlxG.width * 0.3), 10, FlxColor.BLACK);
		_ground.immovable = true;
		add(_ground);
		
		_horizLine2 = new FlxSprite(FlxG.width * 0.3, FlxG.width * 0.7);
		_horizLine2.makeGraphic(FlxG.width, lineThickness, FlxColor.BLACK);
		_horizLine2.immovable = true;
		add(_horizLine2);
		
		_horizLine3 = new FlxSprite(0, FlxG.height * 1.5);
		_horizLine3.makeGraphic(Std.int(FlxG.width * 0.3), lineThickness, FlxColor.BLACK);
		_horizLine3.immovable = true;
		add(_horizLine3);
		
		_horizLine3Through = new FlxSprite(FlxG.width * 0.3, FlxG.height * 1.5);
		_horizLine3Through.makeGraphic(Std.int(FlxG.width * 0.65), lineThickness, FlxColor.BLACK);
		add(_horizLine3Through);
		
		_horizLine4 = new FlxSprite(FlxG.width * 0.3, FlxG.height * 2);
		_horizLine4.makeGraphic(FlxG.width, lineThickness, FlxColor.BLACK);
		_horizLine4.immovable = true;
		add(_horizLine4);
		
		_groundBottom = new FlxSprite(FlxG.width * 0.3, Std.int(FlxG.height * 2.475));
		_groundBottom.makeGraphic(FlxG.width, lineThickness, FlxColor.BLACK);
		_groundBottom.immovable = true;
		add(_groundBottom);
		
		_vertLine1 = new FlxSprite(FlxG.width * 0.3, 0);
		_vertLine1.makeGraphic(lineThickness, Std.int(FlxG.height * 2.5), FlxColor.BLACK);
		add(_vertLine1);
		
		_vertLineLeft = new FlxSprite(FlxG.width * 0.1, FlxG.height * 1.5);
		_vertLineLeft.makeGraphic(lineThickness, FlxG.height * 2, FlxColor.BLACK);
		add(_vertLineLeft);
		
		_vertLine3 = new FlxSprite(FlxG.width * 0.8, FlxG.height * 2);
		_vertLine3.makeGraphic(lineThickness, FlxG.height, FlxColor.BLACK);
		add(_vertLine3);
		
		_vertLine4 = new FlxSprite(FlxG.width * 0.95, FlxG.width * 0.7);
		_vertLine4.makeGraphic(lineThickness, Std.int(FlxG.height * 1.08), FlxColor.BLACK);
		_vertLine4.immovable = true;
		add(_vertLine4);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.collide(_ground, _player);
		FlxG.collide(_groundBottom, _player);
		FlxG.collide(_player, _horizLine2);
		FlxG.collide(_player, _horizLine3);
		FlxG.collide(_player, _horizLine4);
		FlxG.collide(_player, _groundInvisible);
		FlxG.collide(_player, _vertLine4);
		
		if (FlxG.overlap(_player, _red) && !_wordStarted)
		{
			_firstParagraph.start(0.03);
			_wordStarted = true;
		}
		if (FlxG.overlap(_player, _horizLine3Through) && !_wordStarted2)
		{
			_secondParagraph.start(0.03);
			_wordStarted2 = true;
			
		}
		
		super.update(elapsed);
	}
	
}