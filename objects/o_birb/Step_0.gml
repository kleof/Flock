
//steering.add(flee_force(mouse_x, mouse_y));
steering.add(arrive_force(mouse_x, mouse_y, 50));

velocity.add(steering);
velocity.limit_magnitude(max_speed);
position.add(velocity);

steering.set(0, 0);

x = position.x;
y = position.y;
image_angle = velocity.get_direction();
