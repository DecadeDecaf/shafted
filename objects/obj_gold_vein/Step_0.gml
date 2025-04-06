x -= g.shaftspeed;

if (image_index == 0) {
	if (g.shaftspeed > 4) {
		if (g.gfc % 3 == 0) {
			if (random(10) < 4) {
				var _part = instance_create_depth(x + random_range(-96, 96), y + random_range(-96, 96), depth - 1, obj_part);
				_part.sprite_index = spr_shine;
				_part.spd = random_range(0, 0.5);
				var _siz = random_range(0.25, 0.75);
				_part.image_xscale = _siz;
				_part.image_yscale = _siz;
				_part.lifespan = 5;
			}
		}
	}
	if (hp <= 0) {
		image_index = 1;
		while (gold_left > 0) {
			instance_create_depth(x + random_range(-48, 48), y + random_range(-48, 48), depth - 11, obj_gold_chunk);
			gold_left--;
		}
	}
}