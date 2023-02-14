package haxepunk.math;

@:structInit
class Rect {
	public var x:Float;
	public var y:Float;
	public var width:Float;
	public var height:Float;

	/**
	 * The left-most x-axis value. Identical to x.
	 */
	public var left(get, set):Float;
	inline function get_left():Float
		return x;
	inline function set_left(value:Float):Float
		return x = value;

	/**
	 * The right-most x-axis value. When set it will push the x value, keeping the same width.
	 */
	public var right(get, set):Float;
	inline function get_right():Float
		return x + width;
	inline function set_right(value:Float):Float {
		x = value - width;
		return value;
	}

	/**
	 * The top-most y-axis value. Identical to y.
	 */
	public var top(get, set):Float;
	inline function get_top():Float
		return y;
	inline function set_top(value:Float):Float
		return y = value;

	/**
	 * The bottom-most y-axis value. When set it will push the y value, keeping the same height.
	 */
	public var bottom(get, set):Float;
	inline function get_bottom():Float
		return y + height;
	inline function set_bottom(value:Float):Float {
		y = value - height;
		return value;
	}

	public function new(x:Float = 0, y:Float = 0, width:Float = 0, height:Float = 0) {
		setTo(x, y, width, height);
	}

	// Alternate constructor
	public static inline function xyxy(x1:Float, y1:Float, x2:Float, y2:Float) {
		return new Rect(x1, y1, x2 - x1, y2 - y1);
	}

	public function setTo(x:Float = 0, y:Float = 0, width:Float = 0, height:Float = 0) {
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}

	public function clone() {
		return new Rect(x, y, width, height);
	}

	/**
	 * Checks if the rectangle width and height values are at or less than zero.
	 */
	public function isEmpty() {
		return width <= 0 && height <= 0;
	}

	/**
	 * Checks if the rectangle intersects another rectangle.
	 */
	public function intersects(other:Rect) {
		return left <= other.right && other.left <= right && top <= other.bottom && other.top <= bottom;
	}

	/**
	 * If the rectangle intersects another rectangle, it returns an overlapping rectangle. Otherwise, it returns null.
	 */
	public function intersection(other:Rect):Null<Rect> {
		var left = Math.max(left, other.left);
		var right = Math.min(right, other.right);
		var top = Math.max(top, other.top);
		var bottom = Math.min(bottom, other.bottom);

		if (right >= left && bottom >= top) {
			return new Rect(left, top, right - left, bottom - y);
		} else {
			return null;
		}
	}

	public var ul(get, never):XY;
	public inline function get_ul()
		return new XY(this.left, this.top);

	public var ur(get, never):XY;
	public inline function get_ur()
		return new XY(this.right, this.top);

	public var dl(get, never):XY;
	public inline function get_dl()
		return new XY(this.left, this.bottom);

	public var dr(get, never):XY;
	public inline function get_dr()
		return new XY(this.right, this.bottom);

	public var topLine(get, never):Line;
	public inline function get_topLine()
		return new Line(this.left, this.top, this.right, this.top);

	public var bottomLine(get, never):Line;
	public inline function get_bottomLine()
		return new Line(this.left, this.bottom, this.right, this.bottom);

	public var leftLine(get, never):Line;
	public inline function get_leftLine()
		return new Line(this.left, this.top, this.left, this.bottom);

	public var rightLine(get, never):Line;
	public inline function get_rightLine()
		return new Line(this.right, this.top, this.right, this.bottom);

	public inline function toStr() {
		return 'Rect{${this.left}, ${this.top}, ${this.right}, ${this.bottom}}';
	}

	public inline function distanceToRect(other:Rect) {
		return MathUtil.distanceRects(this.left, this.top, this.width, this.height, other.left, other.top, other.width, other.height);
	}
}
