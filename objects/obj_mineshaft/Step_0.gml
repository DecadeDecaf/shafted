x -= g.shaftspeed;

if (track_end && x < 960 && g.shaftspeed > 0) {
	g.shaftspeed -= 0.1;
	if (!set_alarm) {
		alarm[0] = 90;
		set_alarm = true;
	}
}