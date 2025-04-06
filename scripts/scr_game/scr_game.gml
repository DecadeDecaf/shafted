function generate_mineshaft() {
	var _track_w = 1920;
	var _track_x = 0;
	var _track_y = 0;
	for (var _i = 0; _i < g.tracklength; _i++) {
		_track_x = (_track_w * _i);
		instance_create_depth(_track_x, _track_y, 10, obj_mineshaft);
		repeat (1 + floor(_i / 3)) {
			if (random(10) < 6 && _i > 0) {
				var _vein_x = _track_x + random_range(-320, 320);
				var _vein_y = 540 + random_range(-192, 160);
				var _vein = instance_create_depth(_vein_x + 10000, _vein_y, -1, obj_gold_vein);
				with (_vein) {
					if (place_meeting(x - 10000, y, obj_gold_vein)) {
						instance_destroy();
					} else {
						x -= 10000;
					}
				}
			}
		}
	}
	var _end = instance_create_depth(_track_x + _track_w, _track_y, 0, obj_mineshaft);
	_end.track_end = true;
	_end.image_index = (g.tracklength < 15 ? 1 : 2);
}

function reset_track() {
	instance_destroy(obj_boss);
	instance_destroy(obj_contract);
	instance_destroy(obj_mineshaft);
	instance_destroy(obj_gold_vein);
	instance_destroy(obj_gold_chunk);
	instance_destroy(obj_pickaxe);
	instance_destroy(obj_dynamite);
	instance_destroy(obj_explosion);
	instance_destroy(obj_part);
	instance_destroy(obj_button);
	
	g.dead = false;
	
	with (obj_minecart) {
		x = 960;
		xv = 0;
	}
	
	g.pickaxes = g.max_pickaxes;
	g.dynamite = g.max_dynamite;

	g.shaftspeed = 8;
	
	generate_mineshaft();
}