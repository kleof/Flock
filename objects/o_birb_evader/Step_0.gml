
steering.add(evade_force(o_birb_seeker));

velocity.add(steering);
velocity.limit_magnitude(max_speed);
position.add(velocity);

steering.set(0, 0);

x = position.x;
y = position.y;
image_angle = velocity.get_direction();
