
var _dir = point_direction(x, y, mouse_x, mouse_y);
var _accel_x = lengthdir_x(accel_force, _dir);
var _accel_y = lengthdir_y(accel_force, _dir);

accel.set(_accel_x, _accel_y);
velocity.add(accel);

x += velocity.x;
y += velocity.y;

