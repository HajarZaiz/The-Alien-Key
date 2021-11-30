/// @description Insert description here
// You can write your code in this editor

// Currently not moving/finished moving, prepare for next move if applicable
if (tileMovementProgress == -1.0) {
	switch (moveDirection) {
		case MoveDirection.TopLeft:
			if (can_move_on_tile(get_tile(tileX - 1, tileY - 1), movableTiles)) {
				// Move to the tile
				tileMovementProgress = 0.0;
				tileMovementBegin = current_time;
			}
			else tileMovementProgress = -2.0;
			break;
		case MoveDirection.TopRight:
			if (can_move_on_tile(get_tile(tileX + 1, tileY - 1), movableTiles)) {
				// Move to the tile
				tileMovementProgress = 0.0;
				tileMovementBegin = current_time;
			}
			else tileMovementProgress = -2.0;
			break;
		case MoveDirection.BottomLeft:
			if (can_move_on_tile(get_tile(tileX - 1, tileY + 1), movableTiles)) {
				// Move to the tile
				tileMovementProgress = 0.0;
				tileMovementBegin = current_time;
			}
			else tileMovementProgress = -2.0;
			break;
		case MoveDirection.BottomRight:
			if (can_move_on_tile(get_tile(tileX + 1, tileY + 1), movableTiles)) {
				// Move to the tile
				tileMovementProgress = 0.0;
				tileMovementBegin = current_time;
			}
			else tileMovementProgress = -2.0;
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
	
	var screenCoords = get_screen_coords(tileX, tileY);
	x = screenCoords.x;
	y = screenCoords.y;
}