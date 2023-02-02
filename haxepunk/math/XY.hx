package haxepunk.math;

private typedef Position =
{
	x:Float,
	y:Float
};

private typedef PositionObj =
{
	@:isVar var x(get, set):Float;
	@:isVar var y(get, set):Float;
};

/**
 * Represents a position on a two dimensional coordinate system.
 *
 * Conversion from a `{ x:Float, y:Float }` or an `Entity` is automatic.
 *
 * All functions are reentrant.
 */
@:forward
abstract XY(Position) from Position to Position
{
	public inline function new(x:Float = 0, y:Float = 0)
	{
		this = { x:x, y:y };
	}
	
	@:dox(hide) @:from public static inline function fromObj(obj:PositionObj)
	{
		return new XY(obj.x, obj.y);
	}

	/**
	 * The length of this vector.
	 **/
	public var length(get, set):Float;
	inline function get_length():Float return Math.sqrt(this.x * this.x + this.y * this.y);
	inline function set_length(value:Float)
	{
		normalize(value);
		return value;
	}

	/**
	 * Sets the internal x, y values.
	 **/
	public inline function setTo(x:Float, y:Float):XY
	{
		this.x = x;
		this.y = y;
		return this;
	}

	/**
	 * Converts this vector to it's perpendicular counterpart.
	 **/
	public inline function perpendicular():XY
	{
		setTo(-this.y, this.x);
		return this;
	}

	/**
	 * Inverts (negates) the vector contents.
	 **/
	public inline function inverse():XY
	{
		this.x = -this.x;
		this.y = -this.y;
		return this;
	}
	
	/**
	 * Returns a new vector which is this vector negated.
	 **/
	@:op(-a)
	public inline function neg():XY
	{
		return clone().inverse();
	}

	/**
	 * Copies the values from one vector into this one.
	 * @param other  The vector to copy from
	 **/
	public inline function copyFrom(other:XY):XY
	{
		this.x = other.x;
		this.y = other.y;
		return this;
	}

	/**
	 * Scales the vector by a single value.
	 **/
	public inline function scale(scalar:Float):XY
	{
		this.x *= scalar;
		this.y *= scalar;
		return this;
	}
	
	/**
	 * Returns a new vector which is this vector scaled
	 * by the given amount.
	 **/
	@:op(a*b) @:commutative
	public inline function mult(scalar:Float):XY
	{
		return clone().scale(scalar);
	}
	
	/**
	 * Returns a new vector which is this vector scaled
	 * by the inverse of the given amount.
	 **/
	@:op(a/b)
	public inline function div(scalar:Float):XY
	{
		return clone().scale(1 / scalar);
	}
	
	/**
	 * Adds a vector to this vector in-place.
	 */
	public inline function add(other:XY):XY
	{
		this.x += other.x;
		this.y += other.y;
		return this;
	}
	
	/**
	 * Returns a new vector which is the addition of
	 * this vector and another vector.
	 **/
	@:op(a+b)
	public inline function plus(other:XY):XY
	{
		return clone().add(other);
	}
	
	/**
	 * Subtracts a vector to this vector in-place.
	 */
	public inline function subtract(other:XY):XY
	{
		this.x -= other.x;
		this.y -= other.y;
		return this;
	}
	
	/**
	 * Returns a new vector which is the subtraction of
	 * another vector from this vector.
	 **/
	@:op(a-b)
	public inline function minus(other:XY):XY
	{
		return clone().subtract(other);
	}

	/**
	 * Returns the distance between this and another point.
	 * @param other  The other point to use for distance calculation
	 * @returns The distance between the two points
	 **/
	public inline function distance(other:XY):Float
	{
		var dx = this.x - other.x;
		var dy = this.y - other.y;
		return Math.sqrt(dx * dx + dy * dy);
	}

	/**
	 * Normalizes the vector to a set length.
	 * @param size  The length of the resulting vector. Default: unit length (1)
	 **/
	public inline function normalize(size:Float=1):XY
	{
		if (!(this.x == 0 && this.y == 0))
		{
			var normal = size / length;
			this.x *= normal;
			this.y *= normal;
		}
		return this;
	}

	/**
	 * Rotates the vector around an angle in-place.
	 * @param angle  The angle, in radians to rotate around (clockwise)
	 **/
	public inline function rotate(angle:Float):XY
	{
		var sin = Math.sin(angle);
		var cos = Math.cos(angle);
		setTo(cos * this.x - sin * this.y, sin * this.x + cos * this.y);
		return this;
	}
	
	/**
	 * Returns a new vector that is equal to this vector rotated
	 * by the given angle.
	 * @param angle  The angle, in radians to rotate around (clockwise)
	 */
	public inline function rotated(angle:Float):XY
	{
		return clone().rotate(angle);
	}

	/**
	 * Can be used to determine if an angle between two vectors is acute or obtuse.
	 */
	public inline function dot(other:XY):Float
	{
		return (this.x * other.x) + (this.y * other.y);
	}

	/**
	 * This is the same as a 3D cross product but only returns the z value because x and y are 0.
	 * Can be used to determine if and angle between two vectors is greater than 180 degrees.
	 */
	public inline function zcross(other:XY):Float
	{
		return (this.x * other.y) - (this.y * other.x);
	}

	public inline function clone():XY
	{
		return new XY(this.x, this.y);
	}

	public inline function between(other:XY, percent = 0.5) {
		return new XY(MathUtil.lerp(this.x, other.x, percent), MathUtil.lerp(this.y, other.y, percent));
	}
}
