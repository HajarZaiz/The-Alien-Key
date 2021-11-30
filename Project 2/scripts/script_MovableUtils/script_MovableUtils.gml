// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum MoveDirection {
	TopLeft, TopRight, BottomLeft, BottomRight, Idle
}

// Number of seconds to take to move a single tile
global.tileMovementSpeed = 0.5;

// Checks whether tileType is in movableTileTypes
function can_move_on_tile(tileType, movableTileTypes) {
	for (var i = 0; i < array_length(movableTileTypes); i++) {
		if (movableTileTypes[i] == tileType) return true;
	}
	return false;
}

// OUR COORDINATE SYSTEM -
// 00  20  40  60
//   11  31  51
// 02  22  42  62
//   13  33  53

// Returns struct of {x: Real, y: Real}
function get_screen_coords(tileX, tileY) {
	if (tileY % 2 == 0) {
		return {
			x: global.tileWidth / 2 + global.tileWidth * floor(tileX / 2),
			y: global.tileHeight / 2 + global.tileHeight * floor(tileY / 2)
		};
	}
	else {
		return {
			x: global.tileWidth + global.tileWidth * floor(tileX / 2),
			y: global.tileHeight + global.tileHeight * floor(tileY / 2)
		};
	}
}