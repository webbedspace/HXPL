package haxepunk.tweens.misc;

import haxepunk.Tween;
import haxepunk.utils.Color;
import haxepunk.utils.Ease.EaseFunction;

/**
 * Tweens a color's red, green, and blue properties
 * independently. Can also tween an alpha value.
 */
class ColorTween extends Tween
{
	/**
	 * The current color.
	 */
	public var color:Color;

	/**
	 * The current alpha.
	 */
	public var alpha:Float = 1;

	/**
	 * Red value of the current color, from 0 to 255.
	 */
	public var red(default, null):Int;

	/**
	 * Green value of the current color, from 0 to 255.
	 */
	public var green(default, null):Int;

	/**
	 * Blue value of the current color, from 0 to 255.
	 */
	public var blue(default, null):Int;

	/**
	 * Constructor.
	 * @param	complete	Optional completion callback.
	 * @param	type		Tween type.
	 */
	public function new(?type:TweenType)
	{
		super(0, type);
	}

	/**
	 * Tweens the color to a new color and an alpha to a new alpha.
	 * @param	duration		Duration of the tween.
	 * @param	fromColor		Start color.
	 * @param	toColor			End color.
	 * @param	fromAlpha		Start alpha
	 * @param	toAlpha			End alpha.
	 * @param	ease			Optional easer function.
	 */
	public function tween(duration:Float, fromColor:Color, toColor:Color, fromAlpha:Float = 1, toAlpha:Float = 1, ?ease:EaseFunction)
	{
		fromColor &= 0xFFFFFF;
		toColor &= 0xFFFFFF;
		color = fromColor;
		red = fromColor >> 16 & 0xFF;
		green = fromColor >> 8 & 0xFF;
		blue = fromColor & 0xFF;
		_startR = red / 255;
		_startG = green / 255;
		_startB = blue / 255;
		_rangeR = ((toColor >> 16 & 0xFF) / 255) - _startR;
		_rangeG = ((toColor >> 8 & 0xFF) / 255) - _startG;
		_rangeB = ((toColor & 0xFF) / 255) - _startB;
		_startA = alpha = fromAlpha;
		_rangeA = toAlpha - alpha;
		_target = duration;
		_ease = ease;
		start();
	}

	/** @private Updates the Tween. */
	override function updateInternal()
	{
		alpha = _startA + _rangeA * _t;
		red = Std.int((_startR + _rangeR * _t) * 255);
		green = Std.int((_startG + _rangeG * _t) * 255);
		blue = Std.int((_startB + _rangeB * _t) * 255);
		color = red << 16 | green << 8 | blue;
	}

	// Color information.
	var _startA:Float;
	var _startR:Float;
	var _startG:Float;
	var _startB:Float;
	var _rangeA:Float;
	var _rangeR:Float;
	var _rangeG:Float;
	var _rangeB:Float;
}
