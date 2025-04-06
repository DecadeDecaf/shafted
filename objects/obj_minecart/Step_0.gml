var _left = (keyboard_check(vk_left));
var _right = (keyboard_check(vk_right));
var _shoot = (keyboard_check_pressed(vk_space));

if (g.dead || g.won) {
	_left = false;
	_right = false;
	_shoot = false;
}

if (_left) { xv -= spd + (g.kart_speed * 0.25); }
if (_right) { xv += spd + (g.kart_speed * 0.25); }

xv /= fric;
xv = clamp(xv, -max_spd - (g.kart_speed * 1.5), max_spd + (g.kart_speed * 1.5));

x += xv;

var _padding = 160;

if (x < _padding || x > room_width - _padding) {
	x -= xv;
	xv = 0;
}

if (_shoot) {
	if (g.pickaxes > 0) {
		instance_create_depth(x, y - 144, depth - 1, obj_pickaxe);
		g.pickaxes--;
	} else if (g.dynamite > 0) {
		instance_create_depth(x, y - 144, depth - 1, obj_dynamite);
		g.dynamite--;
	}
}

if (xv < -2.5 && g.shaftspeed > 4) {
	if (g.gfc % 3 == 0) {
		var _xx = x - 52;
		repeat (2) {
			if (random(10) < 7) {
				var _part = instance_create_depth(_xx + random_range(-4, 4), y, depth - 1, obj_part);
				_part.sprite_index = spr_spark;
				_part.dir = random_range(90, 180);
				_part.spd = random_range(5, 7.5);
				var _siz = random_range(0.35, 0.7);
				_part.image_xscale = _siz;
				_part.image_yscale = _siz;
				_part.lifespan = 10;
				_xx += 88;
			}
		}
	}
}

if (g.gfc % 20 == 0 && g.dead) {
	instance_create_depth(x + random_range(-64, 64), y + random_range(-128, -32), depth - 11, obj_explosion);
}