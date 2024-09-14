function Graph(_width, _height) constructor {
	width = _width;
	height = _height;
	map = [];
	for (var i = 0; i < height; i++) {
		var mapx = [];
		for (var j = 0; j < width; j ++) {
			array_push(mapx, new Node(j, i, self));
		}
		array_push(map, mapx);
	}
	
	update_nodes = function() {
		for (var i = 0; i < height; i++) {
			for (var j = 0; j < width; j ++) {
				map[i][j].update_neighbors();
			}
		}
	}
	update_nodes();
	
	generate_flowfield = function(_target_x, _target_y) {
		var frontier = [];
		array_push(frontier, map[_target_y][_target_x]);
		
		var visited = {};
		visited[$ map[_target_y][_target_x].id] = true;
		
		while (array_length(frontier) > 0) {
			var current = array_shift(frontier);
			
			for (var i = 0; i < array_length(current.neighbors); i++) {
				var next = current.neighbors[i];
				if (visited[$ next.id] == undefined) {
					array_push(frontier, next);
					visited[$ next.id] = true;
					var _vec = new Vector(current.x - next.x, current.y - next.y);
					_vec.set_magnitude(5);
					next.vec = _vec;
				}
			}
		}
	}
}

function Node(_x, _y, _graph) constructor {
	x = _x;
	y = _y;
	id = string(x + y * _graph.height);
	graph = _graph;
	vec = new Vector(0, 0);
	neighbors = [];
	free = true;
	
	update_neighbors = function() {
		neighbors = [];
		if (x - 1 >= 0 and graph.map[y][x - 1].free == true) {
			array_push(neighbors, graph.map[y][x - 1]);
		}
		if (x + 1 < graph.width and graph.map[y][x + 1].free == true) {
			array_push(neighbors, graph.map[y][x + 1]);
		}
		if (y + 1 < graph.height and graph.map[y + 1][x].free == true) {
			array_push(neighbors, graph.map[y + 1][x]);
		}
		if (y - 1 >= 0 and graph.map[y - 1][x].free == true) {
			array_push(neighbors, graph.map[y - 1][x]);
		}
	}
}

//=========== YE OLDE THINGIES =============//

//function generate_flowfield(_x, _y) {
//	var frontier = [];
//	array_push(frontier, {x:_x, y:_y});
	
//	var visited = {};
//	visited[$ {x:_x, y:_y}] = true;
	
//	while (array_length(frontier) > 0) {
//		var current = array_shift(frontier);
//		var neighbors = get_neighbors(current);
//		for (var i = 0; i < array_length(neighbors); i++) {
//			var next = neighbors[i];
//			if (visited[$ next] == undefined) {
//				array_push(frontier, next);
//				visited[$ next] = true;
//				var _vec = new Vector(current.x - next.x, current.y - next.y);
//				_vec.set_magnitude(5);
//				MAP[next.y][next.x] = _vec;
//			}
//		}
//	}
//}

//function get_neighbors(_node) {
//	var _neighbors = [];
	
//	if (_node.x - 1 >= 0 and (MAP[_node.y][_node.x-1].obstacle == false)) {
//		array_push(_neighbors, {x: _node.x - 1, y: _node.y});
//	}
//	if (_node.x + 1 < WIDTH and (MAP[_node.y][_node.x+1].obstacle == false)) {
//		array_push(_neighbors, {x: _node.x + 1, y: _node.y});
//	}
//	if (_node.y - 1 >= 0 and (MAP[_node.y-1][_node.x].obstacle == false)) {
//		array_push(_neighbors, {x: _node.x, y: _node.y - 1});
//	}
//	if (_node.y + 1 < HEIGHT and (MAP[_node.y+1][_node.x].obstacle == false)) {
//		array_push(_neighbors, {x: _node.x, y: _node.y + 1});
//	}
	
//	return _neighbors;
//}


struct1 = {arr: []};
struct2 = {arr: []};

struct1.arr[0] = struct2;
struct2.arr[0] = struct1;

struct3 = {};

struct3[$ struct1] = true;

show_debug_message(struct3);














