if (fc % 7 == 0) {
	if (image_index >= 5) {
		instance_destroy();
	} else {
		image_index++;
	}
}