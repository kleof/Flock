if (mouse_check_button(mb_left)) {
	var _x = get_grid_x(mouse_x);
	var _y = get_grid_y(mouse_y);
	if (_x < 0 || _x >= WIDTH || _y < 0 || _y >= HEIGHT) exit;
	show_debug_message(MAP[_y]);
	//if (MAP[_y][_x] == 0) {
		MAP[_y][_x] = 1;
		var _sx = get_grid_x_snap(_x);
		var _sy = get_grid_y_snap(_y);
		instance_create_layer(_sx, _sy, "Map", o_obstacle);
	//}
}
