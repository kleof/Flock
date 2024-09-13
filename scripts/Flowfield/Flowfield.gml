function generate_flowfield(_x, _y) {
	var frontier = [];
	array_push(frontier, _x+_y*HEIGHT);
	
	var came_from = {};
	came_from[$ _x+_y*HEIGHT] = new Vector(0, 0);
	
	while (array_length(frontier) > 0) {
		var current = array_pop(frontier);
		
	}
}