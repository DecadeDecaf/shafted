x -= g.shaftspeed;

if (lifespan > 0) {
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
} else {
	spd /= 1.25;
	image_xscale -= 0.1;
	image_yscale -= 0.1;
	if (image_xscale <= 0.1 || image_yscale <= 0.1) {
		instance_destroy();
	}
}