var _left = (image_xscale < 0);
var _right = (image_xscale > 0);

if (hp <= 0) {
	_left = false;
	_right = false;
	if (g.gfc % 20 == 0) {
		instance_create_depth(x + random_range(-96, 96), y + random_range(-240, -48), depth - 11, obj_explosion);
	}
} else if (recovery > 0) {
	_left = false;
	_right = false;
	recovery--;
}

if (_left) { xv -= spd; }
if (_right) { xv += spd; }

xv /= fric;
xv = clamp(xv, -max_spd, max_spd);

x += xv;

var _padding = 160;

if (x < _padding || (x > room_width - _padding && intro)) {
	x -= xv;
	xv = 0;
	image_xscale *= -1;
	intro = true;
}

if (g.gfc % 75 == 0 && hp > 0) {
	instance_create_depth(x, y - 144, depth - 10, obj_contract);
}