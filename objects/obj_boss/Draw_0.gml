var _image = 0;

if (g.gfc % 16 >= 8) { _image = 1; }
if (recovery > 0 || hp <= 0) { _image = 2; }

draw_sprite_ext(sprite_index, _image, x, y, image_xscale, image_yscale, 0, -1, 1);