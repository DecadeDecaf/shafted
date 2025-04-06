var _w = camera_get_view_width(camera);
var _h = camera_get_view_height(camera);

var _mid_w = (_w / 2);
var _mid_h = (_h / 2);

/*

if (instance_exists(obj_target)) {
	look_x = obj_target.x;
	look_y = obj_target.y;
}

*/

look_x = median(_mid_w, look_x, room_width - _mid_w);
look_y = median(_mid_h, look_y, room_height - _mid_h);

x += (look_x - x) / 12;
y += (look_y - y) / 12;

var _cam_x = median(_mid_w, x, room_width - _mid_w);
var _cam_y = median(_mid_h, y, room_height - _mid_h);

x = _cam_x;
y = _cam_y;

var _vm = matrix_build_lookat(_cam_x, _cam_y, -10, _cam_x, _cam_y, 0, 0, 1, 0);
camera_set_view_mat(camera, _vm);

if (!g.desktop) {
	var _display_w = display_get_width();
	var _display_h = display_get_height();
	if ((_display_w != last_display_w) || (_display_h != last_display_h)) {
		last_display_w = _display_w;
		last_display_h = _display_h;
		var _aspect_ratio = game_width / game_height;
		var _cpad = 10;
		var _cw = _display_w - _cpad;
		var _ch = _display_h - _cpad;
		var _c_aspect_ratio = _cw / _ch;
		var _scalew = _cw;
		var _scaleh = _ch;
		if (_aspect_ratio > _c_aspect_ratio) {
			_scalew = _cw;
			_scaleh = _scalew / _aspect_ratio;
		} else if (_aspect_ratio < _c_aspect_ratio) {
			_scaleh = _ch;
			_scalew = _scaleh * _aspect_ratio;
		}
		window_set_size(_scalew, _scaleh);
		view_wport[0] = _scalew;
		view_hport[0] = _scaleh;
		surface_resize(application_surface, _scalew, _scaleh);
		display_set_gui_size(game_width, game_height)
		window_center();
	}
}