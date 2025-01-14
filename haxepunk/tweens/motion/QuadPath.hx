package haxepunk.tweens.motion;

import haxepunk.utils.Ease.EaseFunction;
import haxepunk.math.XY;

/**
 * A series of points which will determine a path from the
 * beginning point to the end poing using quadratic curves.
 */
class QuadPath extends Motion
{
	/**
	 * Starts moving along the path.
	 * @param	duration	Duration of the movement.
	 * @param	ease		Optional easer function.
	 */
	public function setMotion(duration:Float, ?ease:EaseFunction)
	{
		updatePath();
		_target = duration;
		_speed = _distance / duration;
		_ease = ease;
		start();
	}

	/**
	 * Starts moving along the path at the speed.
	 * @param	speed		Speed of the movement.
	 * @param	ease		Optional easer function.
	 */
	public function setMotionSpeed(speed:Float, ?ease:EaseFunction)
	{
		updatePath();
		_target = _distance / speed;
		_speed = speed;
		_ease = ease;
		start();
	}

	/**
	 * Adds the point to the path.
	 * @param	x		X position.
	 * @param	y		Y position.
	 */
	public function addPoint(x:Float = 0, y:Float = 0)
	{
		updateInternalCurve = true;
		if (_points.length == 0) _curve[0] = new XY(x, y);
		_points[_points.length] = new XY(x, y);
	}

	/**
	 * Gets the point on the path.
	 * @param	index		Index of the point.
	 * @return	The Point object.
	 */
	public function getPoint(index:Int = 0):XY
	{
		if (_points.length == 0)
			throw "No points have been added to the path yet.";

		return _points[index % _points.length];
	}

	/** @private Starts the Tween. */
	override public function start()
	{
		_index = 0;
		super.start();
	}

	/** @private Updates the Tween. */
	override function updateInternal()
	{
		if (_index < _curve.length - 1)
		{
			while (_t > _curveT[_index + 1]) _index++;
		}
		var td:Float = _curveT[_index],
			tt:Float = _curveT[_index + 1] - td;
		td = (_t - td) / tt;
		_a = _curve[_index];
		_b = _points[_index + 1];
		_c = _curve[_index + 1];
		x = _a.x * (1 - td) * (1 - td) + _b.x * 2 * (1 - td) * td + _c.x * td * td;
		y = _a.y * (1 - td) * (1 - td) + _b.y * 2 * (1 - td) * td + _c.y * td * td;
	}

	/** @private Updates the path, preparing the curve. */
	function updatePath()
	{
		if (_points.length < 3)
			throw "A QuadPath must have at least 3 points to operate.";

		if (!updateInternalCurve) return;
		updateInternalCurve = false;

		// produce the curve points
		var p:XY,
			c:XY,
			l:XY = _points[1],
			i:Int = 2;
		while (i < _points.length)
		{
			p = _points[i];
			if (_curve.length > i - 1) c = _curve[i - 1];
			else c = _curve[i - 1] = new XY();
			if (i < _points.length - 1)
			{
				c.x = l.x + (p.x - l.x) / 2;
				c.y = l.y + (p.y - l.y) / 2;
			}
			else
			{
				c.x = p.x;
				c.y = p.y;
			}
			l = p;
			i++;
		}

		// find the total distance of the path
		i = 0;
		_distance = 0;
		while (i < _curve.length - 1)
		{
			_curveD[i] = curveLength(_curve[i], _points[i + 1], _curve[i + 1]);
			_distance += _curveD[i++];
		}

		// find t for each point on the curve
		i = 1;
		var d:Float = 0;
		while (i < _curve.length - 1)
		{
			d += _curveD[i];
			_curveT[i++] = d / _distance;
		}
		_curveT[_curve.length - 1] = 1;
	}

	/**
	 * Amount of points on the path.
	 */
	public var pointCount(get, null):Float;
	function get_pointCount():Float return _points.length;

	/** @private Calculates the lenght of the curve. */
	function curveLength(start:XY, control:XY, finish:XY):Float
	{
		var a:XY = HXP.point,
			b:XY = HXP.point2;
		a.x = start.x - 2 * control.x + finish.x;
		a.y = start.y - 2 * control.y + finish.y;
		b.x = 2 * control.x - 2 * start.x;
		b.y = 2 * control.y - 2 * start.y;
		var a1:Float = 4 * (a.x * a.x + a.y * a.y),
			b1:Float = 4 * (a.x * b.x + a.y * b.y),
			c1:Float = b.x * b.x + b.y * b.y,
			abc:Float = 2 * Math.sqrt(a1 + b1 + c1),
			a2:Float = Math.sqrt(a1),
			a32:Float = 2 * a1 * a2,
			c2:Float = 2 * Math.sqrt(c1),
			ba:Float = b1 / a2;
		return (a32 * abc + a2 * b1 * (abc - c2) + (4 * c1 * a1 - b1 * b1) * Math.log((2 * a2 + ba + abc) / (ba + c2))) / (4 * a32);
	}

	// Path information.
	var _points:Array<XY> = [];
	var _distance:Float = 0;
	var _speed:Float = 0;
	var _index:Int = 0;

	// Curve information.
	var updateInternalCurve:Bool = true;
	var _curve:Array<XY> = [];
	var _curveT:Array<Float> = [0];
	var _curveD:Array<Float> = [];

	// Curve points.
	var _a:XY;
	var _b:XY;
	var _c:XY;
}
