#macro GRID 20
#macro WIDTH (1400 / GRID) // room width... since room does not exist at time this runs
#macro HEIGHT (800 / GRID) // room height
#macro MAP global.map
MAP = array_create_ext(HEIGHT, function() { return array_create(WIDTH); });

function get_grid(_c, _off=0) { return ((_c - _off) div GRID); }
function get_grid_snap(_grid_c, _off=0) { return ((_grid_c + .5)*GRID + _off); }

