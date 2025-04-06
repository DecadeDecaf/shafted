if (spd > 0 && position_meeting(x, y, obj_minecart) && !caught) {
	g.pickaxes++;
	caught = true;
	audio_play_sound(sfx_collect, 1, false, 0.8, 0, random_range(0.9, 1.1));
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

if (spd > 0 && !hit_reset) {
	hit_reset = true;
	hit = [];
}

var _vein = instance_nearest(x, y, obj_gold_vein);

if (instance_exists(_vein)) {
	if (!array_has(hit, _vein.id)) {
		if (position_meeting(x, y, _vein) && _vein.hp > 0) {
			_vein.hp--;
			_vein.gold_left--;
			instance_create_depth(x, y, depth, obj_gold_chunk);
			audio_play_sound(sfx_mine, 1, false, 0.8, 0, random_range(0.9, 1.1));
			delay = 10;
			if (spd > 1.5) {
				spd = -spd;
				hit_reset = false;
				hit = [];
			}
			array_push(hit, _vein.id);
			repeat (4) {
				var _part = instance_create_depth(x + random_range(-8, 8), y + random_range(-8, 8), depth + 1, obj_part);
				_part.sprite_index = spr_shine;
				_part.spd = random_range(1.5, 3);
				var _siz = random_range(0.25, 0.75);
				_part.image_xscale = _siz;
				_part.image_yscale = _siz;
				_part.lifespan = 10;
			}
		}
	}
}

var _boss = instance_nearest(x, y, obj_boss);

if (instance_exists(_boss)) {
	if (!array_has(hit, _boss.id)) {
		if (position_meeting(x, y, _boss) && _boss.hp > 0) {
			if (spd > 1.5) {
				_boss.hp--;
				_boss.recovery = 12;
				delay = 10;
				spd = -spd;
				hit_reset = false;
				hit = [];
			}
			array_push(hit, _boss.id);
		}
	}
}

if (g.gfc % 8 == 0) {
	image_angle += 30;
}

if (y > 1144) {
	instance_destroy();
}