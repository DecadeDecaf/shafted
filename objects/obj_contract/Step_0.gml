if (spd > 0 && position_meeting(x, y, obj_minecart) && !caught && !g.dead) {
	g.dead = true;
	caught = true;
}

y += spd;

if (caught) {
	spd /= 1.5;
	image_xscale -= 0.25;
	image_yscale -= 0.25;
	if (image_xscale <= 0) {
		instance_create_depth(x, y, depth - 11, obj_explosion);
		var _button = instance_create_depth(960, 420, -20, obj_button);
		_button.image_index = 4;
		_button.cost = 0;
		instance_destroy();
	}
	exit;
}

if (image_xscale < 1) {
	image_xscale += 0.1;
	image_yscale += 0.1;
}

spd += 0.1;

if (g.gfc % 12 == 0) {
	image_angle += 30 * float_dir;
	x += 25 * float_dir;
	if (image_angle < 210 || image_angle > 360) {
		image_angle -= 30 * float_dir;
		x -= 25 * float_dir;
		float_dir *= -1;
	}
}

if (y > 1144) {
	instance_destroy();
}