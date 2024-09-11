#macro GRID 20
#macro WIDTH (1400 / GRID) // room width
#macro HEIGHT (800 / GRID) // room height
#macro MAP global.map
MAP = array_create(HEIGHT, array_create(WIDTH));

function get_grid_x(_x, _xoff=0) { return ((_x - _xoff) div GRID); }
function get_grid_y(_y, _yoff=0) { return ((_y - _yoff) div GRID); }
function get_grid_x_snap(_grid_x, _xoff=0) { return ((_grid_x + .5)*GRID + _xoff); }
function get_grid_y_snap(_grid_y, _yoff=0) { return ((_grid_y + .5)*GRID + _yoff); }
