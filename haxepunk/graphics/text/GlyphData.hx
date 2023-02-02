package haxepunk.graphics.text;

import haxepunk.math.Rect;
import haxepunk.graphics.atlas.AtlasRegion;

typedef GlyphData =
{
	var region:AtlasRegion;
	var glyph:String;
	var rect:Rect;
	var xOffset:Int;
	var yOffset:Int;
	var xAdvance:Int;
	var scale:Float;
};
