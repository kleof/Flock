
steering.add_weighted(seek_force(mouse_x, mouse_y), 1);
steering.add_weighted(wander_force(), .9);

velocity.add(steering);
velocity.limit_magnitude(max_speed);
position.add(velocity);

steering.set(0, 0);

x = position.x;
y = position.y;
image_angle = velocity.get_direction();
