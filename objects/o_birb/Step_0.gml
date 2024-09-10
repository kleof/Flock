
var _dir = point_direction(x, y, mouse_x, mouse_y);

accel.set_from_angle(accel_force, _dir);
velocity.add(accel);
velocity.limit_magnitude(3);

x += velocity.x;
y += velocity.y;
image_angle = point_direction(0, 0, velocity.x, velocity.y);
