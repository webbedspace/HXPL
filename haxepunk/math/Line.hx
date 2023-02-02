package haxepunk.math;
import haxe.ds.*;
import haxepunk.math.*;
using haxepunk.math.MathUtil;

@:structInit
class Line {
	public var x1:Float;
	public var y1:Float;
	public var x2:Float;
	public var y2:Float;

	public function new(x1 = 0.0, y1 = 0.0, x2 = 0.0, y2 = 0.0) {
		this.x1 = x1;
		this.y1 = y1;
		this.x2 = x2;
		this.y2 = y2;
	}

	public var start(get, set):XY;
	inline function get_start():XY
		return new XY(x1, y1);
	inline function set_start(v:XY):XY {
		this.x1 = v.x;
		this.y1 = v.y;
		return v;
	};

	public var end(get, set):XY;
	inline function get_end():XY
		return new XY(x2, y2);
	inline function set_end(v:XY):XY {
		this.x2 = v.x;
		this.y2 = v.y;
		return v;
	};

	public var distance(get, never):Float;
	inline function get_distance():Float
		return MathUtil.distance(this.x1, this.y1, this.x2, this.y2);

	public var angle(get, never):Float;
	inline function get_angle():Float
		return MathUtil.angle(this.x1, this.y1, this.x2, this.y2);

	public inline function middle(percent = 0.5) {
		return new XY(MathUtil.lerp(this.x1, this.x2, percent), MathUtil.lerp(this.y1, this.y2, percent));
	}

	public inline function scale(percent: Float) {
		return new Line(this.x1, this.y1, MathUtil.lerp(this.x1, this.x2, percent), MathUtil.lerp(this.y1, this.y2, percent));
	}

	public inline function rotate(angle = 0.0) {
		if (angle == 90.0) {
			return new Line(this.x2, this.y1, this.x1, this.y2);
		}
		angle *= MathUtil.RAD;
		return new Line(this.x1, this.y1, Math.cos(angle) * this.distance + this.x1, Math.sin(angle) * this.distance + this.y1);
	}

	public function collideLine(other:Line): Option<XY> {
		// Bourke 89
		var denom =
			(other.y2 - other.y1)*(this.x2 - this.x1) -
			(other.x2 - other.x1)*(this.y2 - this.y1);
		var unknownA =
			((other.x2 - other.x1) * (this.y1 - other.y1) -
			( other.y2 - other.y1) * (this.x1 - other.x1)) / denom;
		var unknownB =
			((this.x2 - this.x1) * (this.y1 - other.y1) -
			( this.y2 - this.y1) * (this.x1 - other.x1)) / denom;

		if (denom != 0 && unknownA >= 0 && unknownA <= 1 && unknownB >= 0 && unknownB <= 1) {
			return Some(new XY(
				this.x1 + unknownA * (this.x2 - this.x1),
				this.y1 + unknownA * (this.y2 - this.y1)
			));
		}
		return None;
	}

	public inline function str() {
		return 'Line{${this.x1}, ${this.y1}, ${this.x2}, ${this.y2}}';
	}

}
