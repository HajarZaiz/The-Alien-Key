/// @description Insert description here
// You can write your code in this editor

if (!playedDropped) {
	if (x <= dropPlayerX) {
		obj_player.visible = true;
		if (obj_player.y < dropPlayerY) {
			obj_player.y += 10;
		}
		else {
			obj_player.x = dropPlayerX;
			obj_player.y = dropPlayerY;
			playedDropped = true;
			instance_create_layer(0, 0, layer, obj_cutscene);
		}
	}
	else {
		obj_player.x = x;
		obj_player.y = y;
	}
}

if (x < -300) {
	part_type_destroy(particleType);
	instance_destroy();
}
else {
	part_particles_create(global.particleSystem, x, y, particleType, 10);
}
