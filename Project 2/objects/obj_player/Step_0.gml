event_inherited();

if (tileMovementProgress == -2.0) {
	
	// Inputs
	var left = keyboard_check(ord("A")) || keyboard_check(vk_left);
	var right = keyboard_check(ord("D")) || keyboard_check(vk_right);
	var up = keyboard_check(ord("W")) || keyboard_check(vk_up);
	var down = keyboard_check(ord("S")) || keyboard_check(vk_down);
	
	// Set the movement based on the inputs
	if (up && left) {
		moveDirection = MoveDirection.TopLeft;
		sprite_index = spr_PlayerTopLeft;
	}
	else if (up && right) {
		moveDirection = MoveDirection.TopRight;
		sprite_index = spr_PlayerTopRight;
	}
	else if (down && left) {
		moveDirection = MoveDirection.BottomLeft;
		sprite_index = spr_PlayerBottomLeft;
	}
	else if (down && right) {
		moveDirection = MoveDirection.BottomRight;
		sprite_index = spr_PlayerBottomRight;
	}
	else moveDirection = MoveDirection.Idle;
	
	if (moveDirection != MoveDirection.Idle) {
		tileMovementProgress = -1.0;
		previousDirection = moveDirection;
	}
}

// Cheat Codes

if (keyboard_check(vk_alt) || keyboard_check(vk_shift)) {

	//Add Spikes to inventory
	if(keyboard_check_pressed(ord("S"))) {
		pickupItemNoDestroy(InventoryItem.Spikes);
		audio_play_sound(sound_Collectible, 2, false);
	}
	//Add Water Shoe to inventory
	if(keyboard_check_pressed(ord("W"))) {
		pickupItemNoDestroy(InventoryItem.WaterShoe);
		audio_play_sound(sound_Collectible, 2, false);
	}

	//Add LavaShoe to inventory
	if(keyboard_check_pressed(ord("L"))) {
		pickupItemNoDestroy(InventoryItem.LavaShoe);
		audio_play_sound(sound_Collectible, 2, false);
	}

	//Increase lives
	if(keyboard_check_pressed(ord("H"))) {
		audio_play_sound(sound_Collectible, 2, false);
		if(lives < 6){
			lives = lives + 1;
		}
	}
}