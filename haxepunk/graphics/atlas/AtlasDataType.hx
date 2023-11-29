package haxepunk.graphics.atlas;

import haxepunk.assets.AssetCache;
import haxepunk.graphics.hardware.Texture;

/**
 * Abstract representing either a `String`, a `AtlasData` or a `Texture`.
 *
 * Conversion is automatic, no need to use this.
 */
abstract AtlasDataType(AtlasData)
{
	inline function new(data:AtlasData) this = data;
	@:to public inline function toAtlasData():AtlasData return this;

	@:from public static inline function fromString(s:String)
	{
		return new AtlasDataType(AssetCache.global.getAtlasData(s, false));
	}
	@:from public static inline function fromTexture(texture:Texture)
	{
		return new AtlasDataType(new AtlasData(texture));
	}
	@:from public static inline function fromAtlasData(data:AtlasData)
	{
		return new AtlasDataType(data);
	}
}
