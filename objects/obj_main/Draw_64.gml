for (var _i = 0; _i < g.pickaxes; _i++) {
	draw_sprite_ext(spr_pickaxe, 0, 64 + (48 * _i), 80, 1, 1, -30, -1, 1);
}

for (var _i = 0; _i < g.dynamite; _i++) {
	draw_sprite_ext(spr_dynamite, 0, 64 + (48 * g.pickaxes) + (48 * _i), 80, 1, 1, -30, -1, 1);
}

for (var _i = 0; _i < g.gold; _i++) {
	draw_sprite_ext(spr_gold_chunk, 0, 52 + (24 * _i), 160, 1, 1, -30, -1, 1);
}

with (obj_boss) {
	var _perc = (hp / 25);
	draw_set_color(#10121C);
	draw_set_alpha(0.5);
	draw_rectangle(23, 1031, 1897, 1057, false)
	draw_set_color(#FFFFFF);
	draw_set_alpha(1);
	draw_rectangle(24, 1032, 24 + (1872 * _perc), 1056, false)
}