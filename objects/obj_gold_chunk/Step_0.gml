if (position_meeting(x, y, obj_minecart) && !caught) {
	g.gold++;
	if (g.gold > 75) { g.gold = 75; }
	caught = true;
	audio_play_sound(sfx_collect, 1, false, 0.8, 0, random_range(0.9, 1.1));
}

x += xv;
y += yv;

if (caught) {
	xv /= 1.35;
	yv /= 1.35;
	image_xscale -= 0.2;
	image_yscale -= 0.2;
	if (image_xscale <= 0) {
		instance_destroy();
	}
	exit;
}

if (image_xscale < 1) {
	image_xscale += 0.1;
	image_yscale += 0.1;
}

xv /= 1.015;
yv += 0.15;

if (y > 1144) {
	instance_destroy();
}