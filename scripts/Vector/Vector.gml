function Vector(_x, _y) constructor {
	x = _x;
	y = _y;
	
	static set = function(_x, _y) {
		x = _x;
		y = _y;
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
	
	static multiply = function(_scalar) {
		x /= _scalar;
		y /= _scalar;
	}
}