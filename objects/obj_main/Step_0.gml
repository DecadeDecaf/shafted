handle_fullscreen();

if (!audio_is_playing(mus_theme)) {
	audio_play_sound(mus_theme, 1, true, 0.75);
}

if (g.won) {
	if (g.gfc % 3 == 0) {
		if (random(10) < 4) {
			instance_create_depth(random_range(0, 1920), -64, depth - 21, obj_confetti);
		}
	}
}