function Vector(_x, _y) constructor {
	x = _x;
	y = _y;
	
	static set = function(_x, _y) {
		x = _x;
		y = _y;
	}
	static set_from_angle = function(_magnitude, _angle) {
		x = lengthdir_x(_magnitude, _angle);
		y = lengthdir_y(_magnitude, _angle);
	}
	static set_from_vector = function(_vector) {
		x = _vector.x;
		y = _vector.y;
	}
	
	static add = function(_vector) {
		x += _vector.x;
		y += _vector.y;
	}
	static subtract = function(_vector) {
		x -= _vector.x;
		y -= _vector.y;
	}
	static multiply = function(_scalar) {
		x *= _scalar;
		y *= _scalar;
	}
	static divide = function(_scalar) {
		x /= _scalar;
		y /= _scalar;
	}
	static get_magnitude = function() {
		return sqrt(sqr(x) + sqr(y));
	}
	static get_direction = function() {
		return point_direction(0, 0, x, y);
	}
	static normalize = function() {
		if ((x != 0) || (y != 0)) {
			var _factor = 1 / get_magnitude();
			x *= _factor;
			y *= _factor;
		}
	}
	static set_magnitude = function(_scalar) {
		normalize();
		multiply(_scalar);
	}
	static limit_magnitude = function(_limit) {
		if (get_magnitude() > _limit) {
			set_magnitude(_limit);
		}
	}
}

function Vector_0() : Vector() constructor {
	x = 0;
	y = 0;
}

function Vector_random(_magnitude) : Vector() constructor {
	var _dir = random(360);
	_magnitude ??= 1;
	set_from_angle(_magnitude, _dir);
}
