/// @description Insert description here
// You can write your code in this editor

tileX = 0;
tileY = 0;

// This should be updated in the step event whenever the tileMovementProgress is -2.0
moveDirection = MoveDirection.Idle;

// This should be overrided by the inherited instance based on the object's properties
movableTiles = [TileType.Ground];

// The tile movement progress, this is between 0 and 1 and is only defined
// when moveDirection is not idle, -1 means it is currently idle
// When this is -2.0 then the inherited instance should reset/update the move direction
tileMovementProgress = -2.0;

// The number of milliseconds since the game has begun when the movement begins
// Used internally for calculating tile movement progress
tileMovementBegin = -1.0;