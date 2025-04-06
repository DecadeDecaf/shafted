if (position_meeting(mouse_x, mouse_y, id) && image_index != 5) {
	image_xscale += 0.025;
	image_yscale += 0.025;
	if (image_xscale > 1) { image_xscale = 1; }
	if (image_yscale > 1) { image_yscale = 1; }
	if (mouse_check_button_pressed(mb_left) && g.gold >= cost) {
		g.gold -= cost;
		cost = 0;
		switch (image_index) {
			case 0:
				g.max_pickaxes++; break;
			case 1:
				g.max_dynamite++; break;
			case 2:
				g.kart_speed++; break;
			case 3:
				g.tracklength += 3; break;
			case 4:
				reset_track(); break;
			default:
				break;
		}
		image_index = 5;
	}
} else {
	image_xscale -= 0.025;
	image_yscale -= 0.025;
	if (image_xscale < 0.9) { image_xscale = 0.9; }
	if (image_yscale < 0.9) { image_yscale = 0.9; }
}