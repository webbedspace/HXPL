package haxepunk.math;


/**
 * Various randomness-related utility functions.
 * @since	4.0.0
 */
class Random
{
	/**
	 * The random seed used by HXP's random functions.
	 */
	public static var randomSeed(get, set):Int;
	static inline function get_randomSeed() return _seed;
	static inline function set_randomSeed(value:Int):Int
	{
		_seed = Std.int(MathUtil.clamp(value, 1.0, MathUtil.INT_MAX_VALUE - 1));
		return _seed;
	}

	/**
	 * Randomizes the random seed using Math.random() function.
	 */
	public static inline function randomizeSeed()
	{
		randomSeed = Std.int(MathUtil.INT_MAX_VALUE * Math.random());
	}

	/**
	 * A pseudo-random Float produced using HXP's random seed, where 0 <= Float < 1.
	 */
	public static var random(get, null):Float;
	static inline function get_random():Float
	{
		_seed = Std.int((_seed * 16807.0) % MathUtil.INT_MAX_VALUE);
		return _seed / MathUtil.INT_MAX_VALUE;
	}

	/**
	 * Returns a pseudo-random Int.
	 * @param	amount		The returned Int will always be 0 <= Int < amount.
	 * @return	The Int.
	 */
	public static inline function randInt(amount:Int):Int
	{
		return Std.int(random * amount);
	}

	// Returns a pseudo-random value, by Leon
	public static function choose<T>(vals:Array<T>):T
	{
		var s = Std.int(random * vals.length);
		return vals[s < vals.length ? s : 0];
	}

	// In-place shuffle
	public static function shuffle<T>(arr:Array<T>):Array<T>
	{
		for (i in 0...arr.length) {
			var j = randInt(arr.length - 1);
			var a = arr[i];
			var b = arr[j];
			arr[i] = b;
			arr[j] = a;
		}
		return arr;
	}

	// Pseudo-random number generation (the seed is set in Engine's contructor).
	static var _seed:Int = 0;
}
