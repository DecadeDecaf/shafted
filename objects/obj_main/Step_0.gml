handle_fullscreen();

if (!audio_is_playing(mus_theme)) {
	audio_play_sound(mus_theme, 1, true, 0.75);
}