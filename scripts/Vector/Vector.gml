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

function Vector_from_angle(_magnitude, _angle) : Vector() constructor {
	x = lengthdir_x(_magnitude, _angle);
	y = lengthdir_y(_magnitude, _angle);
}

//============ FUNCTIONS ============//

function vector_copy(_vector) {
	return new Vector(_vector.x, _vector.y);
}

function vector_subtract(_vector_a, _vector_b) {
	return new Vector(_vector_a.x - _vector_b.x, _vector_a.y - _vector_b.y);
}

function seek_force(_x, _y) {
	var _vec = new Vector(_x, _y);
	_vec.subtract(position);
	_vec.set_magnitude(max_speed);
	_vec.subtract(velocity);
	_vec.limit_magnitude(max_force);
	return _vec;
}

function flee_force(_x, _y) {
	var _vec = new Vector(_x, _y);
	_vec.subtract(position);
	_vec.set_magnitude(max_speed);
	_vec.multiply(-1);
	_vec.subtract(velocity);
	_vec.limit_magnitude(max_force);
	return _vec;
}

function pursue_force(_id) {
	var _vec = vector_copy(_id.velocity);
	_vec.multiply(10); // how far we predict instance movement
	_vec.add(_id.position);
	
	return seek_force(_vec.x, _vec.y);
}

function evade_force(_id) {
	var _vec = vector_copy(_id.velocity);
	_vec.multiply(10); // how far we predict instance movement
	_vec.add(_id.position);
	
	return flee_force(_vec.x, _vec.y);
}

function arrive_force(_x, _y, _slow_radius) {
	var _vec = new Vector(_x, _y);
	_vec.subtract(position);
	
	var _dist = _vec.get_magnitude();
	if (_dist > _slow_radius) {
		_vec.set_magnitude(max_speed);
	} else {
		_vec.set_magnitude(max_speed * (_dist/_slow_radius));
	}
	
	_vec.subtract(velocity);
	_vec.limit_magnitude(max_force);
	return _vec;
}
