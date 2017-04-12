package;

import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class Player extends FlxSprite 
{
	public var speed:Int = 200;
	public static var X:Int = 40;
	public static var Y:Int = 400;
	private var jumping:Bool = false;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		
		makeGraphic(20, 40, FlxColor.BLACK);
		drag.x = drag.y = 1600;
		
		acceleration.y = 800;
		FlxG.camera.follow(this, FlxCameraFollowStyle.SCREEN_BY_SCREEN);
	}
	
	override public function update(elapsed:Float):Void 
	{
		movement();
		super.update(elapsed);
	}
	
	private function movement():Void
	{
		var _up:Bool = false;
		var _down:Bool = false;
		var _left:Bool = false;
		var _right:Bool = false;
		var _run:Bool = false;
		
		_left = FlxG.keys.anyPressed([LEFT, A]);
		_right = FlxG.keys.anyPressed([RIGHT, D]);
		_up = FlxG.keys.anyJustPressed([SPACE, W, UP]);
		_run = FlxG.keys.anyPressed([SHIFT, Z]);
		
		if (_right && _left)
			_right = _left = false;
		
		if (_right)
		{
			if (_run)
				speed = 330;
			else
				speed = 200;
			velocity.x = speed;
		}
		if (_left)
		{
			if (_run)
				speed = 330;
			else
				speed = 200;
			velocity.x = -speed;
		}
		
		if (FlxG.keys.pressed.R)
		{
			FlxG.resetGame();
		}
		
		if (_up && !jumping)
		{
			FlxG.log.add(jumping);
			velocity.y -= 250;
			jumping = true;
		}
		if (this.isTouching(FlxObject.FLOOR))
		{
			jumping = false;
		}
	}
}