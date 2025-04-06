if (spd > 0 && position_meeting(x, y, obj_minecart) && !caught) {
	g.dynamite++;
	caught = true;
}

if (delay > 0) {
	delay--;
	exit;
}

y += spd;

if (caught) {
	spd /= 1.5;
	image_xscale -= 0.25;
	image_yscale -= 0.25;
	if (image_xscale <= 0) {
		instance_destroy();
	}
	exit;
}

if (image_xscale < 1) {
	image_xscale += 0.1;
	image_yscale += 0.1;
}

spd += 0.35;

var _vein = instance_nearest(x, y, obj_gold_vein);

if (instance_exists(_vein)) {
	if (position_meeting(x, y, _vein) && _vein.hp > 0) {
		repeat (min(_vein.hp, 5)) {
			_vein.hp--;
			_vein.gold_left--;
			instance_create_depth(x, y, depth, obj_gold_chunk);
		}
		repeat (4) {
			var _part = instance_create_depth(x + random_range(-8, 8), y + random_range(-8, 8), depth + 1, obj_part);
			_part.sprite_index = spr_shine;
			_part.spd = random_range(1.5, 3);
			var _siz = random_range(0.25, 0.75);
			_part.image_xscale = _siz;
			_part.image_yscale = _siz;
			_part.lifespan = 10;
		}
		instance_create_depth(x, y, depth - 11, obj_explosion);
		instance_destroy();
		exit;
	}
}

var _boss = instance_nearest(x, y, obj_boss);

if (instance_exists(_boss)) {
	if (position_meeting(x, y, _boss) && _boss.hp > 0) {
		repeat (min(_boss.hp, 5)) {
			_boss.hp--;
		}
		_boss.recovery = 12;
		instance_create_depth(x, y, depth - 11, obj_explosion);
		instance_destroy();
		exit;
	}
}

if (g.gfc % 8 == 0) {
	image_angle += 30;
}

if (y > 1144) {
	instance_destroy();
}