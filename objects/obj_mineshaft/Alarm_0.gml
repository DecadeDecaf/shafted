if (g.max_pickaxes < 6 || g.max_dynamite < 3 || g.kart_speed < 3 || g.tracklength < 15) {
	var _button;
	_button = instance_create_depth(240, 420, -20, obj_button);
	_button.image_index = (g.max_pickaxes < 6 ? 0 : 5);
	_button.cost = (g.max_pickaxes < 6 ? 2 + (g.max_pickaxes) : 0);
	_button = instance_create_depth(600, 420, -20, obj_button);
	_button.image_index = (g.max_dynamite < 3 ? 1 : 5);
	_button.cost = (g.max_dynamite < 3 ? 7 + (g.max_dynamite * 2) : 0);
	_button = instance_create_depth(960, 420, -20, obj_button);
	_button.image_index = (g.kart_speed < 3 ? 2 : 5);
	_button.cost = (g.kart_speed < 3 ? 4 + (g.kart_speed * 4) : 0);
	_button = instance_create_depth(1320, 420, -20, obj_button);
	_button.image_index = (g.tracklength < 15 ? 3 : 5);
	_button.cost = (g.tracklength < 15 ? g.tracklength - 1 : 0);
	_button = instance_create_depth(1680, 420, -20, obj_button);
	_button.image_index = 4;
	_button.cost = 0;
} else {
	instance_create_depth(2176, 888, depth - 1, obj_boss);
}