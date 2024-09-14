var _x = get_grid(mouse_x);
var _y = get_grid(mouse_y);
	
if (_x < 0 || _x >= WIDTH || _y < 0 || _y >= HEIGHT) exit;


if (mouse_check_button_pressed(mb_left)) {
	if (MAP[_y][_x].free == true) obstacle_paint_mode = 1; 
	else obstacle_paint_mode = 0;
}

if (mouse_check_button(mb_left)) {
	var _sx = get_grid_snap(_x);
	var _sy = get_grid_snap(_y);
	
	if (MAP[_y][_x].free == true && obstacle_paint_mode == 1) {
		MAP[_y][_x].free = false;
		FLOWFIELD.update_nodes();
		FLOWFIELD.generate_flowfield(30,10);
		var _inst = instance_create_layer(_sx, _sy, "Map", o_obstacle, {image_xscale: 0, image_yscale: 0});
		TweenFire(_inst, "outElastic", 0, true, 0, 1, "image_xscale>", 1, "image_yscale>", 1);	
	} else if (MAP[_y][_x].free == false && obstacle_paint_mode == 0) {
		MAP[_y][_x].obstacle = true;
		var _inst = instance_position(mouse_x, mouse_y, o_obstacle);
		instance_destroy(_inst);
		instance_create_layer(_sx, _sy, "Map", o_plop);
	}
}

if (mouse_check_button(mb_right)) {
	instance_create_layer(mouse_x, mouse_y, "Instances", o_birb);
}