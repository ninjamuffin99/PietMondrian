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
	private var _horizLinePassThrough:FlxSprite;
	private var _horizLineRight:FlxSprite;
	private var _vertLineLeft:FlxSprite;
	private var _vertLineRight:FlxSprite;
	
	private var _ground:FlxSprite;
	
	private var _red:FlxSprite;
	private var _blue:FlxSprite;
	private var _yellow:FlxSprite;
	
	private var _player:Player;
	
	private var _secondParagraph:FlxTypeText;
	private var _thirdParagraph:FlxTypeText;
	
	private var begun:Bool = false;
	
	override public function create():Void 
	{
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		
		bg = new FlxSprite(0, 0);
		bg.makeGraphic(FlxG.width, FlxG.height);
		add(bg);
		
		makeArt();
		
		_secondParagraph = new FlxTypeText(FlxG.width * 0.25, FlxG.height * 0.1, Std.int(FlxG.width * 0.7), "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras porttitor sem in sapien tempor, faucibus molestie eros viverra. Nullam commodo lacinia ex, in interdum orci dignissim sit amet. Nullam ultrices varius enim, quis auctor neque tempor nec. Aenean dignissim massa eget quam cursus cursus. Vestibulum sit amet molestie erat. Phasellus rutrum nulla non consequat semper. Aenean nec elit sapien.", 20);
		_secondParagraph.font = "assets/data/Nexa Light.otf";
		_secondParagraph.color = FlxColor.BLACK;
		_secondParagraph.setTypingVariation(0.25);
		add(_secondParagraph);
		
		_thirdParagraph = new FlxTypeText(FlxG.width * 0.25, FlxG.height * 0.1, Std.int(FlxG.width * 0.7), "", 20);
		_thirdParagraph.font = "assets/data/nexa Light.otf";
		_thirdParagraph.color = FlxColor.BLACK;
		_thirdParagraph.setTypingVariation(0.25);
		//add(_thirdParagraph);
		
		_player = new Player(10, 10);
		add(_player);
		
		_ground = new FlxSprite(0, 479);
		_ground.alpha = 0;
		_ground.makeGraphic(FlxG.width, 1);
		_ground.immovable = true;
		add(_ground);
		
		var vignette:FlxSprite;
		vignette = new FlxSprite(0, 0);
		vignette.loadGraphic("assets/images/vignetteresized.png", false, 640, 480);
		vignette.alpha = 0.25;
		add(vignette);
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.collide(_player, _horizLineLeft);
		FlxG.collide(_player, _horizLineLong);
		FlxG.collide(_player, _ground);
		
		if (!begun && FlxG.overlap(_player, _vertLineLeft))
		{
			_secondParagraph.start(0.033);
			begun = true;
		}
		
		if (_player.x <= 5)
		{
			_player.x = 6;
		}
		
		if (_player.x >= FlxG.width - 20)
		{
			_player.x = FlxG.width - 21;
		}
		
		if (FlxG.overlap(_player, _yellow))
		{
			FlxG.camera.fade(FlxColor.BLACK, 0.75, false, finishFade);
		}
		
		super.update(elapsed);
	}
	
	private function finishFade():Void
	{
		FlxG.switchState(new PlayState());
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
		
		_yellow = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.85);
		_yellow.makeGraphic(FlxG.width, FlxG.height, FlxColor.YELLOW);
		add(_yellow);
		
		_horizLineLong = new FlxSprite(vertLineX, FlxG.height * 0.7);
		_horizLineLong.makeGraphic(FlxG.width, 15, FlxColor.BLACK);
		_horizLineLong.immovable = true;
		add(_horizLineLong);
		
		_horizLinePassThrough = new FlxSprite(0, FlxG.height * 0.7);
		_horizLinePassThrough.makeGraphic(FlxG.width, 15, FlxColor.BLACK);
		add(_horizLinePassThrough);
		
		_horizLineLeft = new FlxSprite(0, FlxG.height * 0.3);
		_horizLineLeft.makeGraphic(vertLineX, 25, FlxColor.BLACK);
		_horizLineLeft.immovable = true;
		add(_horizLineLeft);
		
		_horizLineRight = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.85);
		_horizLineRight.makeGraphic(FlxG.width, 20, FlxColor.BLACK);
		add(_horizLineRight);
		
		_vertLineLeft = new FlxSprite(vertLineX, 0);
		_vertLineLeft.makeGraphic(15, FlxG.height, FlxColor.BLACK);
		add(_vertLineLeft);
		
		_vertLineRight = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.7);
		_vertLineRight.makeGraphic(18, FlxG.height, FlxColor.BLACK);
		add(_vertLineRight);
	}
}