/// @description Insert description here
// You can write your code in this editor

// Currently not moving/finished moving, prepare for next move if applicable
if (tileMovementProgress == -1.0) {
	// show_debug_message("I'm here");
	switch (moveDirection) {
		case MoveDirection.TopLeft:
			if (can_move_on_tile(get_tile(tileX - 1, tileY - 1), movableTiles)) {
				// show_debug_message("I'm allowed to move");
				// Move to the tile
				tileMovementProgress = 0.0;
				tileMovementBegin = current_time;
			}
			else { 
				// show_debug_message("I'm not allowed to move");
				tileMovementProgress = -2.0;
			}
			break;
		case MoveDirection.TopRight:
			if (can_move_on_tile(get_tile(tileX + 1, tileY - 1), movableTiles)) {
				// show_debug_message("I'm allowed to move");
				// Move to the tile
				tileMovementProgress = 0.0;
				tileMovementBegin = current_time;
			}
			else { 
				// show_debug_message("I'm not allowed to move");
				tileMovementProgress = -2.0;
			}
			break;
		case MoveDirection.BottomLeft:
			if (can_move_on_tile(get_tile(tileX - 1, tileY + 1), movableTiles)) {
				// show_debug_message("I'm allowed to move");
				// Move to the tile
				tileMovementProgress = 0.0;
				tileMovementBegin = current_time;
			}
			else { 
				// show_debug_message("I'm not allowed to move");
				tileMovementProgress = -2.0;
			}
			break;
		case MoveDirection.BottomRight:
			if (can_move_on_tile(get_tile(tileX + 1, tileY + 1), movableTiles)) {
				// show_debug_message("I'm allowed to move");
				// Move to the tile
				tileMovementProgress = 0.0;
				tileMovementBegin = current_time;
			}
			else { 
				// show_debug_message("I'm not allowed to move");
				tileMovementProgress = -2.0;
			}
			break;
		default:
			break;
	}
	
}


// Currently moving
if (tileMovementProgress >= 0.0 && tileMovementProgress < 1.0) {
	
	// Update tileMovementProgress
	tileMovementProgress = (current_time - tileMovementBegin) / (global.tileMovementSpeed * 1000);
	tileMovementProgress = clamp(tileMovementProgress, 0, 1);
	
	// Calculate Movement
	var nextPos = get_screen_coords(tileX, tileY);
	var pos = {x: nextPos.x, y: nextPos.y};
	
	switch (moveDirection) {
		case MoveDirection.TopLeft:
			nextPos.x -= global.tileWidth/2;
			nextPos.y -= global.tileHeight/2;
			break;
		case MoveDirection.TopRight:
			nextPos.x += global.tileWidth/2;
			nextPos.y -= global.tileHeight/2;
			break;
		case MoveDirection.BottomLeft:
			nextPos.x -= global.tileWidth/2;
			nextPos.y += global.tileHeight/2;
			break;
		case MoveDirection.BottomRight:
			nextPos.x += global.tileWidth/2;
			nextPos.y += global.tileHeight/2;
			break;
		default:
			// Should be impossible
			break;
	}
	
	x = pos.x + tileMovementProgress * (nextPos.x - pos.x);
	y = pos.y + tileMovementProgress * (nextPos.y - pos.y);
}

// Finished Moving
if (tileMovementProgress >= 1.0) {
	tileMovementProgress = -2.0;
	switch (moveDirection) {
		case MoveDirection.TopLeft:
			tileX--;
			tileY--;
			break;
		case MoveDirection.TopRight:
			tileX++;
			tileY--;
			break;
		case MoveDirection.BottomLeft:
			tileX--;
			tileY++;
			break;
		case MoveDirection.BottomRight:
			tileX++;
			tileY++;
			break;
		default:
			// Should be impossible
			break;
	}
	
	currentTileType = get_tile(tileX, tileY);
	
	var screenCoords = get_screen_coords(tileX, tileY);
	x = screenCoords.x;
	y = screenCoords.y;
}

if (currentTileType == TileType.Ground && tileMovementProgress != -2.0) {
	part_particles_create(global.particleSystem, x, y, global.dustParticle, 10);
}
if (currentTileType == TileType.Water) {
	part_particles_create(global.particleSystem, x, y, global.waterParticle, 10);
}
if (currentTileType == TileType.Lava) {
	part_particles_create(global.particleSystem, x, y, global.lavaParticle, 10);
}
