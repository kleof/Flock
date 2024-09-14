
var _grid_x = get_grid(x);
var _grid_y = get_grid(y);

if (_grid_x > 0 && _grid_x < WIDTH && _grid_y > 0 && _grid_y < HEIGHT) {
	var _flow_vec = MAP[_grid_y][_grid_x].vec;
	steering.add_weighted(_flow_vec, 150);
} else {
	steering.add_weighted(seek_force(mouse_x, mouse_y), 1);
}


steering.add_weighted(private_space_force(), 30);


steering.limit_magnitude(max_force);
velocity.add(steering);
velocity.limit_magnitude(max_speed);

position.add(velocity);
steering.set(0, 0);

x = position.x;
y = position.y;
image_angle = velocity.get_direction();

