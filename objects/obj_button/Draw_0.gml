draw_self();

var _xx = x - (24 * ((cost - 1) / 2));

for (var _i = 0; _i < cost; _i++) {
	draw_sprite_ext(spr_gold_chunk, 0, _xx + (24 * _i), y + (168 * image_yscale), 1, 1, -30, -1, 1);
}