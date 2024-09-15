max_speed = 3;
max_force = .2;

position = new Vector(x, y);
velocity = new Vector_random(max_speed);
steering = new Vector(0, 0);

//image_blend = #FF1E78;
image_alpha = .01;
//outline_init();

show_debug_message(false);