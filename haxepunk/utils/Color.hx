package haxepunk.utils;

import haxepunk.math.MathUtil;

/**
 * An abstract with various color utility functions.
 * @since	4.0.0
 **/
abstract Color(UInt) from UInt to UInt
{
	public static inline var Pink = 0xffc0cb;
	public static inline var LightPink = 0xffb6c1;
	public static inline var HotPink = 0xff69b4;
	public static inline var DeepPink = 0xff1493;
	public static inline var PaleVioletRed = 0xdb7093;
	public static inline var MediumVioletRed = 0xc71585;
	public static inline var LightSalmon = 0xffa07a;
	public static inline var Salmon = 0xfa8072;
	public static inline var DarkSalmon = 0xe9967a;
	public static inline var LightCoral = 0xf08080;
	public static inline var IndianRed = 0xcd5c5c;
	public static inline var Crimson = 0xdc143c;
	public static inline var FireBrick = 0xb22222;
	public static inline var DarkRed = 0x8b0000;
	public static inline var Red = 0xff0000;
	public static inline var OrangeRed = 0xff4500;
	public static inline var Tomato = 0xff6347;
	public static inline var Coral = 0xff7f50;
	public static inline var DarkOrange = 0xff8c00;
	public static inline var Orange = 0xffa500;
	public static inline var Gold = 0xffd700;
	public static inline var Yellow = 0xffff00;
	public static inline var LightYellow = 0xffffe0;
	public static inline var LemonChiffon = 0xfffacd;
	public static inline var LightGoldenrodYellow = 0xfafad2;
	public static inline var PapayaWhip = 0xffefd5;
	public static inline var Moccasin = 0xffe4b5;
	public static inline var PeachPuff = 0xffdab9;
	public static inline var PaleGoldenrod = 0xeee8aa;
	public static inline var Khaki = 0xf0e68c;
	public static inline var DarkKhaki = 0xbdb76b;
	public static inline var Cornsilk = 0xfff8dc;
	public static inline var BlanchedAlmond = 0xffebcd;
	public static inline var Bisque = 0xffe4c4;
	public static inline var NavajoWhite = 0xffdead;
	public static inline var Wheat = 0xf5deb3;
	public static inline var BurlyWood = 0xdeb887;
	public static inline var Tan = 0xd2b48c;
	public static inline var RosyBrown = 0xbc8f8f;
	public static inline var SandyBrown = 0xf4a460;
	public static inline var Goldenrod = 0xdaa520;
	public static inline var DarkGoldenrod = 0xb8860b;
	public static inline var Peru = 0xcd853f;
	public static inline var Chocolate = 0xd2691e;
	public static inline var SaddleBrown = 0x8b4513;
	public static inline var Sienna = 0xa0522d;
	public static inline var Brown = 0xa52a2a;
	public static inline var Maroon = 0x800000;
	public static inline var DarkOliveGreen = 0x556b2f;
	public static inline var Olive = 0x808000;
	public static inline var OliveDrab = 0x6b8e23;
	public static inline var YellowGreen = 0x9acd32;
	public static inline var LimeGreen = 0x32cd32;
	public static inline var Lime = 0x00ff00;
	public static inline var LawnGreen = 0x7cfc00;
	public static inline var Chartreuse = 0x7fff00;
	public static inline var GreenYellow = 0xadff2f;
	public static inline var SpringGreen = 0x00ff7f;
	public static inline var MediumSpringGreen = 0x00fa9a;
	public static inline var LightGreen = 0x90ee90;
	public static inline var PaleGreen = 0x98fb98;
	public static inline var DarkSeaGreen = 0x8fbc8f;
	public static inline var MediumSeaGreen = 0x3cb371;
	public static inline var SeaGreen = 0x2e8b57;
	public static inline var ForestGreen = 0x228b22;
	public static inline var Green = 0x008000;
	public static inline var DarkGreen = 0x006400;
	public static inline var MediumAquamarine = 0x66cdaa;
	public static inline var Aqua = 0x00ffff;
	public static inline var Cyan = 0x00ffff;
	public static inline var LightCyan = 0xe0ffff;
	public static inline var PaleTurquoise = 0xafeeee;
	public static inline var Aquamarine = 0x7fffd4;
	public static inline var Turquoise = 0x40e0d0;
	public static inline var MediumTurquoise = 0x48d1cc;
	public static inline var DarkTurquoise = 0x00ced1;
	public static inline var LightSeaGreen = 0x20b2aa;
	public static inline var CadetBlue = 0x5f9ea0;
	public static inline var DarkCyan = 0x008b8b;
	public static inline var Teal = 0x008080;
	public static inline var LightSteelBlue = 0xb0c4de;
	public static inline var PowderBlue = 0xb0e0e6;
	public static inline var LightBlue = 0xadd8e6;
	public static inline var SkyBlue = 0x87ceeb;
	public static inline var LightSkyBlue = 0x87cefa;
	public static inline var DeepSkyBlue = 0x00bfff;
	public static inline var DodgerBlue = 0x1e90ff;
	public static inline var CornflowerBlue = 0x6495ed;
	public static inline var SteelBlue = 0x4682b4;
	public static inline var RoyalBlue = 0x4169e1;
	public static inline var Blue = 0x0000ff;
	public static inline var MediumBlue = 0x0000cd;
	public static inline var DarkBlue = 0x00008b;
	public static inline var Navy = 0x000080;
	public static inline var MidnightBlue = 0x191970;
	public static inline var Lavender = 0xe6e6fa;
	public static inline var Thistle = 0xd8bfd8;
	public static inline var Plum = 0xdda0dd;
	public static inline var Violet = 0xee82ee;
	public static inline var Orchid = 0xda70d6;
	public static inline var Fuchsia = 0xff00ff;
	public static inline var Magenta = 0xff00ff;
	public static inline var MediumOrchid = 0xba55d3;
	public static inline var MediumPurple = 0x9370db;
	public static inline var BlueViolet = 0x8a2be2;
	public static inline var DarkViolet = 0x9400d3;
	public static inline var DarkOrchid = 0x9932cc;
	public static inline var DarkMagenta = 0x8b008b;
	public static inline var Purple = 0x800080;
	public static inline var Indigo = 0x4b0082;
	public static inline var DarkSlateBlue = 0x483d8b;
	public static inline var SlateBlue = 0x6a5acd;
	public static inline var MediumSlateBlue = 0x7b68ee;
	public static inline var White = 0xffffff;
	public static inline var Snow = 0xfffafa;
	public static inline var Honeydew = 0xf0fff0;
	public static inline var MintCream = 0xf5fffa;
	public static inline var Azure = 0xf0ffff;
	public static inline var AliceBlue = 0xf0f8ff;
	public static inline var GhostWhite = 0xf8f8ff;
	public static inline var WhiteSmoke = 0xf5f5f5;
	public static inline var Seashell = 0xfff5ee;
	public static inline var Beige = 0xf5f5dc;
	public static inline var OldLace = 0xfdf5e6;
	public static inline var FloralWhite = 0xfffaf0;
	public static inline var Ivory = 0xfffff0;
	public static inline var AntiqueWhite = 0xfaebd7;
	public static inline var Linen = 0xfaf0e6;
	public static inline var LavenderBlush = 0xfff0f5;
	public static inline var MistyRose = 0xffe4e1;
	public static inline var Gainsboro = 0xdcdcdc;
	public static inline var LightGray = 0xd3d3d3;
	public static inline var Silver = 0xc0c0c0;
	public static inline var DarkGrey = 0xa9a9a9;
	public static inline var Grey = 0x808080;
	public static inline var DimGrey = 0x696969;
	public static inline var LightSlateGrey = 0x778899;
	public static inline var SlateGrey = 0x708090;
	public static inline var DarkSlateGrey = 0x2f4f4f;
	public static inline var Black = 0x000000;

	/**
	 * Linear interpolation between two colors.
	 * @param	fromColor		First color.
	 * @param	toColor			Second color.
	 * @param	t				Interpolation value. Clamped to the range [0, 1].
	 * return	RGB component-interpolated color value.
	 */
	public static inline function colorLerp(fromColor:Color, toColor:Color, t:Float=1):Color
	{
		if (t <= 0)
		{
			return fromColor;
		}
		else if (t >= 1)
		{
			return toColor;
		}
		else
		{
			var a:Int = fromColor.a,
				r:Int = fromColor.r,
				g:Int = fromColor.g,
				b:Int = fromColor.b,
				dA:Int = toColor.a - a,
				dR:Int = toColor.r - r,
				dG:Int = toColor.g - g,
				dB:Int = toColor.b - b;
			a += Std.int(dA * t);
			r += Std.int(dR * t);
			g += Std.int(dG * t);
			b += Std.int(dB * t);
			return a << 24 | r << 16 | g << 8 | b;
		}
	}


	/**
	 * Creates a color value by combining the chosen RGB values.
	 * @param	R		The red value of the color, from 0 to 255.
	 * @param	G		The green value of the color, from 0 to 255.
	 * @param	B		The blue value of the color, from 0 to 255.
	 * @return	The color.
	 */
	public static inline function getColorRGB(r:Int=0, g:Int=0, b:Int=0):Color
	{
		return (r & 0xff) << 16 | (g & 0xff) << 8 | (b & 0xff);
	}

	public static inline function getColorRGBFloat(r:Float, g:Float, b:Float):Color
	{
		inline function intColor(v:Float):Color
		{
			var c = Std.int(v * 0x100);
			return MathUtil.iclamp(c, 0, 0xff);
		}
		return getColorRGB(intColor(r), intColor(g), intColor(b));
	}

	/**
	 * Creates a color value with the chosen HSV values.
	 * @param	h		The hue of the color (from 0 to 1).
	 * @param	s		The saturation of the color (from 0 to 1).
	 * @param	v		The value of the color (from 0 to 1).
	 * @return	The color Int.
	 */
	public static function getColorHSV(h:Float, s:Float, v:Float):Color
	{
		h = Std.int(h * 360);
		var hi:Int = Math.floor(h / 60) % 6,
			f:Float = h / 60 - Math.floor(h / 60),
			p:Float = (v * (1 - s)),
			q:Float = (v * (1 - f * s)),
			t:Float = (v * (1 - (1 - f) * s));
		switch (hi)
		{
			case 0: return Std.int(v * 255) << 16 | Std.int(t * 255) << 8 | Std.int(p * 255);
			case 1: return Std.int(q * 255) << 16 | Std.int(v * 255) << 8 | Std.int(p * 255);
			case 2: return Std.int(p * 255) << 16 | Std.int(v * 255) << 8 | Std.int(t * 255);
			case 3: return Std.int(p * 255) << 16 | Std.int(q * 255) << 8 | Std.int(v * 255);
			case 4: return Std.int(t * 255) << 16 | Std.int(p * 255) << 8 | Std.int(v * 255);
			case 5: return Std.int(v * 255) << 16 | Std.int(p * 255) << 8 | Std.int(q * 255);
			default: return 0;
		}
		return 0;
	}

	public var r(get, never):UInt;
	public var g(get, never):UInt;
	public var b(get, never):UInt;
	public var a(get, never):UInt;
	public var red(get, never):Float;
	public var green(get, never):Float;
	public var blue(get, never):Float;
	public var alpha(get, never):Float;

	inline function get_r():UInt return (this >> 16) & 0xff;
	inline function get_g():UInt return (this >> 8) & 0xff;
	inline function get_b():UInt return this & 0xff;
	inline function get_a():UInt return (this >> 24) & 0xff;

	inline function get_red():Float return r / 0xff;
	inline function get_green():Float return g / 0xff;
	inline function get_blue():Float return b / 0xff;
	inline function get_alpha():Float return a / 0xff;

	public inline function withAlpha(a:Float):Color
	{
		var alpha = if (a <= 0) // fully transparent
		{
			0;
		}
		else if (a >= 1) // fully opaque
		{
			0xFF << 24;
		}
		else // somewhere in-between
		{
			(Std.int(0xff * a) << 24);
		};
		return (this & 0xffffff) | alpha;
	}

	/**
	 * Finds the hue factor of a color.
	 * @return The hue value (from 0 to 1).
	 */
	public inline function getHue():Float
	{
		var h:Int = (this >> 16) & 0xFF;
		var s:Int = (this >> 8) & 0xFF;
		var v:Int = this & 0xFF;

		var max:Int = Std.int(Math.max(h, Math.max(s, v)));
		var min:Int = Std.int(Math.min(h, Math.min(s, v)));

		var hue:Float = 0;

		if (max == min)
		{
			hue = 0;
		}
		else if (max == h)
		{
			hue = (60 * (s - v) / (max - min) + 360) % 360;
		}
		else if (max == s)
		{
			hue = (60 * (v - h) / (max - min) + 120);
		}
		else if (max == v)
		{
			hue = (60 * (h - s) / (max - min) + 240);
		}

		return hue / 360;
	}

	/**
	 * Finds the saturation factor of a color.
	 * @return The saturation value (from 0 to 1).
	 */
	public inline function getSaturation():Float
	{
		var h:Int = (this >> 16) & 0xFF;
		var s:Int = (this >> 8) & 0xFF;
		var v:Int = this & 0xFF;

		var max:Int = Std.int(Math.max(h, Math.max(s, v)));

		if (max == 0)
		{
			return 0;
		}
		else
		{
			var min:Int = Std.int(Math.min(h, Math.min(s, v)));

			return (max - min) / max;
		}
	}

	/**
	 * Finds the value factor of a color.
	 * @return The value value (from 0 to 1).
	 */
	public inline function getValue():Float
	{
		var h:Int = (this >> 16) & 0xFF;
		var s:Int = (this >> 8) & 0xFF;
		var v:Int = this & 0xFF;

		return Std.int(Math.max(h, Math.max(s, v))) / 255;
	}

	public inline function getLuminance():Float
	{
		return (0.2126 * red + 0.7152 * green + 0.0722 * blue);
	}

	/**
	 * Shortcut to lerp between this color and another.
	 *
	 * @param	toColor		Second color.
	 * @param	t			Interpolation value. Clamped to the range [0, 1].
	 */
	public inline function lerp(toColor:Color, t:Float = 1):Color
	{
		return colorLerp(this, toColor, t);
	}

	public inline function multiply(other:Color):Color
	{
		return getColorRGBFloat(red * other.red, green * other.green, blue * other.blue);
	}

	public inline function toARGB(alpha:Float):UInt
	{
		alpha = MathUtil.clamp(alpha, 0, 1);
		return (Std.int(0xff * alpha) << 24) | this;
	}
}
