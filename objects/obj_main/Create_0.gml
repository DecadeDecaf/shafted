#macro g global
#macro o other

g.gfc = 0;

g.won = false;
g.dead = false;
g.gold = 0;

g.tracklength = 6;
g.max_pickaxes = 1;
g.max_dynamite = 0;
g.kart_speed = 0;

g.pickaxes = g.max_pickaxes;
g.dynamite = g.max_dynamite;

g.shaftspeed = 8;

g.desktop = (os_browser == browser_not_a_browser);

window_set_size(1920, 1080);
display_reset(8, true);

exception_unhandled_handler(error);
draw_set_circle_precision(64);

g.vol = 0.75;
audio_master_gain(g.vol);

audio_play_sound(mus_theme, 1, true, 0.75);

randomize();

generate_mineshaft();